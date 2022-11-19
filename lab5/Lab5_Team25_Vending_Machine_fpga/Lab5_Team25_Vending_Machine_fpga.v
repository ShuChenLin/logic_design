`timescale 1ns/1ps

module Vending_Machine_fpga(clk, rst, pb_left, pb_mid, pb_right, cancel, sw, an, seg, PS2_DATA, PS2_CLK);

    input clk;
    input rst;
    input pb_left, pb_mid, pb_right, cancel;
    inout PS2_DATA, PS2_CLK;
    output [3:0] sw, an;
    output [7:0] seg;

    wire rst_debounced, pb_left_debounced, pb_mid_debounced, pb_right_debounced, cancel_debounced;
    wire rst_op, pb_left_op, pb_mid_op, pb_right_op, cancel_op;
    wire display_clk;
    reg [1:0] state, next_state;
    reg [3:0] drink, an;
    reg [6:0] money, next_money;
    reg [7:0] seg;
    reg [3:0] buy;
    reg [26:0] sec, next_sec;
    reg [1:0] position, next_position;

    debounced d0(clk, rst, rst_debounced);
    debounced d1(clk, pb_left, pb_left_debounced);
    debounced d2(clk, pb_mid, pb_mid_debounced);
    debounced d3(clk, pb_right, pb_right_debounced);
    debounced d4(clk, cancel, cancel_debounced);

    one_pulse o0(clk, rst_debounced, rst_op);
    one_pulse o1(clk, pb_left_debounced, pb_left_op);
    one_pulse o2(clk, pb_mid_debounced, pb_mid_op);
    one_pulse o3(clk, pb_right_debounced, pb_right_op);
    one_pulse o4(clk, cancel_debounced, cancel_op);

    clk_div c0(clk, display_clk);

    parameter money_in = 2'b00;
    parameter money_out = 2'b01;
    parameter BUY = 2'b10;

    //LIGHT=====================================
    assign sw[3] = (money >= 80);
    assign sw[2] = (money >= 30);
    assign sw[1] = (money >= 25);
    assign sw[0] = (money >= 20);
    //==========================================

    //keyboard==================================
    parameter [8:0] KEY_CODES_A = 28; // 0 => 45
    parameter [8:0] KEY_CODES_S = 27; // 1 => 16 
    parameter [8:0] KEY_CODES_D = 35; // 2 => 1E
    parameter [8:0] KEY_CODES_F = 43; // 3 => 26

    wire [511:0] key_down;
    wire [8:0] last_change;
    wire been_ready;

    KeyboardDecoder key_de (
        .key_down(key_down),
        .last_change(last_change),
        .key_valid(been_ready),
        .PS2_DATA(PS2_DATA),
        .PS2_CLK(PS2_CLK),
        .rst(rst),
        .clk(clk)
    );

    always @ (*) begin
        case (last_change)
            KEY_CODES_A : drink = 4'b1000;
            KEY_CODES_S : drink = 4'b0100;
            KEY_CODES_D : drink = 4'b0010;
            KEY_CODES_F : drink = 4'b0001;
            8'b0 : drink = 4'b0000;
            default : drink  = 4'b0000;
        endcase
    end

    //==========================================

    //BUY=======================================
    always @(*) begin
        case (drink) 
            4'b1000 : begin
                if (money >= 80) buy = drink;
            end
            4'b0100 : begin
                if (money >= 30) buy = drink;
            end
            4'b0010 : begin
                if (money >= 25) buy = drink;
            end
            4'b0001 : begin
                if (money >= 20) buy = drink;
            end
            default : begin
                buy = 0;
            end
        endcase
    end
    //===========================================

    //ONE SECOND=================================
    always @(*) begin
        if (state == money_out) begin
            if (sec == 100000000) next_sec = 0;
            else next_sec = sec + 1;
        end else if (state == BUY) begin
            if (sec == 100000000) next_sec = 0;
            else next_sec = sec + 1;
        end else next_sec = 0;
    end

    always @(posedge clk) begin
        if (rst) sec <= 0;
        else begin
            if (state == money_out) begin
                sec <= next_sec;
            end else if (state == BUY) begin
                sec <= next_sec;
            end else sec <= 0;
        end
    end
    //===========================================

    //BUTTON=====================================
    always @(*) begin
        case (state) 
            money_in : begin
                if (pb_left_op) begin
                    next_money = (((money + 5) > 100) ? 100 : money + 5) ; //+5
                end else if (pb_mid_op) begin
                    next_money = (((money + 15) > 100) ? 100 : money + 10); //+10
                end else if (pb_right_op) begin
                    next_money = (((money + 50) > 100) ? 100 : money + 50); //+50
                end else begin
                    next_money = money;
                end
            end
            BUY : begin
                case (buy) 
                    4'b1000 : next_money = money - 80; 
                    4'b0100 : next_money = money - 30;
                    4'b0010 : next_money = money - 25;
                    4'b0001 : next_money = money - 20;
                    default : next_money = money;
                endcase
            end
            money_out : begin
                if (sec == 0) begin
                    next_money = (money > 4) ? money - 5 : 0;
                end else begin
                    next_money = money;
                end
            end
            default : begin
                next_money = money;
            end
        endcase
    end

    always @(posedge clk) begin
        if (rst) begin
            money <= 0;
        end else begin
            if (state == BUY) begin
                if (sec == 200) money <= next_money;
            end else money <= next_money;
        end
    end
    //================================================

    //FSM=============================================
    always @(*) begin
        case (state) 
            money_in : begin
                if (been_ready && key_down[last_change] == 1) begin
                    case (buy)
                        4'b0001 : next_state = ((money >= 20) ? BUY : money_in);
                        4'b0010 : next_state = ((money >= 25) ? BUY : money_in);
                        4'b0100 : next_state = ((money >= 20) ? BUY : money_in);
                        4'b1000 : next_state = ((money >= 80) ? BUY : money_in);
                        default : next_state = money_in;
                    endcase
                end
                else next_state = money_in;
            end
            BUY : begin
                if (sec[26] == 1) begin
                    next_state = money_out;
                end else next_state = BUY;
            end
            money_out : begin
                if (money == 0) next_state = money_in;
                else next_state = money_out;
            end
            default : begin
                next_state = money_in;
            end
        endcase
    end

    always @(posedge clk) begin
        if (rst) begin
            state <= money_in;
        end else begin
            state <= next_state;
        end
    end
    //================================================

    //7-seg===========================================
    wire [7:0] digit [10:0];
    assign digit[0] = 8'b00000011;
    assign digit[1] = 8'b10011111;
    assign digit[2] = 8'b00100101;
    assign digit[3] = 8'b00001101;
    assign digit[4] = 8'b10011001;
    assign digit[5] = 8'b01001001;
    assign digit[6] = 8'b01000001;
    assign digit[7] = 8'b00011011;
    assign digit[8] = 8'b00000001;
    assign digit[9] = 8'b00001001;
    assign digit[10] = 8'b11111111;

    always @(posedge clk) begin
        if (display_clk) begin
            case (position) 
                2'b00 : an <= 4'b1110;
                2'b01 : an <= 4'b1101;
                2'b10 : an <= 4'b1011;
                2'b11 : an <= 4'b1111;
                default : an <= 4'b1111;
            endcase
        end
    end

    wire [3:0] first, second, third;

    assign first = money % 10;
    assign second = (money == 100) ? 0 : ((money > 9) ? (money / 10) : 10);
    assign third = (money == 100) ? 1 : 10;

    always @(posedge clk) begin
        if (display_clk) begin
            case(position)
                2'b00 : begin
                    seg <= digit[first]; 
                end
                2'b01 : begin
                    seg <= digit[second];
                end
                2'b10 : begin
                    seg <= digit[third];
                end
                default : begin
                    seg <= digit[10];
                end
            endcase
        end
    end

    always @(*) begin
        next_position = position + 1;
    end

    always @(posedge clk) begin
        if (display_clk) begin
            position <= next_position;
        end
    end
    //================================================

endmodule

module debounced(clk, pb, pb_debounced);
    
    input clk, pb;
    output pb_debounced;

    reg [3:0] DFF;

    always @(posedge clk) begin
        DFF[3:1] <= DFF[2:0];
        DFF[0] <= pb;
    end

    assign pb_debounced = ((DFF == 4'b1111) ? 1'b1 : 1'b0);

endmodule

module one_pulse (clk, pb_debounced, pb_one_pulse);
    
    input clk, pb_debounced;
    output pb_one_pulse;

    reg pb_one_pulse, pb_debounced_delay;

    always @(posedge clk) begin
        pb_one_pulse <= (pb_debounced & (!pb_debounced_delay));
        pb_debounced_delay <= pb_debounced;
    end

endmodule

module clk_div #(parameter n = 16) (clk, div_clk);
    
    input clk;
    output div_clk;

    reg [n-1:0] cnt;
    wire [n-1:0] next_cnt;

    always @(posedge clk) begin
        cnt <= next_cnt;
    end

    assign next_cnt = cnt + 1;
    assign div_clk = (cnt == 0);

endmodule

`timescale 1ns/1ps

module fpga(clk, rst_n, start, enter, sw, seg, an, light);

    input clk, rst_n, start, enter;
    input [4-1:0] sw;
    output reg [4-1:0] an;
    output reg [8-1:0] seg;
    output reg [16-1:0] light;

    wire display_clk;
    wire [8-1:0] digit [16-1:0];
    reg [7-1:0] display_cnt, next_dis_cnt;
    reg [2-1:0] display_pos, next_pos;
    reg [8-1:0] dout, dis1, dis2, dis3, dis4;
    wire [8-1:0] random_num1, random_num2;
    reg [4-1:0] ans1, ans2, ans3, an4, done, next_done;
    reg [16-1:0] desire_num, next_desire;
    reg [2-1:0] state, next_state
    reg correct;
    reg [3-1:0] A, B, next_A, next_B;

    parameter INITIAL = 2'b00;
    parameter GUESSING = 2'b01;
    parameter RESULT = 2'b10;

    clk_div #(.n(17)) c1(clk, display_clk);
    debounced d0(clk, rst_n, rst_n_debounced);
    debounced d1(clk, start, st_debounced);
    debounced d2(clk, enter, enter_debounced);

    one_pulse o0(clk, rst_n_debounced, rst_n_one_pulse);
    one_pulse o1(clk, st_debounced, st_one_pulse);
    one_pulse o2(clk, enter_debounced, enter_one_pulse);

    // generating random answer========================
    LFSR lfsr1(clk, rst_n, random_num1);
    LFSR lfsr2(clk, rst_n, random_num2);

    always @(*) begin
        case (state)
            GUESSING : begin
                light[15:12] = ans1;
                light[11:8] ans2;
                light[7:4] ans3;
                light[3:0] ans4;
            end
            ANSWER : begin
                light[15:12] = ans1;
                light[11:8] ans2;
                light[7:4] ans3;
                light[3:0] ans4;
            end
            default : begin
                light = 16'b0;
            end
        endcase
    end

    always @(*) begin
        if (state == INITIAL && st_one_pulse) begin
            ans1 = random_num1[7:4];
            ans2 = random_num1[3:0];
            ans3 = random_num2[7:4];
            ans4 = random_num2(3:0];
            if (ans1 > 4'b1001) ans1 = ans1 - 4'b1001;
            if (ans2 > 4'b1001) ans2 = ans2 - 4'b1001;
            if (ans3 > 4'b1001) ans3 = ans3 - 4'b1001;
            if (ans4 > 4'b1001) ans4 = ans4 - 4'b1001;
            //careful about bigger than 9
            if (ans1 == ans2) ans2 = ans2 + 4'b0001;
            if (ans1 == ans3) ans3 = ans3 + 4'b0001;
            if (ans2 == ans3) ans3 = ans3 + 4'b0001;
            if (ans1 == ans4) ans4 = ans4 + 4'b0001;
            if (ans2 == ans4) ans4 = ans4 + 4'b0001;
            if (ans3 == ans4) ans4 = ans4 + 4'b0001;
        end else begin
            ans1 = ans1;
            ans2 = ans2;
            ans3 = ans3;
            ans4 = ans4;
        end
    end
    //==================================================

    //FSM===============================================
    always @(posedge clk) begin
        if (!rst_n_one_pulse) begin
            state <= INITIAL;
        end else begin
            state <= next_state;
        end
    end

    always @(*) begin
        case (state) 
            INITIAL : begin
                if (st_one_pulse) next_state = GUESSING;
                else next_state = INITIAL;
            end
            GUESSING : begin
                if (done == 4'b1111 && enter_one_pulse) next_state = ANSWER;
                else next_state = GUESSING;
            end
            ANSWER : begin
                
            end
            default : begin
                next_state = next_state;
            end
        endcase
    end
    //==================================================

    //input=============================================

    always @(posedge clk) begin
        if (!rst_n_one_pulse) begin
            desire_num <= 16'b0;
        end else begin
            if (state == GUESSING) desire_num <= next_desire;
            else desire_num <= 16'b0;
        end
    end

    always @(*) begin
        case (state)
            INITIAL : begin
                next_desire = 16'b0;
            end
            GUESSING : begin
                if (enter_one_pulse) begin
                    next_desire[15:12] = desire_num[11:8];
                    next_desire[11:8] = desire_num[7:4];
                    next_desire[7:4] = desire_num[3:0];
                    next_desire[3:0] = sw; 
                end else begin
                    next_desire = next_desire;        
                end
            end
            default : begin
                next_desire = 16'b0;
            end
        endcase
    end

    always @(posedge clk) begin
        if (!rst_n_one_pulse) begin
            done <= 4'b0001;
        end else begin
            if (state == GUESSING) done <= next_done;  
        end
    end

    always @(*) begin
        next_done = done;
        case (state)
            INITIAL : begin
                next_done = 4'b0001;
            end
            GUESSING : begin
                if (enter_one_pulse) begin
                    if (done == 4'b1111) begin
                        next_done = 4'b0001;
                    end else begin
                        next_done = {done[2:0], 1'b1};
                    end
                end else begin
                    next_done = done;
                end
            end
            default : begin
                next_done = 4'b0001;
            end
        endcase
    end
    //==================================================

    //judge=============================================

    always @(posedge clk) begin
        if (!rst_n_one_pulse) begin
            A <= 4'b0;
            B <= 4'b0
        end else begin
            if (state == GUESSING && enter_one_pulse) begin
                A <= next_A;
                B <= next_B;
            end
        end
    end

    always @(*) begin
        next_A = 0; next_B = 0;
        if (state == ANSWER) begin
            // maybe there are some problems
            if (ans1 == desire_num[15:12]) next_A = next_A + 1;
            if (ans2 == desire_num[11:8]) next_A = next_A + 1;
            if (ans3 == desire_num[7:4]) next_A = next_A + 1;
            if (ans4 == desire_num[3:0]) next_A = next_A + 1;
            for (integer i = 0; i < 15; i = i + 4) begin
                if (ans1 == desire_num[i+3:i]) next_B = next_B + 1;
                if (ans2 == desire_num[i+3:i]) next_B = next_B + 1;
                if (ans3 == desire_num[i+3:i]) next_B = next_B + 1;
                if (ans4 == desire_num[i+3:i]) next_B = next_B + 1;    
            end
        end
    end
    //==================================================

    //diplay num========================================
    always @(*) begin
        next_dis_cnt = display_cnt + 1;
    end
    always @(posedge display_clk) begin
        display_cnt <= next_dis_cnt;
        display_pos <= display_pos + 1;  
        case (display_pos)
            2'b00 : begin
                if (state == GUESSING) begin
                    if (display_cnt == 0) an <= 4'b1110;
                    else an <= 4'b1111;
                end else an <= 4'b1110;
            end
            2'b01 : begin
                ans <= 4'b1101;
            end
            2'b10 : begin
                ans <= 4'b1011;
            end
            2'b11 : begin
                ans <= 4'b0111;
            end
        endcase
    end

    always @(posedge display_clk) begin
        case (state)
            INITIAL : begin
                case (display_pos)
                    2'b00 : seg <= digit[11];
                    2'b01 : seg <= digit[2];
                    2'b10 : seg <= digit[10];
                    2'b11 : seg <= digit[1];
                end
            end
            GUESSING : begin
                case (display_pos)
                    2'b00 : seg <= desire_num[3:0];
                    2'b01 : seg <= desire_num[7:4];
                    2'b10 : seg <= desire_num[11:8];
                    2'b11 : seg <= desire_num[15:12];
                endcase
            end
            ANSWER : begin
                case (display_pos)
                    2'b00 : seg <= digit[11]; //B
                    2'b01 : seg <= digit[B]; //# of B
                    2'b10 : seg <= digit[10]; //A
                    2'b11 : seg <= digit[A]; //# of A
                endcase
            end
        endcase
    end
    //==================================================

    //7-segment=========================================
    assign digit[0] = 8'b00000011;
    assign digit[1] = 8'b10011111;
    assign digit[2] = 8'b00100101;
    assign digit[3] = 8'b00001101;
    assign digit[4] = 8'b10011001;
    assign digit[5] = 8'b01001001;
    assign digit[6] = 8'b01000001;
    assign digit[7] = 8'b00011111;
    assign digit[8] = 8'b00000001;
    assign digit[9] = 8'b00001001;
    assign digit[10] = 8'b00010001;
    assign digit[11] = 8'b11000001;

endmodule

module LFSR(clk, rst_n, out);
    
    input clk;
    input rst_n;
    output reg [8-1:0] out;

    wire tmp1, tmp2, tmp3;

    xor x0(tmp1, out[7], out[1]);
    xor x1(tmp2, out[7], out[2]);
    xor x2(tmp3, out[7], out[3]);

    always @(posedge clk) begin
        if (!rst_n) begin
            out <= 8'b10111101;
        end else begin
            out[0] <= out[7];
            out[1] <= out[0];
            out[2] <= tmp1;
            out[3] <= tmp2;
            out[4] <= tmp3;
            out[5] <= out[4];
            out[6] <= out[5];
            out[7] <= out[6];
        end
    end

endmodule

module debounce(clk, pb, pb_debounced);
    
    input clk, pb;
    output pb_debounced;

    reg [3:0] DFF;

    always @(posedge clk) begin
        DFF[3:1] <= DFF[2:0];
        DFF[0] <= pb;
    end

    assign pb_debounced = ((DFF == 4'b1111) ? 1'b1 : 1'b0);

endmodule

module one_pulse(clk, pb_debounced, pb_one_pulse);

    input clk, pb_debounced;
    output pb_one_pulse;

    reg pb_one_pulse, pb_debounced_delay;

    always @(posedge clk) begin
        pb_one_pulse <= (pb_debounced & (!pb_debounced_delay));
        pb_debounced <= pb_debounced;
    end

endmodule

module clk_div #(parameter n = 24) (clk, div_clk);
    
    input clk;
    output div_clk;

    reg [n-1:0] cnt;
    wire [n-1:0] next_cnt;

    always @(posedge clk) begin
        cnt <= next_clk;
    end

    assign next_cnt = cnt + 1;
    assign div_clk = cnt[n-1];

endmodule

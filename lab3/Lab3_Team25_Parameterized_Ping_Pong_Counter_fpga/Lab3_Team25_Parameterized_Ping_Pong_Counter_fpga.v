`timescale 1ns/1ps

module Parameterized_Ping_Pong_Counter (clk, rst_n, enable, flip, max, min, direction, out);
input clk, rst_n;
input enable;
input flip;
input [4-1:0] max;
input [4-1:0] min;
output direction;
output [4-1:0] out;

reg [4-1:0] out;
reg direction;

always @(posedge clk) begin
    if (~rst_n) begin
        out <= min;
        direction <= 1;
    end 
    else if (enable) begin
        if (out > max || out < min) begin

        end
        else if (max === min) begin
            
        end
        else if (out === max && direction) begin
            out <= out-1;
            direction <= ~direction;
        end
        else if (out === min && ~direction) begin
            out <= out+1;
            direction <= ~direction;
        end 
        else begin
            if (flip && out != min && out != max) begin
                direction <= ~direction;
            end
            out <= direction ? out+1 : out-1;
        end
    end
end

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

module one_pulse(clk, pb_debounced, pb_one_pulse):

    input clk, pb_debounced;
    output pb_one_pulse;

    reg pb_one_pulse, pb_debounced_delay;

    always @(posedge clk) begin
        pb_one_pulse <= pb_debounced & (!pb_debounced_delay);
        pb_debounced_delay <= pb_debounced;
    end

endmodule

module clk_div #(parameter n = 24) (clk, div_clk);
    
    input clk;
    output div_clk;

    reg [n-1:0] cnt;
    wire[n-1:0] next_cnt;

    always @(posedge clk) begin
        cnt <= next_num;
    end

    assign next_cnt = cnt + 1;
    assign div_clk = num[n-1];

endmodule

module FPGA_IMPLEMENTATION(clk, pb, rst_n, sw, control, out);
    
    input clk;
    input pb;
    input rst_n;
    input [15:0] sw;
    output reg [4-1:0] control;
    output reg [8-1:0] out;

    reg [8-1:0] digit [10-1:0];
    reg [8-1:0] mem [4-1:0];
    reg [2-1:0] pos;

    wire pb_debounced, pb_one_pulse;
    wire rst_n_debounced, rst_n_one_pulse;
    wire div_clk;
    wire div_16_clk;
    wire flag;
    wire [4-1:0] dout;
    //wire nrst_n;

    //not (nrst_n, rst_n);

    debounced debounced0(clk, rst_n, rst_n_debounced);
    debounced debounced1(clk, pb, pb_debounced);

    one_pulse one_pulse0(clk, pb_debounced, pb_one_pulse);
    one_pulse one_pulse1(clk, rst_n_debounced, rst_n_one_pulse);

    clk_div first_clk(clk, div_clk);
    clk_div #(.n(16)) second_clk(.clk(clk), .div_clk(div_16_clk));

    Parameterized_Ping_Pong_Counter P0(
        .clk(div_clk),
        .rst_n(rst_n_one_pulse),
        .enable(sw[15]),
        .flip(pb_one_pulse),
        .max(sw[14:11]),
        .min(sw[10:7]),
        .direction(flag),
        .out(dout)
    );

    always @(posedge div_16_clk) begin
        pos <= pos+1;
        case (pos)
            2'b00: begin
                control <= 4'b1011;
                out <= mem[0];
            end
            2'b01: begin
                control <= 4'b1101;
                out <= mem[1];
            end
            2'b10: begin
                control <= 4'b1110;
                out <= mem[2];
            end
            2'b11: begin
                control <= 4'b0111;
                out <= mem[3];
            end
            default: begin
                control <= 4'b0000;
                out <= 8'b00000000;
            end
        end
    end

    always @(*) begin
        digit[0] <= 8'b00000011;
        digit[1] <= 8'b10011111;
        digit[2] <= 8'b00100101;
        digit[3] <= 8'b00001101;
        digit[4] <= 8'b10011001;
        digit[5] <= 8'b01001001;
        digit[6] <= 8'b01000001;
        digit[7] <= 8'b00011111;
        digit[8] <= 8'b00000001;
        digit[9] <= 8'b00001001;
        if (dout < 4'b1010) begin
            mem[3] <= digit[0];
            mem[2] <= digit[dout];
        end
        else begin
            mem[3] <= digit[1];
            mem[2] <= digit[dout-4'b1010];
        end
        mem[0] <= flag ? 8'b00111011 : 8'b11000111;
        mem[1] <= flag ? 8'b00111011 : 8'b11000111;
   end

endmodule


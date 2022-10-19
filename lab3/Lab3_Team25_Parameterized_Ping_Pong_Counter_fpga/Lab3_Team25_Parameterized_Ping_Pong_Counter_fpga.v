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

module one_pause(clk, pb_debounced, pb_one_pulse):

    input clk, pb_debounced;
    output pb_one_pulse;

    reg pb_one_pulse, pb_debounced_delay;

    always @(posedge clk) begin
        pb_one_pulse <= pb_debounced & (!pb_debounced_delay);
        pb_debounced_delay <= pb_debounced;
    end

endmodule

module FPGA_IMPLEMENTATION(clk, pb, sw, control, out);
    
    input clk;
    input pb;
    input [15:0] sw;
    output [4-1:0] control;
    output reg [8-1:0] out [4-1:0];

    parameter [8-1:0] up = 8'b00111011;
    parameter [8-1:0] down = 8'b11000111; 
    
    reg [8-1:0] digit [10-1:0];

    wire pb_debounced;

    debounced debounced0(clk, pb, pb_debounced);
    one_pause one_pause0(clk, pb_debounced, pb_one_pause);

//    Parameterized_Ping_Pong_Counter(clk, 
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
        out[0] <= direction ? up : down;
        out[1] <= direction ? up : down;
    end

    always @(pb)




endmodule

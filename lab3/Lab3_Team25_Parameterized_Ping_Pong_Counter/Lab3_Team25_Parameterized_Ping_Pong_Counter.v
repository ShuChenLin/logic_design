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

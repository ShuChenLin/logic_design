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

reg [4-1:0] next_out;
reg next_direction;

always @(*) begin
    if (enable) begin
        if (out > max || out < min || max <= min) begin
            next_out = out;
            next_direction = direction;
        end else begin
            if (out === max && direction === 1'b1) begin
                next_out = out-4'b1;
                next_direction = ~direction;
            end else if (out === min && direction === 1'b0) begin
                next_out = out+4'b1;
                next_direction = ~direction;
            end else begin
                if (flip && out > min && out < max) begin
                    next_out = ~direction ? out + 4'b1 : out-4'b1;
                    next_direction = ~direction;
                end else begin
                    next_out = direction ? out + 4'b1 : out - 4'b1;
                    next_direction = direction;
                end
            end
        end
    end else begin
        next_out = out;
        next_direction = direction;
    end
end

always @(posedge clk) begin
    if (~rst_n) begin
        out <= min;
        direction <= 1;
    end 
    else begin
        out <= next_out;
        direction <= next_direction;
    end
end

endmodule

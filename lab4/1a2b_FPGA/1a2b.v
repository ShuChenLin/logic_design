`timescale 1ns/1ps

module 7display(clk, rst_n, numbers, control, out);
    input clk;
    input rst_n;
    input [4-1:0] numbers [4-1:0];
    output reg [4-1:0] control;
    output reg [8-1:0] out;

    reg [2-1:0] count;
    reg [2-1:0] next_count;

    always @(*) begin
        next_count = count+1'b1;
        control = 1'b1 << count;
        case (numbers[count])
            4'b0000: out = 
            4'b0001: 
            4'b0010: 
            4'b0011: 
            4'b0100: 
            4'b0101: 
            4'b0110: 
            4'b0111: 
            4'b1000: 
            4'b1001: 
        endcase
    end

    always @(posedge clk) begin
        if (!rst_n) begin
            count <= 1'b0;
        end else begin
            count <= next_count;
        end
    end

endmodule

module 

module 1a2b()

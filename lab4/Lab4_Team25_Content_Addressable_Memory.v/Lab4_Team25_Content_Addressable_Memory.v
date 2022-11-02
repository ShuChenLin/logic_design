`timescale 1ns/1ps

module Content_Addressable_Memory(clk, wen, ren, din, addr, dout, hit);

    input clk;
    input wen, ren;
    input [7:0] din;
    input [3:0] addr;
    output [3:0] dout;
    output hit;

    reg [4-1:0] dout;
    reg hit;
    reg [8-1:0] memory [16-1:0];
    wire [4-1:0] next_dout;
    wire next_hit;

    always @(posedge clk) begin
        
    end

    always @(*) begin
        
    end

endmodule

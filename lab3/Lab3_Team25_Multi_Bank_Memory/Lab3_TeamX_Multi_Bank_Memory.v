`timescale 1ns/1ps

module Memory (clk, ren, wen, addr, din, dout);

    input clk;
    input ren, wen;
    input [7-1:0] addr;
    input [8-1:0] din;
    output [8-1:0] dout;
    output [8-1:0] my_memory [128-1:0];

    reg [8-1:0] dout;
    reg [8-1:0] my_memory [128-1:0];

    always @(posedge clk) begin
        if (ren)begin
            dout[8-1:0] <= my_memory[addr];
        end else begin
            dout <= 0;
        end
    end
    
    always @(posedge clk) begin
        if (wen && !ren) begin
            my_memory[addr] <= din[8-1:0];
        end else begin
            my_memory[addr] <= my_memory[addr];
        end
    end

endmodule

module Bank(clk, ren, wen, radder, wadder, din, dout);

    input clk, ren, wen;
    input [11-1:0] radder, wadder;
    output [8-1:0] din;
    output [8-1:0] dout;

endmodule


module Bank_4(clk, ren, wen, radder, wadder, din, dout);

    input clk, ren, wen;
    input [11-1:0] radder, wadder;
    output [8-1:0] din;
    output [8-1:0] dout;

    always @(posedge clk) begin
    end

endmodule


module Multi_Bank_Memory (clk, ren, wen, waddr, raddr, din, dout);

    input clk;
    input ren, wen;
    input [11-1:0] waddr;
    input [11-1:0] raddr;
    input [8-1:0] din;
    output [8-1:0] dout;




endmodule

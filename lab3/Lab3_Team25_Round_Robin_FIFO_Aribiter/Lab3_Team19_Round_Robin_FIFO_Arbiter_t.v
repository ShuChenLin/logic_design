`timescale 1ns/1ps

module Round_Robin_FIFO_Arbiter_t;
reg clk=1'b0;
reg rst_n=1'b0;
reg [4-1:0] wen=4'd0;
reg [8-1:0] a=8'd0, b=8'd0, c=8'd0, d=8'd0;
wire [8-1:0] dout;
wire valid;
Round_Robin_FIFO_Arbiter RRF(clk, rst_n, wen, a, b, c, d, dout, valid);
parameter cyc = 10;
always#(cyc/2)clk = !clk;

initial begin
    $dumpfile("rrfa.vcd");
    $dumpvars("+all");
end

initial begin
    @(negedge clk)
    a=8'd87;
    b=8'd56;
    c=8'd9;
    d=8'd13;
    wen = 4'b1111;
    rst_n = 1'b1;
    @(negedge clk)
    a=8'dx;
    b=8'dx;
    c=8'dx;
    d=8'd85;
    wen = 4'b1000;
    @(negedge clk)
    c=8'd139;
    d=8'dx;
    wen=4'b0100;
    @(negedge clk)
    c=8'dx;
    wen=4'd0;
    @(negedge clk)
    @(negedge clk)
    @(negedge clk)
    a=8'd51;
    wen = 4'b0001;
    @(negedge clk)
    a=8'dx;
    wen = 4'd0;
    @(negedge clk)
    @(negedge clk)
    rst_n=1'b0;
    @(negedge clk)
    @(negedge clk)
    wen = 4'b0011;
    a=8'd45;
    b=8'd78;
    @(negedge clk)
    rst_n=1'b1;
    @(negedge clk)
    wen=4'd0;
    @(negedge clk)
    @(negedge clk)
    $finish;
end

endmodule

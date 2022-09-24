`timescale 1ns/1ps

module Toggle_Flip_Flop_t;
reg clk = 1'b0;
reg t = 1'b0;
reg rst_n = 1'b0;
wire q;

always#(1) clk = ~clk;

Toggle_Flip_Flop m1(
    .clk (clk),
    .q (q),
    .t (t),
    .rst_n (rst_n)
);

initial begin
    $dumpfile("Tff.vcd");
    $dumpvars("+all");
end

initial begin
    @(negedge clk) t = 1'b1;
    rst_n <= 1;
    @(negedge ~clk) t = 1'b0;
    @(negedge clk) $finish;
end

endmodule

`timescale 1ns/1ps

module Ping_Pong_Counter_t;
    
    reg clk = 1'b0;
    reg rst_n = 1'b1;
    reg enable = 1'b0;
    wire direction;
    wire [4-1:0] out;

    parameter cyc = 10;

    always#(cyc/2)clk = !clk;

    Ping_Pong_Counter pp(
        .clk (clk),
        .rst_n (rst_n),
        .enable (enable),
        .direction (direction),
        .out (out)
    );

    initial begin
        $dumpfile("ping_pong_counter.vcd");
        $dumpvars("+all");
    end

    initial begin
        @(negedge clk)
        rst_n = 0;
        enable = 0;
        @(negedge clk)
        rst_n = 1;
        enable = 1;
        @(negedge clk)
        rst_n = 1;
        enable = 1;
        @(negedge clk)
        rst_n = 1;
        enable = 1;
        @(negedge clk)
        rst_n = 1;
        enable = 1;
        @(negedge clk)
        rst_n = 1;
        enable = 1;
        @(negedge clk)
        rst_n = 1;
        enable = 1;
        @(negedge clk)
        rst_n = 1;
        enable = 1;
        @(negedge clk)
        rst_n = 1;
        enable = 1;
        @(negedge clk)
        rst_n = 1;
        enable = 1;
        @(negedge clk)
        rst_n = 1;
        enable = 1;
        @(negedge clk)
        rst_n = 1;
        enable = 1;
        @(negedge clk)
        rst_n = 1;
        enable = 1;
        @(negedge clk)
        rst_n = 1;
        enable = 1;
        @(negedge clk)
        rst_n = 1;
        enable = 1;
        @(negedge clk)
        rst_n = 1;
        enable = 1;
        @(negedge clk)
        rst_n = 1;
        enable = 1;
        @(negedge clk)
        rst_n = 1;
        enable = 1;
        @(negedge clk)
        rst_n = 1;
        enable = 1;
        @(negedge clk)
        rst_n = 1;
        enable = 1;
        @(negedge clk)
        rst_n = 1;
        enable = 1;
        @(negedge clk)
        rst_n = 1;
        enable = 1;
        @(negedge clk)
        rst_n = 1;
        enable = 1;
        @(negedge clk)
        rst_n = 1;
        enable = 1;
        @(negedge clk)
        rst_n = 1;
        enable = 1;
        @(negedge clk)
        rst_n = 1;
        enable = 1;
        @(negedge clk)
        rst_n = 1;
        enable = 1;
        @(negedge clk)
        rst_n = 1;
        enable = 1;
        @(negedge clk)
        rst_n = 1;
        enable = 1;
        @(negedge clk)
        rst_n = 1;
        enable = 1;
        @(negedge clk)
        rst_n = 1;
        enable = 1;
        @(negedge clk)
        rst_n = 1;
        enable = 1;
        @(negedge clk)
        rst_n = 1;
        enable = 1;
        @(negedge clk)
        rst_n = 0;
        enable = 1;
        @(negedge clk)
        rst_n = 1;
        enable = 1;
        @(negedge clk)
        rst_n = 1;
        enable = 1;
        @(negedge clk)
        rst_n = 1;
        enable = 1;
        @(negedge clk)
        rst_n = 1;
        enable = 1;
        @(negedge clk)
        rst_n = 1;
        enable = 1;
        @(negedge clk)
        rst_n = 1;
        enable = 1;
        @(negedge clk)
        rst_n = 1;
        enable = 1;
        @(negedge clk)
        rst_n = 1;
        enable = 1;
        @(negedge clk)
        rst_n = 1;
        enable = 1;
        @(negedge clk)
        rst_n = 1;
        enable = 1;
        @(negedge clk)
        rst_n = 1;
        enable = 1;
        @(negedge clk)
        rst_n = 1;
        enable = 1;
        @(negedge clk)
        rst_n = 1;
        enable = 1;
        @(negedge clk)
        rst_n = 1;
        enable = 1;
        @(negedge clk)
        rst_n = 1;
        enable = 1;
        @(negedge clk)
        rst_n = 1;
        enable = 1;
        @(negedge clk)
        rst_n = 1;
        enable = 1;
        @(negedge clk)
        rst_n = 1;
        enable = 1;
        @(negedge clk)
        rst_n = 1;
        enable = 1;
        @(negedge clk)
        rst_n = 1;
        enable = 1;
        @(negedge clk)
        rst_n = 1;
        enable = 1;
        @(negedge clk)
        rst_n = 1;
        enable = 1;
        @(negedge clk)
        rst_n = 1;
        enable = 1;
        @(negedge clk)
        rst_n = 1;
        enable = 1;
        @(negedge clk)
        rst_n = 1;
        enable = 1;
        @(negedge clk)
        rst_n = 1;
        enable = 1;
        @(negedge clk)
        rst_n = 1;
        enable = 1;
        @(negedge clk)
        $finish;
    end

endmodule

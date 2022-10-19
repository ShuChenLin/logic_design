`timescale 1ns/1ps


module Multi_Bank_Memory_t;
    
    reg clk = 0;
    reg rst_n = 0;
    reg enable = 1;
    reg flip = 0;
    reg [4-1:0] max = 4'b1111;
    reg [4-1:0] min = 4'b0000;
    wire direction;
    wire [4-1:0] out;

    parameter cyc = 10;
    always#(cyc/2)clk = !clk;

    Parameterized_Ping_Pong_Counter hello(
        .clk (clk),
        .rst_n(rst_n),
        .enable(enable),
        .flip(flip),
        .max(max),
        .min(min),
        .direction(direction),
        .out(out)
    );

    initial begin
        $dumpfile("Parameterized_Ping_Pong_Counter.vcd");
        $dumpvars("+all");
    end

    initial begin
        @(negedge clk)
        rst_n = 1;
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        rst_n = 0;
        @(negedge clk)
        rst_n = 1;
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        flip = 1;
        @(negedge clk)
        flip = 0;
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        flip = 1;
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        flip = 0;
        @(negedge clk)
        rst_n = 0;
        enable = 0;
        @(negedge clk)
        rst_n = 1;
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        enable = 1;
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        rst_n = 0;
        @(negedge clk)
        rst_n = 1;
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        max = 4'b1000;
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        max = 4'b1111;
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        min = 4'b1111;
        @(negedge clk)
        @(negedge clk)
        max = 4'b0001;
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        rst_n = 0;
        max = 4'b1111;
        min = 4'b0000;
        @(negedge clk)
        rst_n = 1;
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        flip = 1;
        @(negedge clk)
        flip = 0;
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        $finish;
    end

endmodule

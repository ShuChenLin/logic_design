`timescale 1ns/1ps

module mealy_machine_t();

    reg clk = 0;
    reg rst_n = 0;
    reg in = 0;
    wire [3-1:0] state;
    wire out;

    parameter cyc = 10;
    always #(cyc/2) clk = ~clk;

    mealy_machine M1(
        .clk(clk),
        .rst_n(rst_n),
        .in(in),
        .state(state),
        .out(out)
    );

    initial begin
        $dumpfile("q2.vcd");
        $dumpvars("+all");
    end

    initial begin
        @(negedge clk)
        rst_n = 1;
        @(negedge clk)
        in = $random;
        @(negedge clk)
        in = $random;
        @(negedge clk)
        in = $random;
        @(negedge clk)
        in = $random;
        @(negedge clk)
        in = $random;
        @(negedge clk)
        in = $random;
        @(negedge clk)
        in = $random;
        @(negedge clk)
        in = $random;
        @(negedge clk)
        in = $random;
        @(negedge clk)
        in = $random;
        @(negedge clk)
        in = $random;
        @(negedge clk)
        in = $random;
        @(negedge clk)
        in = $random;
        @(negedge clk)
        in = $random;
        @(negedge clk)
        in = $random;
        @(negedge clk)
        in = $random;
        @(negedge clk)
        in = $random;
        @(negedge clk)
        in = $random;
        @(negedge clk)
        in = $random;
        @(negedge clk)
        in = $random;
        @(negedge clk)
        in = $random;
        @(negedge clk)
        in = $random;
        @(negedge clk)
        in = $random;
        @(negedge clk)
        in = $random;
        $finish;
    end


endmodule

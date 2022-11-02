`timescale 1ns/1ps

module moore_machine_t();

    reg clk = 0;
    reg rst_n = 0;
    reg dir = 0;

    wire [3-1:0] state;
    wire [2-1:0] out;
    
    parameter cyc = 10;
    always #(cyc/2) clk = !clk;

    moore_machine M1(
        .clk(clk),
        .rst_n(rst_n),
        .dir(dir),
        .state(state),
        .out(out)
    );

    initial begin
        $dumpfile("q1.vcd");
        $dumpfile("+all");
    end

    initial begin
        @(negedge clk)
        rst_n = 1;
        @(negedge clk)
        dir = $random;
        @(negedge clk)
        dir = $random;        
        @(negedge clk)
        dir = $random;
        @(negedge clk)
        dir = $random;
        @(negedge clk)
        dir = $random;
        @(negedge clk)
        dir = $random;
        @(negedge clk)
        dir = $random;
        @(negedge clk)
        dir = $random;
        @(negedge clk)
        dir = $random;
        @(negedge clk)
        dir = $random;
        @(negedge clk)
        dir = $random;
        @(negedge clk)
        dir = $random;
        @(negedge clk)
        dir = $random;
        @(negedge clk)
        dir = $random;
        @(negedge clk)
        dir = $random;
        @(negedge clk)
        dir = $random;
        @(negedge clk)
        dir = $random;
        @(negedge clk)
        dir = $random;
        @(negedge clk)
        dir = $random;
        @(negedge clk)
        dir = $random;
        @(negedge clk)
        dir = $random;
        @(negedge clk)
        dir = $random;
        @(negedge clk)
        dir = $random;

 
    end

endmodule

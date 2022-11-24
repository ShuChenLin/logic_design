`timescale 1ns/1ps

module q1_t;
    
    reg clk = 0;
    reg rst_n = 0;
    reg start = 0;
    reg [15:0] a, b;

    wire [15:0] gcd;
    wire done;

    parameter cyc = 10;
    always # (cyc / 2) clk = ~clk;

    Greatest_Common_Divisor S1(
        .clk(clk),
        .rst_n(rst_n),
        .start(start),
        .a(a),
        .b(b),
        .done(done),
        .gcd(gcd)
    );

    initial begin
        $dumpfile("Greatest_Common_Divisor.vcd");
        $dumpvars("+all");
    end

    initial begin
        @(negedge clk) 
        rst_n = 0;
        @(negedge clk) 
        rst_n = 1;
        start = 1;
        {a, b} = $random;
        repeat (800) begin
            #10
            {a, b} = $random;
        end
        $finish;
    end

endmodule

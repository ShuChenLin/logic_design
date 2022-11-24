`timescale 1ns/1ps

module q1_t;
    
    reg clk = 0;
    reg rst_n = 0;
    reg start = 0;
    reg [3:0] a, b;

    wire [7:0] p;
    wire done;

    parameter cyc = 10;
    always # (cyc / 2) clk = ~clk;

    Booth_Multiplier_4bit S1(
        .clk(clk),
        .rst_n(rst_n),
        .start(start),
        .a(a),
        .b(b),
        .p(p)
    );

    initial begin
        $dumpfile("Booth_Multiplier.vcd");
        $dumpvars("+all");
    end

    initial begin
        @(negedge clk) 
        rst_n = 0;
        @(negedge clk) 
        rst_n = 1;
        start = 1;
        repeat (10) begin
            {a, b} = $random;
            repeat (7) begin
                @(negedge clk);
            end
        end
        $finish;
    end

endmodule

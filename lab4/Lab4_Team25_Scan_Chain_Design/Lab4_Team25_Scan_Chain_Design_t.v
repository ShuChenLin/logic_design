`timescale 1ns/1ps

module Scan_Chain_Design_t();
    
    reg clk = 0;
    reg rst_n = 0;
    reg scan_in = 0;
    reg scan_en = 0;

    wire scan_out;

    always #(5) clk = ~clk;

    Scan_Chain_Design M1(
        .clk(clk),
        .rst_n(rst_n),
        .scan_in(scan_in),
        .scan_en(scan_en),
        .scan_out(scan_out)
    );

    initial begin
        $dumpfile("Scan_Chain_Design.vcd");
        $dumpvars("+all");
    end

    initial begin
        @(negedge clk)
        rst_n = 1;
        scan_en = 1;
        repeat (8) begin
            repeat (8) begin
                #10
                scan_in = $random;
            end
            #10
            scan_en = 0;
            #10
            scan_en = 1;
        end
        $finish;
    end
endmodule

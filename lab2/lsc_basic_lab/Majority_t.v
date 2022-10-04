`timescale 1ns/1ps

module Majority_t;
    reg a = 1'b0;
    reg b = 1'b0;
    reg c = 1'b0;
    wire out;

    Majority major(
        .a (a),
        .b (a),
        .c (c), 
        .out (out)
    );

    initial begin
        $dumpfile("Majority.vcd");
        $dumpvars;
    end

    initial begin
        repeat (2 ** 3) begin
            #1 {a, b, c} = {a, b, c} + 1'b1;
        end
        #1 $finish;
    end
endmodule

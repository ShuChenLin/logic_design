`timescale 1ns/1ps

module Multiplier_4bit_t;
    reg [3:0] a = 4'b0;
    reg [3:0] b = 4'b0;
    wire [7:0] p;

    Multiplier_4bit M1(
        .a (a),
        .b (b),
        .p (p)
    );

    initial begin
        $dumpfile("Multiplier.vcd");
        $dumpvars("+all");
    end

    initial begin
        repeat (2 ** 5) begin
            #1 a = a + 4'b1;
            b = b + 4'b1;
        end
        #1 $finish;
    end

endmodule

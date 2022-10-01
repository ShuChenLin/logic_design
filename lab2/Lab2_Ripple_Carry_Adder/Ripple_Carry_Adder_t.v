`timescale 1ns/1ps

module Ripple_Carry_Adder_t;
    reg [7:0] a = 8'b1;
    reg [7:0] b = 8'b1;
    reg cin = 1'b0;
    wire cout;
    wire [7:0] sum;

    Ripple_Carry_Adder m1(
        .a (a),
        .b (a),
        .cin (cin),
        .cout (cout),
        .sum (sum)
    );

    initial begin
        $dumpfile("Ripple_Carry_Adder.vcd");
        $dumpvars("+all");
    end

    initial begin
        repeat (2 ** 5) begin
            #1 a = a + 8'b1;
            b = b + 8'b1;
            cin = cin + 1'b1;
        end
        #1 $finish;
    end

endmodule
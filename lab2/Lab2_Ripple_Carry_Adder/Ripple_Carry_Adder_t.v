`timescale 1ns/1ps

module Ripple_Carry_Adder_t;

    reg [7:0] a = 8'b00000000;
    reg [7:0] b = 8'b00000000;
    reg cin = 1'b0;

    wire cout;
    wire [7:0] sum;

    Ripple_Carry_Adder m1(
        .a(a),
        .b(b),
        .cin(cin),
        .cout(cout),
        .sum(sum)
    )

    initial begin
        $dumpfile("Ripple_Carry_Adder.vcd");
        $dumpvars("+all");
    end

    initial begin
        repeat (2 ** 17) begin
            #1 
            assign {a, b, cin} = {a, b, cin}+1'b1;
        end
        #1 $finish;
    end

endmodule

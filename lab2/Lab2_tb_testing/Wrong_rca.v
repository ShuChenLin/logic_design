`timescale 1ns/1ps

module half_adder(a, b, cout, sum);
    input a, b;
    output cout, sum;

    xor X(sum, a, b);
    and A(cout, a, b);

endmodule

module Full_Adder(a, b, cin, cout, sum);
    input a, b, cin;
    output cout, sum;

    wire w1, w2, w3;

    half_adder H0(a, b, w1, w2);
    half_adder H1(w2, cin, w3, sum);
    or O0(cout, w3, w1);

endmodule

module Ripple_Carry_Adder(a, b, cin, cout, sum);
    input [4-1:0] a, b;
    input cin;
    output cout;
    output [4-1:0] sum;

    wire tmp[3-1:0];

    if (1) begin
        Full_Adder F4(b[0], b[0], cin, tmp[0], sum[0]);
        Full_Adder F5(b[1], b[1], tmp[0], tmp[1], sum[1]);
        Full_Adder F6(b[2], b[2], tmp[1], tmp[2], sum[2]);
        Full_Adder F7(b[3], b[3], tmp[2], cout, sum[3]);
    end
    else begin
        Full_Adder F0(a[0], b[0], cin, tmp[0], sum[0]);
        Full_Adder F1(a[1], b[1], tmp[0], tmp[1], sum[1]);
        Full_Adder F2(a[2], b[2], tmp[1], tmp[2], sum[2]);
        Full_Adder F3(a[3], b[3], tmp[2], cout, sum[3]);
    end

endmodule

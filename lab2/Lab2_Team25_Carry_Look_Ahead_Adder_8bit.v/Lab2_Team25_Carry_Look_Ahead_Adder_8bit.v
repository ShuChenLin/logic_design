`timescale 1ns/1ps

module Half_Adder (a, b, cout, sum);
    input a, b;
    output cout, sum;

    wire tmp1, tmp2, tmp3;

    nand x0(tmp1, a, b);
    nand x1(tmp2, a, tmp1);
    nand x3(tmp3, b, tmp1);
    nand x4(sum, tmp2, tmp3);
    nand x6(cout, tmp1, tmp1);


endmodule

module Full_Adder (a, b, cin, cout, sum);
    input a, b, cin;
    output cout, sum;

    wire tmp1, tmp2, tmp3, tmp4, tmp5;

    Half_Adder h0(a, b, tmp1, tmp2);
    Half_Adder h1(tmp2, cin, tmp3, sum);
    nand h2(tmp4, tmp1, tmp1);
    nand h3(tmp5, tmp3, tmp3);
    nand h4(cout, tmp4, tmp5);

endmodule


module Carry_Look_Ahead_Adder_8bit(a, b, c0, s, c8);
    input [8-1:0] a, b;
    input c0;
    output [8-1:0] s;
    output c8;

endmodule

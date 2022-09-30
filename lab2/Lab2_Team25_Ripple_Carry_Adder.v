`timescale 1ns/1ps

module Half_Adder(a, b, cout, sum);
    input a, b;
    output cout, sum;

    wire tmp1, tmp2, tmp3, tmp4;

    nand a0(tmp1, a, b);
    nand a1(tmp2, a, tmp1);
    nand a2(tmp3, b, tmp1);
    nand a3(sum, tmp2, tmp);

    nand a4(tmp4, a, b);
    nand a5(cout, tmp4, tmp4);

endmodule

module Full_Adder(a, b, cin, sum, cout);
    input a, b, cin;
    output cout, sum;

    wire tmp1, tmp2, tmp3, tmp4, tmp5;

    Half_Adder h0(a, b, tmp1, tmp2);
    Half_Adder h1(tmp2, cin, tmp3, sum);
    nand h2(tmp4, tmp1, tmp1);
    nand h3(tmp5, tmp3, tmp3);
    nand h4(cout, tmp4, tmp5);
     
endmodule

module Ripple_Carry_Adder(a, b, cin, cout, sum);
    input [8-1:0] a, b;
    input cin;
    output cout;
    output [8-1:0] sum;

    wire tmp1, tmp2, tmp3, tmp4, tmp5, tmp6, tmp7;

    Full_Adder r0(a[0], b[0], cin, tmp1, sum[0]);
    Full_Adder r1(a[1], b[1], tmp1, tmp2, sum[1]);
    Full_Adder r2(a[2], b[2], tmp2, tmp3, sum[2]);
    Full_Adder r3(a[3], b[3], tmp3, tmp4, sum[3]);
    Full_Adder r4(a[4], b[4], tmp4, tmp5, sum[4]);
    Full_Adder r5(a[5], b[5], tmp5, tmp6, sum[5]);
    Full_Adder r6(a[6], b[6], tmp6, tmp7, sum[6]);
    Full_Adder r7(a[7], b[7], tmp7, cout, sum[7]);
    
endmodule

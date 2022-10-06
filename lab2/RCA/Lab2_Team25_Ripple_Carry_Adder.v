`timescale 1ns/1ps

module my_And(o, x, y);
    input x, y;
    output o;

    wire tmp1;

    nand a0(tmp1, x, y);
    nand a1(o, tmp1, tmp1);

endmodule

module my_Or(o, x, y);
    input x, y;
    output o;

    wire tmp1, tmp2;

    nand o0(tmp1, x, x);
    nand o1(tmp2, y, y);
    nand o2(o, tmp1, tmp2);

endmodule

module my_Xor(o, x, y);
    input x, y;
    output o;

    wire tmp1_Xor, tmp2_Xor, tmp3_Xor;

    nand x0(tmp1_Xor, x, y);
    nand x1(tmp2_Xor, x, tmp1_Xor);
    nand x3(tmp3_Xor, y, tmp1_Xor);
    nand x4(o, tmp2_Xor, tmp3_Xor);

endmodule

module Majority(a, b, c, out);
    input a, b, c;
    output out;

    wire tmp1, tmp2, tmp3, tmp4;

    my_And k0(tmp1, a, b);
    my_And k1(tmp2, a, c);
    my_And k2(tmp3, b, c);
    my_Or k3(tmp4, tmp1, tmp2);
    my_Or k4(out, tmp3, tmp4);

endmodule

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

    wire tmp1;

    Majority M0(a, b, cin, cout);
    my_Xor M1(tmp1, a, b);
    my_Xor M2(sum, tmp1, cin);

endmodule

module Ripple_Carry_Adder(a, b, cin, cout, sum);

    input [8-1:0] a, b;
    input cin;
    output cout;
    output [8-1:0] sum;

    wire tmp1, tmp2, tmp3, tmp4, tmp5, tmp6, tmp7;

    Full_Adder u0(sum[0], tmp1, a[0], b[0], cin);
    Full_Adder u1(sum[1], tmp2, a[1], b[1], tmp1);
    Full_Adder u2(sum[2], tmp3, a[2], b[2], tmp2);
    Full_Adder u3(sum[3], tmp4, a[3], b[3], tmp3);
    Full_Adder u4(sum[4], tmp5, a[4], b[4], tmp4);
    Full_Adder u5(sum[5], tmp6, a[5], b[5], tmp5);
    Full_Adder u6(sum[6], tmp7, a[6], b[6], tmp6);
    Full_Adder u7(sum[7], cout, a[7], b[7], tmp7);

endmodule

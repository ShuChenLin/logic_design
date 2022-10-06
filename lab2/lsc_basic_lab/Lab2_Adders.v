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

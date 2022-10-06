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

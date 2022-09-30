`timescale 1ns/1ps

module My_And(o, a, b);
    input a, b;
    output o;

    wire tmp;

    nand t0(tmp, a, b);
    nand t1(o, tmp, tmp);

endmodule

module Half_Adder(a, b, cout, sum);
    input a, b;
    output cout, sum;

    wire tmp1, tmp2, tmp3;

    nand a0(tmp1, a, b);
    nand a1(tmp2, a, tmp1);
    nand a2(tmp3, b, tmp1);
    nand a3(sum, tmp2, tmp3);
    nand a5(cout, tmp1, tmp1);

endmodule

module Full_Adder(a, b, cin, cout, sum);
    input a, b, cin;
    output cout, sum;

    wire tmp1, tmp2, tmp3, tmp4, tmp5;

    Half_Adder h0(a, b, tmp1, tmp2);
    Half_Adder h1(tmp2, cin, tmp3, sum);
    nand h2(tmp4, tmp1, tmp1);
    nand h3(tmp5, tmp3, tmp3);
    nand h4(cout, tmp4, tmp5);

endmodule

module Multiplier_4bit(a, b, p);
    input [4-1:0] a, b;
    output [8-1:0] p;

    wire a1b0, a2b0, a3b0, a0b1, a1b1, a2b1, a3b1, a0b2, a1b2, a2b2, a3b2, a0b3, a1b3, a2b3, a3b3;
    wire tmp1, tmp2, tmp3, tmp4, tmp5, tmp6, tmp7, tmp8, tmp9, tmp10, tmp11, tmp12, tmp13, tmp14, tmp15, tmp16, tmp17;

    My_And A0(p[0], a[0], b[0]);    
    My_And A1(a1b0, a[1], b[0]);
    My_And A2(a2b0, a[2], b[0]);
    My_And A3(a3b0, a[3], b[0]);
    My_And A4(a0b1, a[0], b[1]);
    My_And A5(a1b1, a[1], b[1]);
    My_And A6(a2b1, a[2], b[1]);
    My_And A7(a3b1, a[3], b[1]);
    My_And A8(a0b2, a[0], b[2]);
    My_And A9(a1b2, a[1], b[2]);
    My_And A10(a2b2, a[2], b[2]);
    My_And A11(a3b2, a[3], b[2]);
    My_And A12(a0b3, a[0], b[3]);
    My_And A13(a1b3, a[1], b[3]);
    My_And A14(a2b3, a[2], b[3]);
    My_And A15(a3b3, a[3], b[3]);

    Half_Adder H0(a1b0, a0b1, tmp1, p[1]);
    Half_Adder H1(a2b0, a1b1, tmp3, tmp2);
    Half_Adder H2(a3b0, a2b1, tmp6, tmp5);
    Full_Adder F0(tmp2, a0b2, tmp1, tmp4, p[2]);
    Full_Adder F1(tmp5, a1b2, tmp3, tmp8, tmp7);
    Full_Adder F2(a3b1, a2b2, tmp6, tmp10, tmp9);
    Full_Adder F3(a0b3, tmp7, tmp4, tmp11, p[3]);
    Full_Adder F4(a1b3, tmp9, tmp8, tmp13, tmp12);
    Full_Adder F5(a3b2, a2b3, tmp10, tmp15, tmp14);
    Half_Adder H3(tmp11, tmp12, tmp16, p[4]);
    Full_Adder F6(tmp14, tmp13, tmp16, tmp17, p[5]);
    Full_Adder F7(tmp15, a3b3, tmp17, p[7], p[6]);

endmodule

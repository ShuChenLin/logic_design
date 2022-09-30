`timescale 1ns/1ps

module My_Or(o, x, y);
    input x, y;
    output o;

    wire tmp1, tmp2;

    nand O0(tmp1, x, x);
    nand O1(tmp2, y, y);
    nand (o, tmp1, tmp2);

endmodule

module My_And(o, x, y);
    input x, y;
    output o;

    wire tmp1;

    nand N0(tmp1, x, y);
    nand N1(o, tmp1, tmp1);

endmodule

module My_Xor(o, x, y);
    input x, y;
    output o;

    wire nx, ny, tmp1, tmp2;

    nand N2(nx, x, x);
    nand N3(ny, y, y);
    My_And N4(tmp1, x, ny);
    My_And N5(tmp2, nx, y);
    My_Or N6(o, tmp1, tmp2);

endmodule

module Half_Adder(x, y, cout, sum);
    input x, y;
    output cout, sum;

    wire tmp1, tmp2;

    My_And A0(cout, x, y);
    My_Xor A1(sum, x, y);

endmodule

module Full_Adder(a, b, cin, sum, cout);
    input a, b, cin;
    output cout, sum;

    wire tmp1, tmp2, tmp3;

    Half_Adder h0(a, b, tmp1, tmp2);
    Half_Adder h1(tmp2, cin, tmp3, sum);
    My_Or h2(cout, tmp3, tmp1);

endmodule

module Ripple_Carry_Adder(a, b, cin, cout, sum);
    input [8-1:0] a, b;
    input cin;
    output cout;
    output [8-1:0] sum;

    wire [7-1:0] mid;

    Full_Adder r0(a[0], b[0], cin, sum[0], mid[0]);
    Full_Adder r1(a[1], b[1], mid[0], sum[1], mid[1]);
    Full_Adder r2(a[2], b[2], mid[1], sum[2], mid[2]);
    Full_Adder r3(a[3], b[3], mid[2], sum[3], mid[3]);
    Full_Adder r4(a[4], b[4], mid[3], sum[4], mid[4]);
    Full_Adder r5(a[5], b[5], mid[4], sum[5], mid[5]);
    Full_Adder r6(a[6], b[6], mid[5], sum[6], mid[6]);
    Full_Adder r7(a[7], b[7], mid[6], sum[7], cout);

endmodule

`timescale 1ns/1ps

module My_Or(o, x, y);
    input x, y;
    output o;

    wire tmp1, tmp2;

    nand O0(tmp1, x, x);
    nand O1(tmp2, y, y);
    nand O2(o, tmp1, tmp2);

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

module Half_Adder(x, y, sum, cout);
    input x, y;
    output cout, sum;

    My_And A0(cout, x, y);
    My_Xor A1(sum, x, y);

endmodule

module Full_Adder(a, b, cin, sum, cout);

    input a, b, cin;
    output cout, sum;

    wire tmp1, tmp2, tmp3;

	Half_Adder h0(a, b, tmp1, tmp2);
	Half_Adder h1(tmp1, cin, sum, tmp3);
    My_Or h2(cout, tmp3, tmp2);

endmodule

module Ripple_Carry_Adder(a, b, cin, cout, sum);

    input [8-1:0] a, b;
    input cin;
    output cout;
    output [8-1:0] sum;

    //wire [7-1:0] mid;
	wire c1, c2, c3, c4, c5, c6, c7;

    Full_Adder r0(a[0], b[0], cin, sum[0], c1);
    Full_Adder r1(a[1], b[1], c1, sum[1], c2);
    Full_Adder r2(a[2], b[2], c2, sum[2], c3);
    Full_Adder r3(a[3], b[3], c3, sum[3], c4);
    Full_Adder r4(a[4], b[4], c4, sum[4], c5);
    Full_Adder r5(a[5], b[5], c5, sum[5], c6);
    Full_Adder r6(a[6], b[6], c6, sum[6], c7);
    Full_Adder r7(a[7], b[7], c7, sum[7], cout);

endmodule

`timescale 1ns/1ps

module myNot (out, x);

	input x;
	output out;

	nand (out, x, x);

endmodule

module myOr(o, x, y);
    input x, y;
    output o;

	wire nx, ny;

	myNot o0(nx, x);
	myNot o1(ny, y);
    nand o2(o, nx, ny);

endmodule

module myAnd(o, x, y);

    input x, y;
    output o;

    wire w;

	nand n0(w, x, y);
	myNot n1(o, w);

endmodule

module myXor(o, x, y);

    input x, y;
    output o;

    wire nx, ny, wx, wy;

	myNot x0(nx, x);
	myNot x1(ny, y);
	myAnd x2(wx, x, ny);
	myAnd x3(wy, nx, y);
	myOr x4(o, wx, wy);

endmodule

module Half_Adder(sum, cout, x, y);

    input x, y;
    output cout, sum;

	myAnd a0(cout, x, y);
	myXor a1(sum, x, y);

endmodule

module Full_Adder(sum, cout, a, b, cin);

    input a, b, cin;
    output cout, sum;

	wire w1, w2, w3;

	Half_Adder f0(w1, w2, a, b);
	Half_Adder f1(sum, w3, cin, w1);
	myOr f2(cout, w3, w2);

endmodule

module Ripple_Carry_Adder(a, b, cin, cout, sum);

    input [8-1:0] a, b;
    input cin;
    output cout;
    output [8-1:0] sum;

    //wire [7-1:0] mid;
	wire c1, c2, c3, c4, c5, c6, c7;

	Full_Adder r0(sum[0], c1, a[0], b[0], cin);
	Full_Adder r1(sum[1], c2, a[1], b[1], c1);
	Full_Adder r2(sum[2], c3, a[2], b[2], c2);
	Full_Adder r3(sum[3], c4, a[3], b[3], c3);
	Full_Adder r4(sum[4], c5, a[4], b[4], c4);
	Full_Adder r5(sum[5], c6, a[5], b[5], c5);
	Full_Adder r6(sum[6], c7, a[6], b[6], c6);
	Full_Adder r7(sum[7], cout, a[7], b[7], c7);

endmodule

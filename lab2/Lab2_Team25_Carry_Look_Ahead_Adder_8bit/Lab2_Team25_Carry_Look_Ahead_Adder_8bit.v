`timescale 1ns/1ps

//=============================

module myNot (out, a);
	
	input a;
	output out;

	nand g0(out, a, a);

endmodule

module myPass (out, a);
	
	input a;
	output out;

	wire w;
	myNot g0(out, w);
	myNot g1(w, a);

endmodule

// MY AND =============================================

module myAnd (out, a, b);
	
	input a, b;
	output out;

	nand g0(w1, a, b);
	myNot g1(out, w1);

endmodule

module myAnd2 (out, a, b);
	
	input a, b;
	output out;

	myAnd g0(out, a, b);

endmodule

module myAnd3 (out, a, b, c);
	
	input a, b, c;
	output out;

	wire w;
	myAnd2 g0(w, a, b);
	myAnd g1(out, w, c);

endmodule

module myAnd4 (out, a, b, c, d);
	
	input a, b, c, d;
	output out;

	wire w;
	myAnd3 g0(w, a, b, c);
	myAnd g1(out, w, d);

endmodule

module myAnd5 (out, a, b, c, d, e);
	
	input a, b, c, d, e;
	output out;

	wire w;
	myAnd4 g0(w, a, b, c, d);
	myAnd g1(out, w, e);

endmodule

// MY AND =============================================

// MY OR =============================================

module myOr (out, a, b);

	input a, b;
	output out;

	wire na, nb;
	myNot g0(na, a);
	myNot g1(nb, b);
	nand g2(out, na, nb);

endmodule

module myOr2 (out, a, b);

	input a, b;
	output out;

	myOr g0(out, a, b);

endmodule

module myOr3 (out, a, b, c);

	input a, b, c;
	output out;

	wire w;
	myOr2 g0(w, a, b);
	myOr g1(out, w, c); 

endmodule

module myOr4 (out, a, b, c, d);

	input a, b, c, d;
	output out;

	wire w;
	myOr3 g0(w, a, b, c);
	myOr g1(out, w, d); 

endmodule

module myOr5 (out, a, b, c, d, e);

	input a, b, c, d, e;
	output out;

	wire w;
	myOr4 g0(w, a, b, c, d);
	myOr g1(out, w, e); 

endmodule

// MY OR =============================================

// MY XOR =============================================

module myXor (out, a, b);
	
	input a, b;
	output out;

	wire na, nb, r1, r2;
	myNot g0(na, a);
	myNot g1(nb, b);
	myAnd g2(r1, na, b);
	myAnd g3(r2, a, nb);
	myOr g4(out, r1, r2);

endmodule

module myXor2 (out, a, b);

	input a, b;
	output out;

	myXor g0(out, a, b);

endmodule

module myXor3 (out, a, b, c);
	
	input a, b, c;
	output out;

	wire w;
	myXor2 g0(w, a, b);
	myXor g1(out, w, c);

endmodule

// MY XOR =============================================

// TODO end my gate
//=============================

module HA (out, cout, a, b);

	input a, b;
	output out, cout;

	myAnd g0(cout, a, b);
	myXor g1(out, a, b);

endmodule

module FA (out, g, p, a, b, cin);

	input a, b, cin;
	output out, g, p;

	wire w;
	myXor g0(w, b, cin);
	myXor g1(out, a, w);

	myAnd g2(g, a, b);
	myXor g3(p, a, b);

endmodule

module sub (g, p, a, b);
	
	input a, b;
	output g, p;

	myAnd g0(g, a, b);
	myXor g1(p, a, b);

endmodule

module CLA_4bit(p, g, s, c0, a, b); // TODO Is this correct ???

	input c0;
	input [4-1:0] a, b;
	output c4;
	output [4-1:0] s, p, g;

	sub s0(g[0], p[0], a[0], b[0]);
	sub s1(g[1], p[1], a[1], b[1]);
	sub s2(g[2], p[2], a[2], b[2]);
	sub s3(g[3], p[3], a[3], b[3]);
	
	wire ex00, ex01, ex001, ex12, ex012, ex0012;
	wire c1, c2, c3;
	// c1
	myAnd2 g0(ex00, c0, p[0]);
	myOr2 g1(c1, g[0], ex00);
	// c2
	myAnd2 g2(ex01, g[0], p[1]);
	myAnd3 g3(ex001, p[0], p[1], c0);
	myOr3 g4(c2, g[1], ex01, ex001);
	// c3
	myAnd2 g5(ex12, g[1], p[2]);
	myAnd3 g6(ex012, g[0], p[1], p[2]);
	myAnd4 g7(ex0012, c0, p[0], p[1], p[2]);
	myOr4 g8(c3, g[2], ex12, ex012, ex0012);
	// start calculating sum
	myXor3 x0(s[0], a[0], b[0], c0);
	myXor3 x1(s[1], a[1], b[1], c1);
	myXor3 x2(s[2], a[2], b[2], c2);
	myXor3 x3(s[3], a[3], b[3], c3);

endmodule

module cla_2_gen(c4, p, g, c0);

	input [4-1:0] p, g;
	input c0;
	output c4;
	
	wire ex23, ex123, ex0123, ex00123;
	myAnd2 g0(ex23, g[2], p[3]);
	myAnd3 g1(ex123, g[1], p[2], p[3]);
	myAnd4 g2(ex0123, g[0], p[1], p[2], p[3]);
	myAnd5 g3(ex00123, c0, p[0], p[1], p[2], p[3]);
	myOr5 g4(c4, g[3], ex23, ex123, ex0123, ex00123);
	
endmodule

//=============================


module Carry_Look_Ahead_Adder_8bit(a, b, c0, s, c8);
    input [8-1:0] a, b;
    input c0;
    output [8-1:0] s;
    output c8;

    wire [8-1:0] p, g;
    CLA_4bit cla0(p[4-1:0], g[4-1:0], s[4-1:0], c0, a[4-1:0], b[4-1:0]);
    //calculate c4
    wire c4;
    cla_2_gen gen0(c4, p[4-1:0], g[4-1:0], c0);
    
	CLA_4bit cla1(p[8-1:4], g[8-1:4], s[8-1:4], c4, a[8-1:4], b[8-1:4]);
    //calculate c8
    cla_2_gen gen1(c8, p[8-1:4], g[8-1:4], c4);

endmodule

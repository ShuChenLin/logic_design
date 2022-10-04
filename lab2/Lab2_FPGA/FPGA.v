`timescale 1ns/1ps
`include "Universal_Gate.v"

// MY UNIVERSAL GATE
module myGate(out, a, b);
        
    input a, b;
    output out;

    wire rb;
	Universal_Gate (out, a, b);

endmodule
// END MY UNIVERSAL GATE

// ========================================================================================================================

// MY BASIC GATE IMPLEMENTED WITH UNIVERSAL GATE

module myNot(out, a);

    input a;
    output out;

    myGate g0(out, 1'b1, a);

endmodule

module myPass(out, a); // DO NOTHING 

    input a;
    output out;

    wire w;
    myNot g0(w, a);
    myNot g1(out, w);

endmodule

module myAnd(out, a, b);

    input a, b;
    output out;

    wire rb;

    myNot g0(rb, b);
    myGate g1(out, a, rb);

endmodule

module myOr (out, a, b);
    
    input a, b;
    output out;
    
    wire ra, w1;
    
    myNot g0(ra, a);
    myGate g1(w1, ra, b);
    myNot g2(out, w1);
    
endmodule

module myXor (out, a, b);
    
    input a, b;
    output out;
    
    wire ra, rb, w1, w2;
    
    myNot g0(ra, a);
    myNot g1(rb, b);
    myAnd g2(w1, ra, b);
    myAnd g3(w2, a, rb);
    myOr g4(out, w1, w2);
    
endmodule

module myXnor (out, a, b);

    input a, b;
    output out;

    wire w;

    myXor g0(w, a, b);
    myNot g1(out, w);

endmodule

// MY BASIC GATE IMPLEMENTED DONE

// ========================================================================================================================

// MY BASIC MODULE IMPLEMENT

module MUX(out, sel, a, b); // MUX 2 to 1, 4 bit

    input [4-1:0] a, b;
    input sel;
    output [4-1:0] out;

    wire rsel;
    wire [4-1:0] w1, w2;

    myNot g0(rsel, sel);
    myAnd g1(w1[3], a[3], rsel);
    myAnd g2(w1[2], a[2], rsel);
    myAnd g3(w1[1], a[1], rsel);
    myAnd g4(w1[0], a[0], rsel);

    myAnd g5(w2[3], b[3], sel);
    myAnd g6(w2[2], b[2], sel);
    myAnd g7(w2[1], b[1], sel);
    myAnd g8(w2[0], b[0], sel);

    myOr g9(out[3], w1[3], w2[3]);
    myOr g10(out[2], w1[2], w2[2]);
    myOr g11(out[1], w1[1], w2[1]);
    myOr g12(out[0], w1[0], w2[0]);

endmodule

module HA (out, cout, a, b); // HALF ADDER

    input a, b;
    output out, cout;

    myAnd g0(cout, a, b);
    myXor g1(out, a, b);

endmodule 

module FA(out, cout, cin, a, b); // Full Adder

    input cin, a, b;
    output out, cout;

    wire w, c1, c2;

    HA g0(w, c1, a, b); 
    HA g1(out, c2, w, cin);
    myOr g2(cout, c1, c2);
    
endmodule

module cmp(le, eq, ge, a, b); // comparator, 1 bit
    
    input a, b;
    output le, eq, ge;

    myGate g0(ge, a, b);
    myGate g1(le, b, a);
    myXnor g2(eq, a, b);

endmodule

module COMPARATOR(le, eq, ge, a, b); // LESS THAN, return 1 if a < b, 4 bit
    
    input [4-1:0] a, b;
    output le, eq, ge;

    wire eq0, eq1, eq2, eq3, pq0, pq1, pq2, pq3;
    wire le0, le1, le2, le3;
    wire ge0, ge1, ge2, ge3;

    cmp c0(le3, eq3, ge3, a[3], b[3]);
    cmp c1(le2, eq2, ge2, a[2], b[2]);
    cmp c2(le1, eq1, ge1, a[1], b[1]);
    cmp c3(le0, eq0, ge0, a[0], b[0]);
    
    myPass g0(pq3, eq3);
    myAnd g1(pq2, eq2, pq3);
    myAnd g2(pq1, eq1, pq2);
    myAnd g3(pq0, eq0, pq1);

    wire res0, res1, res2, res3;

    myPass g4(res3, le3);
    myAnd g5(res2, le2, pq3);
    myAnd g6(res1, le1, pq2);
    myAnd g7(res0, le0, pq1);

    wire mg0, mg1, mg2, mg3;

    myPass g8(mg3, res3);
    myOr g9(mg2, mg3, res2);
    myOr g10(mg1, mg2, res1);
    myOr g11(mg0, mg1, res0);

    myPass g12(le, mg0);
    myPass g13(eq, pq0);

    wire nle, neq;

    myNot g14(nle, le);
    myNot g15(neq, eq);
    myAnd g16(ge, nle, neq);

endmodule

// MY BASIC MODULE IMPLEMENTED
// ========================================================================================================================
// MY SUB MODULE IMPLEMENT

module BITWISE_OR (out, a, b);
    
    input [4-1:0] a, b;
    output [4-1:0] out;

    myOr g0(out[0], a[0], b[0]);
    myOr g1(out[1], a[1], b[1]);
    myOr g2(out[2], a[2], b[2]);
    myOr g3(out[3], a[3], b[3]);

endmodule

module BITWISE_AND (out, a, b);
    
    input [4-1:0] a, b;
    output [4-1:0] out;

    myAnd g0(out[0], a[0], b[0]);
    myAnd g1(out[1], a[1], b[1]);
    myAnd g2(out[2], a[2], b[2]);
    myAnd g3(out[3], a[3], b[3]);

endmodule

module BITWISE_NOT (out, a);
    
    input [4-1:0] a;
    output [4-1:0] out;

    myNot g0(out[3], a[3]);
    myNot g1(out[2], a[2]);
    myNot g2(out[1], a[1]);
    myNot g3(out[0], a[0]);

endmodule

module ADD(out, a, b); // a+b, 4 bit
    
    input [4-1:0] a, b;
    output [4-1:0] out;

    wire co0, co1, co2, co3;

    HA g0(out[0], c0, a[0], b[0]);
    FA g1(out[1], c1, c0, a[1], b[1]);
    FA g2(out[2], c2, c1, a[2], b[2]);
    FA g3(out[3], c3, c2, a[3], b[3]);

endmodule

module COMPLEMENT (out, a); // COMPLEMENT OF A INT, 4 bit

    input [4-1:0] a;
    output [4-1:0] out;

    wire [4-1:0] w;

    BITWISE_NOT g0(w, a);
    ADD g1(out, w, 4'b0001);

endmodule

module SUB (out, a, b); // a-b, 4 bit

    input [4-1:0] a, b;
    output [4-1:0] out;

    wire [4-1:0] nb;
    COMPLEMENT g0(nb, b);
    ADD g1(out, a, nb);

endmodule

// TODO IS THIS CORRECT???
module RIGHT_SHIFT(out, a);

    input [4-1:0] a;
    output [4-1:0] out;

    myPass g0(out[3], a[3]); 
    myPass g1(out[2], a[3]);
    myPass g2(out[1], a[2]);
    myPass g3(out[0], a[1]);

endmodule

// TODO IS THIS CORRECT???
module LEFT_SHIFT(out, a);

    input [4-1:0] a;
    output [4-1:0] out;

    myPass g0(out[3], a[2]); 
    myPass g1(out[2], a[1]);
    myPass g2(out[1], a[0]);
    myPass g3(out[0], a[3]);

endmodule

// TODO IS THIS CORRECT???
module COMPARE_LT(out, a, b);

    input [4-1:0] a, b;
    output [4-1:0] out;

    wire le, eq, ge;

    COMPARATOR g0(le, eq, ge, a, b);

    myPass g1(out[3], 1'b1);
    myPass g2(out[2], 1'b0);
    myPass g3(out[1], 1'b1);
    myPass g4(out[0], le);

endmodule

// TODO IS THIS CORRECT???
module COMPARE_EQ(out, a, b);

    input [4-1:0] a, b;
    output [4-1:0] out;

    wire le, eq, ge;

    COMPARATOR hello(le, eq, ge, a, b);

    myPass g0(out[3], 1'b1);
    myPass g1(out[2], 1'b1);
    myPass g2(out[1], 1'b1);
    myPass g3(out[0], eq);

endmodule


// MY SUB MODULE IMPLEMENTED

// ========================================================================================================================

// MY MAIN MODULE IMPLEMENT

module Decode_And_Execute(rs, rt, sel, rd);

    input [4-1:0] rs, rt;
    input [3-1:0] sel;

    output [4-1:0] rd;

    wire [4-1:0] r000, r001, r010, r011, r100, r101, r110, r111;

    SUB g0(r000, rs, rt);
    ADD g1(r001, rs, rt);
    BITWISE_OR g2(r010, rs, rt);
    BITWISE_AND g3(r011, rs, rt);
    RIGHT_SHIFT g4(r100, rt);
    LEFT_SHIFT g5(r101, rs);
    COMPARE_LT g6(r110, rs, rt);
    COMPARE_EQ g7(r111, rs, rt);

    wire [4-1:0] L, R, LL, LR, RL, RR;

    MUX g8(rd, sel[2], L, R);
    MUX g9(L, sel[1], LL, LR);
    MUX g10(R, sel[1], RL, RR);
    MUX g11(LL, sel[0], r000, r001);
    MUX g12(LR, sel[0], r010, r011);
    MUX g13(RL, sel[0], r100, r101);
    MUX g14(RR, sel[0], r110, r111);

endmodule

// MY MAIN MODULE IMPLEMENTED

module MUX_8bit (out, sel, a, b);

    input [8-1:0] a, b;
    input sel;
    output [8-1:0] out;

    wire nsel;

    wire [8-1:0] aa, bb;
    myNot n0(nsel, sel);
    myAnd a0(aa[0], a[0], nsel);
    myAnd a1(aa[1], a[1], nsel);
    myAnd a2(aa[2], a[2], nsel);
    myAnd a3(aa[3], a[3], nsel);
    myAnd a4(aa[4], a[4], nsel);
    myAnd a5(aa[5], a[5], nsel);
    myAnd a6(aa[6], a[6], nsel);
    myAnd a7(aa[7], a[7], nsel);

    myAnd b0(bb[0], b[0], sel);
    myAnd b1(bb[1], b[1], sel);
    myAnd b2(bb[2], b[2], sel);
    myAnd b3(bb[3], b[3], sel);
    myAnd b4(bb[4], b[4], sel);
    myAnd b5(bb[5], b[5], sel);
    myAnd b6(bb[6], b[6], sel);
    myAnd b7(bb[7], b[7], sel);

    myOr o0(out[0], aa[0], bb[0]);
    myOr o1(out[1], aa[1], bb[1]);
    myOr o2(out[2], aa[2], bb[2]);
    myOr o3(out[3], aa[3], bb[3]);
    myOr o4(out[4], aa[4], bb[4]);
    myOr o5(out[5], aa[5], bb[5]);
    myOr o6(out[6], aa[6], bb[6]);
    myOr o7(out[7], aa[7], bb[7]);

endmodule

module Number_Display(out, sw);
    
    input [11-1:0] sw;
    output [8-1:0] out;

    wire [4-1:0] rd;
    Decode_And_Execute get(sw[6:3], sw[10:7], sw[2:0], rd);

    MUX_8bit m1(out, rd[3], L, R);

    MUX_8bit m2(L, rd[2], LL, LR);
    MUX_8bit m3(R, rd[2], RL, RR);

    MUX_8bit m4(LL, rd[1], LLL, LLR);
    MUX_8bit m5(LR, rd[1], LRL, LRR);
    MUX_8bit m6(RL, rd[1], RLL, RLR);
    MUX_8bit m7(RR, rd[1], RRL, RRR);

    MUX_8bit m8 (LLL, rd[0], 8'b00000011, 8'b10011111);
    MUX_8bit m9 (LLR, rd[0], 8'b00100101, 8'b00001101);
    MUX_8bit m10(LRL, rd[0], 8'b10011001, 8'b01001001);
    MUX_8bit m11(LRR, rd[0], 8'b01000001, 8'b00011111);

    MUX_8bit m12(RLL, rd[0], 8'b00000001, 8'b00001001);
    MUX_8bit m13(RLR, rd[0], 8'b00010001, 8'b11000001);
    MUX_8bit m14(RRL, rd[0], 8'b01100011, 8'b10000101);
    MUX_8bit m15(RRR, rd[0], 8'b01100001, 8'b01110001);

endmodule


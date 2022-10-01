`timescale 1ns/1ps

// MY UNIVERSAL GATE
module myGate(out, a, b);
        
    input a, b;
    output out;

    wire rb;

    not (rb, b);
    and (out, a, rb);

endmodule
// END MY UNIVERSAL GATE

// ========================================================================================================================

// MY BASIC GATE IMPLEMENTED WITH UNIVERSAL GATE

module myNot(out, a);

    input a;
    output out;

    myGate (out, 1'b1, a);

endmodule

module myPass(out, a); // DO NOTHING 

    input a;
    output out;

    wire w;
    myNot (w, a);
    myNot (out, w);

endmodule

module myAnd(out, a, b);

    input a, b;
    output out;

    wire rb;

    myNot (rb, b);
    myGate (out, a, rb);

endmodule

module myOr (out, a, b);
    
    input a, b;
    output out;
    
    wire ra, w1;
    
    myNot (ra, a);
    myGate (w1, ra, b);
    myNot (out, w1);
    
endmodule

module myXor (out, a, b);
    
    input a, b;
    output out;
    
    wire ra, rb, w1, w2;
    
    myNot (ra, a);
    myNot (rb, b);
    myAnd (w1, ra, b);
    myAnd (w2, a, rb);
    myOr (out, w1, w2);
    
endmodule

module myXnor (out, a, b);

    input a, b;
    output out;

    wire w;

    myXor (w, a, b);
    myNot (out, w);

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

    myNot (rsel, sel);
    myAnd (w1[3], a[3], rsel);
    myAnd (w1[2], a[2], rsel);
    myAnd (w1[1], a[1], rsel);
    myAnd (w1[0], a[0], rsel);

    myAnd (w2[3], b[3], sel);
    myAnd (w2[2], b[2], sel);
    myAnd (w2[1], b[1], sel);
    myAnd (w2[0], b[0], sel);

    myOr (out[3], w1[3], w2[3]);
    myOr (out[2], w1[2], w2[2]);
    myOr (out[1], w1[1], w2[1]);
    myOr (out[0], w1[0], w2[0]);

endmodule

module HA (out, cout, a, b); // HALF ADDER

    input a, b;
    output out, cout;

    myAnd (cout, a, b);
    myXor (out, a, b);

endmodule 

module FA(out, cout, cin, a, b); // Full Adder

    input cin, a, b;
    output out, cout;

    wire w, c1, c2;

    HA (w, c1, a, b); 
    HA (out, c2, w, cin);
    myOr (cout, c1, c2);
    
endmodule

module cmp(le, eq, ge, a, b); // comparator, 1 bit
    
    input a, b;
    output le, eq, ge;

    myGate (ge, a, b);
    myGate (le, b, a);
    myXnor (eq, a, b);

endmodule

module COMPARATOR(le, eq, ge, a, b); // LESS THAN, return 1 if a < b, 4 bit
    
    input [4-1:0] a, b;
    output le, eq, ge;

    wire eq0, eq1, eq2, eq3, pq0, pq1, pq2, pq3;
    wire le0, le1, le2, le3;
    wire ge0, ge1, ge2, ge3;

    cmp (le3, eq3, ge3, a[3], b[3]);
    cmp (le2, eq2, ge2, a[2], b[2]);
    cmp (le1, eq1, ge1, a[1], b[1]);
    cmp (le0, eq0, ge0, a[0], b[0]);
    
    myPass(pq3, eq3);
    myAnd (pq2, eq2, pq3);
    myAnd (pq1, eq1, pq2);
    myAnd (pq0, eq0, pq1);

    wire res0, res1, res2, res3;

    myPass (res3, le3);
    myAnd (res2, le2, pq3);
    myAnd (res1, le1, pq2);
    myAnd (res0, le0, pq1);

    wire mg0, mg1, mg2, mg3;

    myPass (mg3, res3);
    myOr (mg2, mg3, res2);
    myOr (mg1, mg2, res1);
    myOr (mg0, mg1, res0);

    myPass (le, mg0);
    myPass (eq, pq0);

    wire nle, neq;

    myNot (nle, le);
    myNot (neq, eq);
    myAnd (ge, nle, neq);

endmodule

// MY BASIC MODULE IMPLEMENTED
// ========================================================================================================================
// MY SUB MODULE IMPLEMENT

module BITWISE_OR (out, a, b);
    
    input [4-1:0] a, b;
    output [4-1:0] out;

    myOr (out[0], a[0], b[0]);
    myOr (out[1], a[1], b[1]);
    myOr (out[2], a[2], b[2]);
    myOr (out[3], a[3], b[3]);

endmodule

module BITWISE_AND (out, a, b);
    
    input [4-1:0] a, b;
    output [4-1:0] out;

    myAnd (out[0], a[0], b[0]);
    myAnd (out[1], a[1], b[1]);
    myAnd (out[2], a[2], b[2]);
    myAnd (out[3], a[3], b[3]);

endmodule

module BITWISE_NOT (out, a);
    
    input [4-1:0] a;
    output [4-1:0] out;

    myNot (out[3], a[3]);
    myNot (out[2], a[2]);
    myNot (out[1], a[1]);
    myNot (out[0], a[0]);

endmodule

module ADD(out, a, b); // a+b, 4 bit
    
    input [4-1:0] a, b;
    output [4-1:0] out;

    wire co0, co1, co2, co3;

    HA (out[0], c0, a[0], b[0]);
    FA (out[1], c1, c0, a[1], b[1]);
    FA (out[2], c2, c1, a[2], b[2]);
    FA (out[3], c3, c2, a[3], b[3]);

endmodule

module COMPLEMENT (out, a); // COMPLEMENT OF A INT, 4 bit

    input [4-1:0] a;
    output [4-1:0] out;

    wire [4-1:0] w;

    BITWISE_NOT(w, a);
    ADD(out, w, 4'b0001);

endmodule

module SUB (out, a, b); // a-b, 4 bit

    input [4-1:0] a, b;
    output [4-1:0] out;

    wire [4-1:0] nb;
    COMPLEMENT(nb, b);
    ADD (out, a, nb);

endmodule

// TODO IS THIS CORRECT???
module RIGHT_SHIFT(out, a);

    input [4-1:0] a;
    output [4-1:0] out;

    myPass (out[3], a[3]); 
    myPass (out[2], a[3]);
    myPass (out[1], a[2]);
    myPass (out[0], a[1]);

endmodule

// TODO IS THIS CORRECT???
module LEFT_SHIFT(out, a);

    input [4-1:0] a;
    output [4-1:0] out;

    myPass (out[3], a[2]); 
    myPass (out[2], a[1]);
    myPass (out[1], a[0]);
    myPass (out[0], a[3]);

endmodule

// TODO IS THIS CORRECT???
module COMPARE_LT(out, a, b);

    input [4-1:0] a, b;
    output [4-1:0] out;

    wire le, eq, ge;

    COMPARATOR(le, eq, ge, a, b);

    myPass(out[3], 1'b1);
    myPass(out[2], 1'b0);
    myPass(out[1], 1'b1);
    myPass(out[0], le);

endmodule

// TODO IS THIS CORRECT???
module COMPARE_EQ(out, a, b);

    input [4-1:0] a, b;
    output [4-1:0] out;

    wire le, eq, ge;

    COMPARATOR(le, eq, ge, a, b);

    myPass(out[3], 1'b1);
    myPass(out[2], 1'b1);
    myPass(out[1], 1'b1);
    myPass(out[0], eq);

endmodule


// MY SUB MODULE IMPLEMENTED

// ========================================================================================================================

// MY TOP MODULE IMPLEMENT

module Decode_And_Execute(rs, rt, sel, rd);

    input [4-1:0] rs, rt;
    input [3-1:0] sel;

    output [4-1:0] rd;

    wire [4-1:0] r000, r001, r010, r011, r100, r101, r110, r111;

    SUB (r000, rs, rt);
    ADD (r001, rs, rt);
    BITWISE_OR (r010, rs, rt);
    BITWISE_AND (r011, rs, rt);
    RIGHT_SHIFT (r100, rt);
    LEFT_SHIFT (r101, rs);
    COMPARE_LT (r110, rs, rt);
    COMPARE_EQ (r111, rs, rt);

    wire L, R, LL, LR, RL, RR;

    MUX (rd, sel[2], L, R);
    MUX (L, sel[1], LL, LR);
    MUX (R, sel[1], RL, RR);
    MUX (LL, sel[0], r000, r001);
    MUX (LR, sel[0], r010, r011);
    MUX (RL, sel[0], r100, r101);
    MUX (RR, sel[0], r110, r111);

endmodule

// MY TOP MODULE IMPLEMENTED

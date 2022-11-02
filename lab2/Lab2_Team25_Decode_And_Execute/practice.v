`timescale 1ns/1ps

module myGate(out, a, b);

    input a, b;
    output out;

    wire b_n;
    not n0(b_n, b);
    and a0(out, a, b_n);

endmodule

module myNot(out, a);

    input a;
    output out;

    myGate g0(out, 1'b1, a);

endmodule

module myPass(out, a);
    
    input a;
    output out;

    wire w;

    myNot n0(w, a);
    myNot n1(out, w);

endmodule

module myNand(out, a, b);
    
    input a, b;
    output out;

    wire an;
    myNot n0(an, a);
    myGate g0(out, an, b);

endmodule

module myOr(out, a, b);
    
    input a, b;
    output out;

    wire tmp1, tmp2;

    myNand n0(tmp1, a, a);
    myNand n1(tmp2, b, b);
    myNand n2(out, tmp1, tmp2);

endmodule


module myAnd(out, a, b);

    input a, b;
    output out;

    wire tmp;

    myNand n0(tmp1, a, b);
    myNot n1(out, tmp1);

endmodule

module myXor(out, a, b);
    
    input a, b;
    output out;

    wire tmp1, tmp2, an, bn;

    myNot n0(an, a);
    myNot n1(bn, b);
    myAnd a0(tmp1, an, b);
    myAnd a1(tmp2, a, bn);
    myOr o0(out, tmp1, tmp2);

endmodule

module Half_Adder(out, cout, a, b);
    
    input a, b;
    output out, cout;

    myAnd a0(cout, a, b);
    myXor x0(out, a, b);

endmodule

module Full_Adder(out, cout, a, b, cin);
    
    input a, b, cin;
    output out, cout;

    wire w, c1, c2;

    Half_Adder h0(w, c1, a, b);
    Half_Adder h1(out, c2, w, cin);
    my_or h2(cout, c1, c2);

endmodule

module MUX_3x8(out, sel, a, b);

    input [4-1:0] a, b;
    input [3-1:0] sel;
    output [4-1:0] out;

    MUX_1x2

endmodule

module complement(out, a);
    
    input [4-1:0] a;
    output [4-1:0] out;

    wire [4-1:0] tmp;

    myNot n0(tmp[0], a[0]);
    myNot n1(tmp[1], a[1]);
    myNot n2(tmp[2], a[2]);
    myNot n3(tmp[3], a[3]);
    ADD a0(out, tmp, a);

endmodule

module SUB(out, a, b);
    
    input [4-1:0] a, b;
    output [4-1:0] out;

    wire [4-1:0] tmp;

    complement c0(tmp, b);
    ADD a1(out, a, tmp);

endmodule

module ADD(out, a, b);

    input [4-1:0] a, b;
    output [4-1:0] out;

    wire tmp1, tmp2, tmp3, tmp4;

    Half_Adder h0(out[0], tmp1, a[0], b[0]);
    Full_Adder h1(out[1], tmp2, a[1], b[1], tmp1);
    Full_Adder h2(out[2], tmp3, a[2], b[2], tmp2);
    Full_Adder h3(out[3], tmp4, a[3], b[3], tmp3);

endmodule

module BITWISE_OR(out, a, b);
    
    input [4-1:0] a, b;
    output [4-1:0] out;

    myOr o0(out[0], a[0], b[0]);
    myOr o1(out[1], a[1], b[1]);
    myOr o2(out[2], a[2], b[2]);
    myOr o3(out[3], a[3], b[3]);

endmodule

module BITWISE_AND(out, a, b);
    
    input [4-1:0] a, b;
    output [4-1:0] out;

    myAnd a0(out[0], a[0], b[0]);
    myAnd a1(out[1], a[1], b[1]);
    myAnd a2(out[2], a[2], b[2]);
    myAnd a3(out[3], a[3], b[3]);

endmodule

module RS(out, a);
    
    input [4-1:0] a;
    output [4-1;0] out;

    wire tmp1, tmp2, tmp3;

    myPass p0(out[0], a[1]);
    myPass p1(out[1], a[2]);
    myPass p2(out[2], a[3]);
    myPass p3(out[3], a[3]);

endmodule

module RT(out, a);
    
    input [4-1:0] a;
    output [4-1:0] out;

    myPass p0(out[0], a[3]);
    myPass p1(out[1], a[0]);
    myPass p2(out[2], a[1]);
    myPass p3(out[3], a[2]);

endmodule

module COMLT(out, a, b);
    
    input [4-1:0] a, b;
    output [4-1:0] out;

    wire tmp;

    compare c0(tmp, a, b);

    myPass p0(out[0], tmp);
    myPass p1(out[1], 1'b1);
    myPass p2(out[2], 1'b0);
    myPass p3(out[3], 1'b1);

endmodule
module COMEQ

module Decode_And_Execute(rs, rt, sel, rd);

    input [4-1:0] rs, rt;
    input [3-1:0] sel;
    output [4-1:0] rd;

    SUB s0(sub, rs, rt);
    ADD a0(add, rs, rt);
    BITWISE_OR b0(bitor, rs, rt);
    BITWISE_AND b1(bitand, rs, rt);
    RS r0(rightshift, rt);
    RT r1(leftshift, rs);
    COMLT c0(complt, rs, rt);
    COMEQ c1(complt, rs, rt);



endmodule




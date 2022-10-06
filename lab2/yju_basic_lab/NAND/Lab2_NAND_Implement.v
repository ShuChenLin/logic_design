`timescale 1ns/1ps

//-----------------
module myNot(out, a);
input a;
output out;

nand (out, a, a);

endmodule

//-----------------
module myAnd (out, a, b);
input a, b;
output out;

wire w1;

nand (w1, a, b);
myNot g0(out, w1);

endmodule

//-----------------
module myOr (out, a, b);
input a, b;
output out;

wire w1, w2;

myNot g0(w1, a);
myNot g1(w2, b);
nand (out, w1, w2);

endmodule

//-----------------
module myNor(out, a, b);
input a, b;
output out;

wire w1;
myOr g0(w1, a, b);
myNot g1(out, w1);

endmodule

//-----------------
module myXor(out, a, b);
input a, b;
output out;

wire na, nb, w1, w2;

myNot g0(na, a);
myNot g1(nb, b);
myAnd g2(w1, a, nb);
myAnd g3(w2, na, b);
myOr g4(out, w1, w2);

endmodule

//-----------------
module myXnor(out, a, b);
input a, b;
output out;

wire w1;

myXor g0(w1, a, b);
myNot g1(out, w1);
endmodule

//-----------------
module MUX_2x1(out, a, b, sel);

input a, b, sel;
output out;

wire w1, w2, nsel;

myNot g0(nsel, sel);
myAnd g1(w1, a, nsel);
myAnd g2(w2, b, sel);
myOr g3(out, w1, w2);

endmodule
//-----------------
module NAND_Implement (a, b, sel, out);
input a, b;
input [3-1:0] sel;
output out;

wire res_nand, res_and, res_or, res_nor, res_xor, res_xnor, res_not1, res_not2;
wire w2, w3, w4, w5, w6, w7;

nand (res_nand, a, b);
myAnd g0(res_and, a, b);
myOr g1(res_or, a, b);
myNor g2(res_nor, a, b);
myXor g3(res_xor, a, b);
myXnor g4(res_xnor, a, b);
myNot g5(res_not1, a);
myNot g6(res_not2, a);

MUX_2x1 g7(w4, res_nand, res_and, sel[0]);
MUX_2x1 g8(w5, res_or, res_nor, sel[0]);
MUX_2x1 g9(w6, res_xor, res_xnor, sel[0]);
MUX_2x1 g10(w7, res_not1, res_not2, sel[0]);

MUX_2x1 g11(w2, w4, w5, sel[1]);
MUX_2x1 g12(w3, w6, w7, sel[1]);
MUX_2x1 g13(out, w2, w3, sel[2]);

endmodule

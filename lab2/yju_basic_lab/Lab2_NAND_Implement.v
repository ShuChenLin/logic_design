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
myNot (out, w1);

endmodule

//-----------------
module myOr (out, a, b);
input a, b;
output out;

wire w1, w2;

myNot (w1, a);
myNot (w2, b);
nand (out, w1, w2);

endmodule

//-----------------
module myNor(out, a, b);
input a, b;
output out;

wire w1;
myOr (w1, a, b);
myNot(out, w1);

endmodule

//-----------------
module myXor(out, a, b);
input a, b;
output out;

wire na, nb, w1, w2;

myNot (na, a);
myNot (nb, b);
myAnd (w1, a, nb);
myAnd (w2, na, b);
myOr (out, w1, w2);

endmodule

//-----------------
module myXnor(out, a, b);
input a, b;
output out;

wire w1;

myXor (w1, a, b);
myNot (out, w1);
endmodule

//-----------------
module MUX_2x1(out, a, b, sel);

input a, b, sel;
output out;

wire w1, w2, nsel;

myNot (nsel, sel);
myAnd (w1, a, nsel);
myAnd (w2, b, sel);
myOr (out, w1, w2);

endmodule
//-----------------
module NAND_Implement (a, b, sel, out);
input a, b;
input [3-1:0] sel;
output out;

wire res_nand, res_and, res_or, res_nor, res_xor, res_xnor, res_not1, res_not2;
wire w2, w3, w4, w5, w6, w7;

nand (res_nand, a, b);
myAnd (res_and, a, b);
myOr (res_or, a, b);
myNor (res_nor, a, b);
myXor (res_xor, a, b);
myXnor (res_xnor, a, b);
myNot (res_not1, a);
myNot (res_not2, a);

MUX_2x1 (w4, res_nand, res_and, sel[0]);
MUX_2x1 (w5, res_or, res_nor, sel[0]);
MUX_2x1 (w6, res_xor, res_xnor, sel[0]);
MUX_2x1 (w7, res_not1, res_not2, sel[0]);

MUX_2x1 (w2, w4, w5, sel[1]);
MUX_2x1 (w3, w6, w7, sel[1]);
MUX_2x1 (out, w2, w3, sel[2]);

endmodule

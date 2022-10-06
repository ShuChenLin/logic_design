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
module Majority(a, b, c, out);

input a, b, c;
output out;

wire w1, w2, w3, w4, w5;

myAnd g0(w1, a, b);
myAnd g1(w2, a, c);
myAnd g2(w3, b, c);
myOr g3(w4, w1, w2);
myOr g4(out, w4, w3);

endmodule

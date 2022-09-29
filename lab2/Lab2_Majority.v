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
module Majority(a, b, c, out);

input a, b, c;
output out;

wire w1, w2, w3, w4, w5;

myAnd (w1, a, b);
myAnd (w2, a, c);
myAnd (w3, b, c);
myOr (w4, w1, w2);
myOr (out, w4, w3);

endmodule

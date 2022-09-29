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
module Half_Adder(a, b, cout, sum);

input a, b;

output cout, sum;

wire w1, w2;
myAnd (cout, a, b);
myXor (sum, a, b);

endmodule

//-----------------
module Full_Adder (a, b, cin, cout, sum);

input a, b, cin;
output cout, sum;

wire w1, w2, w3;

Half_adder(a, b, w1, w2);
Half_adder(w2, cin, w3, sum);
myOr (cout, w3, w1);

endmodule





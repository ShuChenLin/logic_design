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




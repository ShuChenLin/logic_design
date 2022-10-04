`timescale 1ns/1ps

module myNot(o, a);
    
    input a;
    output o;

    nand ha(o, a, a);

endmodule

module myAnd(o, a, b);
    
    input a, b;
    output o;

    nand ha(tmp, a, b);
    myNot ka(o, tmp);

endmodule

module myOr(o, a, b);
    
    input a, b;
    output o;

    wire tmp1, tmp2;

    myNot fi(tmp1, a);
    myNot se(tmp2, b);
    nand thir(o, tmp1, tmp2);

endmodule

module myXor(o, a, b);

    input a, b;
    output o;

    wire na, nb;

    myNot fi(na, a);
    myNot se(nb, b);
    myAnd bu(tmp1, a, nb);
    myAnd bu1(tmp2, b, na);
    myOr ka(o, tmp1, tmp2);

endmodule

module Half_Adder(sum, cout, a, b);
    
    input a, b;
    output sum, cout;

    myAnd fi(cout, a, b);
    myXor se(sum, a, b);

endmodule

module Full_Adder(sum, cout, a, b, cin);

    input a, b, cin;
    output sum, cout;
    
    Half_Adder h0(tmp1, tmp2, a, b);
    Half_Adder h1(sum, tmp3, tmp1, cin);
    myOr h2(cout, tmp2, tmp3);

endmodule

module Ripple_Carry_Adder(a, b, cin, cout, sum);

    input [8-1:0] a, b;
    input cin;
    output cout;
    output [8-1:0] sum;

    wire tmp1, tmp2, tmp3, tmp4, tmp5, tmp6, tmp7;

    Full_Adder u0(sum[0], tmp1, a[0], b[0], cin);
    Full_Adder u1(sum[1], tmp2, a[1], b[1], tmp1);
    Full_Adder u2(sum[2], tmp3, a[2], b[2], tmp2);
    Full_Adder u3(sum[3], tmp4, a[3], b[3], tmp3);
    Full_Adder u4(sum[4], tmp5, a[4], b[4], tmp4);
    Full_Adder u5(sum[5], tmp6, a[5], b[5], tmp5);
    Full_Adder u6(sum[6], tmp7, a[6], b[6], tmp6);
    Full_Adder u7(sum[7], cout, a[7], b[7], tmp7);

endmodule

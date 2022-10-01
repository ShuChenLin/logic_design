`timescale 1ns/1ps

module my_And(o, x, y);
    input x, y;
    output o;

    wire tmp_And;

    nand a0(tmp_And, x, y);
    nand a1(o, tmp_And, tmp_And);

endmodule

module my_Or(o, x, y);
    input x, y;
    output o;

    wire tmp1_Or, tmp2_Or;

    nand o0(tmp1_Or, x, x);
    nand o1(tmp2_Or, y, y);
    nand o2(o, tmp1_Or, tmp2_Or);

endmodule

module my_Nor(o, x, y);
    input x, y;
    output o;

    wire tmp1_Nor, tmp2_Nor, tmp3_Nor;

    nand n1(tmp1_Nor, x, x);
    nand n2(tmp2_Nor, y, y);
    nand n3(tmp3_Nor, tmp1_Nor, tmp2_Nor);
    nand n4(o, tmp3_Nor, tmp3_Nor);

endmodule

module my_Xor(o, x, y);
    input x, y;
    output o;

    wire tmp1_Xor, tmp2_Xor, tmp3_Xor;

    nand x0(tmp1_Xor, x, y);
    nand x1(tmp2_Xor, x, tmp1_Xor);
    nand x3(tmp3_Xor, y, tmp1_Xor);
    nand x4(o, tmp2_Xor, tmp3_Xor);

endmodule

module my_Xnor(o, x, y);
    input x, y;
    output o;

    wire tmp1_Xnor, tmp2_Xnor, tmp3_Xnor, tmp4_Xnor;

    nand x5(tmp1_Xnor, x, x);
    nand x6(tmp2_Xnor, y, y);
    nand x7(tmp3_Xnor, x, y);
    nand x8(tmp4_Xnor, tmp1_Xnor, tmp2_Xnor);
    nand x9(o, tmp3_Xnor, tmp4_Xnor);

endmodule

module my_three_Not(o, x);
    input [3-1:0] x;
    output [3-1:0] o;

    nand mn(o[0], x[0], x[0]);
    nand mn1(o[1], x[1], x[1]);
    nand mn2(o[2], x[2],x [2]);

endmodule

module And_4x1 (o, in1, in2, in3, in4); 
    input in1, in2, in3, in4;
    output o;

    wire tmp1, tmp2;

    my_And e0(tmp1, in1, in2);
    my_And e1(tmp2, in3, in4);
    my_And e2(o, tmp1, tmp2);

endmodule

module Or_4x1 (o, in1, in2, in3, in4);
    input in1, in2, in3, in4;
    output o;

    wire tmp1, tmp2;

    my_Or e3(tmp1, in1, in2);
    my_Or e4(tmp2, in3, in4);
    my_Or e9(o, tmp1, tmp2);

endmodule

module Mux_3x8 (o, x, y, s, n_s);
    input x, y;
    input [3-1:0] s, n_s;
    output o;

    wire tmp1, tmp2, tmp3, tmp4, tmp5, tmp6, tmp7, tmp8;
    wire mid1, mid2, mid3, mid4, mid5, mid6, mid7, mid8;
    wire ha1, ha2, ha3, ha4;

    nand m0(tmp1, x, y);
    And_4x1 q0(mid1, tmp1, n_s[0], n_s[1], n_s[2]);

    my_And m1(tmp2, x, y);
    And_4x1 q1(mid2, tmp2, s[0], n_s[1], n_s[2]);
    my_Or h0(ha1, mid1, mid2);
    //

    //
    my_Or m2(tmp3, x, y);
    And_4x1 q2(mid3, tmp3, n_s[0], s[1], n_s[2]);

    my_Nor m3(tmp4, x, y);
    And_4x1 q3(mid4, tmp4, s[0], s[1], n_s[2]);
    my_Or h1(ha2, mid3, mid4);
    //

    //
    my_Xor m4(tmp5, x, y);
    And_4x1 q4(mid5, tmp5, n_s[0], n_s[1], s[2]);

    my_Xnor m5(tmp6, x, y);
    And_4x1 q5(mid6, tmp6, s[0], n_s[1], s[2]);
    my_Or h2(ha3, mid5, mid6);
    //

    nand m6(tmp7, x, x);
    And_4x1 q6(mid7, tmp7, n_s[0], s[1], s[2]);
    And_4x1 q7(mid8, tmp7, s[0], s[1], s[2]);
    my_Or h3(ha4, mid7, mid8);

    Or_4x1 hhaha(o, ha1, ha2, ha3, ha4);
endmodule

module NAND_Implement(a, b, sel, out);
    input a, b;
    input [3-1:0] sel;
    output out;

    wire [3-1:0] n_sel;

    my_three_Not k0(n_sel, sel);

    
    Mux_3x8 annn(out, a, b, sel, n_sel);

endmodule

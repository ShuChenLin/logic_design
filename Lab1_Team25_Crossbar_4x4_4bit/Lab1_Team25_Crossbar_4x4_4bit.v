`timescale 1ns/1ps

module And_1x4_4bit(f, a, b);
    input [4-1:0] b;
    input a;
    output [4-1:0] f;

    and a0(f[0], a, b[0]);
    and a1(f[1], a, b[1]);
    and a2(f[2], a, b[2]);
    and a3(f[3], a, b[3]);

endmodule

module Or_4x4_4bit(f, a, b);
    input [4-1:0] a, b;
    output [4-1:0] f;

    or o0(f[0], a[0], b[0]);
    or o1(f[1], a[1], b[1]);
    or o2(f[2], a[2], b[2]);
    or o3(f[3], a[3], b[3]);

endmodule

module Mux_2x1_4bit(in1, in2, sel, y);
    input [4-1:0] in1, in2;
    input sel;
    output [4-1:0] y;

    wire [4-1:0] t0, t1;
    wire seln;

    not tmp0(seln, sel);
    And_1x4_4bit tmp1(t0, seln, in1);
    And_1x4_4bit tmp2(t1, sel, in2);
    Or_4x4_4bit tmp3(y, t0, t1);

endmodule

module Dmux_1x2_4bit(in, sel, y1, y2);
    input [4-1:0] in;
    input sel;
    output [4-1:0] y1, y2;

    wire seln;

    not tmp4(seln, sel);
    And_1x4_4bit tmp5(y1, seln, in);
    And_1x4_4bit tmp6(y2, sel, in);

endmodule

module Crossbar_2x2_4bit(in1, in2, control, out1, out2);
    input [4-1:0] in1, in2;
    input control;
    output [4-1:0] out1, out2;

    wire [4-1:0] mid1, mid2, mid3, mid4;
    wire control_n;

    not b0(control_n, control);
    Dmux_1x2_4bit turn1(in1, control, mid1, mid2);
    Dmux_1x2_4bit turn2(in2, control_n, mid3, mid4);
    Mux_2x1_4bit turn3(mid1, mid3, control, out1);
    Mux_2x1_4bit turn4(mid2, mid4, control_n, out2);

endmodule

module Crossbar_4x4_4bit(in1, in2, in3, in4, out1, out2, out3, out4, control);
    input [4-1:0] in1, in2, in3, in4;
    input [5-1:0] control;
    output [4-1:0] out1, out2, out3, out4;

    wire [4-1:0] mid1, mid2, mid3, mid4, mid5, mid6;

    Crossbar_2x2_4bit m1(in1, in2, control[0], mid1, mid2);
    Crossbar_2x2_4bit m2(in3, in4, control[3], mid3, mid4);
    Crossbar_2x2_4bit m3(mid2, mid3, control[2], mid5, mid6);
    Crossbar_2x2_4bit m4(mid1, mid5, control[1], out1, out2);
    Crossbar_2x2_4bit m5(mid6, mid4, control[4], out3, out4);

endmodule

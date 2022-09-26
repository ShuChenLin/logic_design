`timescale 1ns/1ps

module And_4x1(a, b, f);
    input [4-1:0] a;
    input b;
    output [4-1:0] f;

    and a0(f[0], a[0], b);
    and a1(f[1], a[1], b);
    and a2(f[2], a[2], b);
    and a3(f[3], a[3], b);

endmodule

module Dmux_1x2_4bit(d, sel, y1, y2);
    input [4-1:0] d;
    input sel;
    output [4-1:0] y1, y2;

    wire seln;

    not tmp_0(seln, sel);
    And_4x1 tmp_1(d, seln, y1);
    And_4x1 tmp_2(d, sel, y2);

endmodule

module Dmux_1x4_4bit(in, a, b, c, d, sel);
    input [4-1:0] in;
    input [2-1:0] sel;
    output [4-1:0] a, b, c, d;

    wire [4-1:0] t1, t2;

    Dmux_1x2_4bit tmp_3(in, sel[1], t1, t2);
    Dmux_1x2_4bit tmp_4(t1, sel[0], a, b);
    Dmux_1x2_4bit tmp_5(t2, sel[0], c, d);


endmodule

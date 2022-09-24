`timescale 1ns/1ps

module D_Latch(e, d, q);
input e;
input d;
output q;

wire a, b, c, dn;

not tmp0(dn, d);
and tmp1(a, d, e);
and tmp2(b, dn, e);
nor tmp3(c, q, a);
nor tmp4(q, c, b);

endmodule

module D_Flip_Flop(clk, d, q);
input clk;
input d;
output q;

wire t, clkn;

not tmp5(clkn, clk);
D_Latch tmp6(clkn, d, t);
D_Latch tmp7(clk, t, q);

endmodule

module Toggle_Flip_Flop(clk, q, t, rst_n);
input clk;
input t;
input rst_n;
output q;

wire q_n, t_n, qtn, tqn, tqxor, d;

not m1(q_n, q);
not m2(t_n, t);
and m3(qtn, q, t_n);
and m4(tqn, t, q_n);
or m5(tqxor, qtn, tqn);
and m6(d, rst_n, tqxor);

D_Flip_Flop m7(clk, d, q);

endmodule

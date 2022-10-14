`timescale 1ns/1ps

module or_4 (a, b, c, d, out);

    input a, b, c, d;
    output out;
    
    wire tmp1, tmp2;

    or o2(tmp1, a, b);
    or o1(tmp2, c, d);
    or o3(out, tmp1, tmp2);

endmodule

module or_8bit (a, b, c, d, out);
    
    input [8-1:0] a, b, c, d;
    output [8-1:0] out;

    or_4 o0(a[0], b[0], c[0], d[0], out[0]);
    or_4 o1(a[1], b[1], c[1], d[1], out[1]);
    or_4 o2(a[2], b[2], c[2], d[2], out[2]);
    or_4 o3(a[3], b[3], c[3], d[3], out[3]);
    or_4 o4(a[4], b[4], c[4], d[4], out[4]);
    or_4 o5(a[5], b[5], c[5], d[5], out[5]);
    or_4 o6(a[6], b[6], c[6], d[6], out[6]);
    or_4 o7(a[7], b[7], c[7], d[7], out[7]);

endmodule

module Memory (clk, ren, wen, waddr, raddr, din, dout);

    input clk;
    input ren, wen;
    input [7-1:0] waddr, raddr;
    input [8-1:0] din;
    output [8-1:0] dout;

    reg [8-1:0] dout = 0;
    reg [8-1:0] my_memory [0:127];

    always @(posedge clk) begin
        if (ren)begin
            dout[8-1:0] <= my_memory[raddr];
        end else begin
            dout <= 0;
        end
    end
    
    always @(posedge clk) begin
        if (wen && !ren) begin
            my_memory[waddr] <= din[8-1:0];
        end else begin
            my_memory[waddr] <= my_memory[waddr];
        end
    end

endmodule

module Bank(clk, ren, wen, waddr, raddr, din, dout);

    input clk, ren, wen;
    input [9-1:0] raddr, waddr;
    output [8-1:0] din;
    output [8-1:0] dout;

    wire aw, bw, cw, dw, ar, br, cr, dr;
    wire [8-1:0] Aout, Bout, Cout, Dout;

    assign ar = (ren && (raddr[8:7] == 2'b00)) ? 1 : 0;
    assign br = (ren && (raddr[8:7] == 2'b01)) ? 1 : 0;
    assign cr = (ren && (raddr[8:7] == 2'b10)) ? 1 : 0;
    assign dr = (ren && (raddr[8:7] == 2'b11)) ? 1 : 0;

    assign aw = (wen && (waddr[8:7] == 2'b00)) ? 1 : 0;
    assign bw = (wen && (waddr[8:7] == 2'b01)) ? 1 : 0;
    assign cw = (wen && (waddr[8:7] == 2'b10)) ? 1 : 0;
    assign dw = (wen && (waddr[8:7] == 2'b11)) ? 1 : 0;

    Memory M0(clk, ar, aw, waddr[6:0], raddr[6:0], din, Aout);
    Memory M1(clk, br, bw, waddr[6:0], raddr[6:0], din, Bout);
    Memory M2(clk, cr, cw, waddr[6:0], raddr[6:0], din, Cout);
    Memory M3(clk, dr, dw, waddr[6:0], raddr[6:0], din, Dout);
    or_8bit oo(Aout, Bout, Cout, Dout, dout);

endmodule


module Bank_4(clk, ren, wen, waddr, raddr, din, dout);

    input clk, ren, wen;
    input [11-1:0] raddr, waddr;
    output [8-1:0] din;
    output [8-1:0] dout;

    wire  b0w, b0r, b1w, b1r, b2w, b2r, b3w, b3r;

    wire [8-1:0] Aout, Bout, Cout, Dout;

    assign b0r = (ren && (raddr[10:9] === 2'b00)) ? 1 : 0;
    assign b1r = (ren && (raddr[10:9] === 2'b01)) ? 1 : 0;
    assign b2r = (ren && (raddr[10:9] === 2'b10)) ? 1 : 0;
    assign b3r = (ren && (raddr[10:9] === 2'b11)) ? 1 : 0;

    assign b0w = (wen && (waddr[10:9] === 2'b00)) ? 1 : 0;
    assign b1w = (wen && (waddr[10:9] === 2'b01)) ? 1 : 0;
    assign b2w = (wen && (waddr[10:9] === 2'b10)) ? 1 : 0;
    assign b3w = (wen && (waddr[10:9] === 2'b11)) ? 1 : 0;

    Bank B0(clk, b0r, b0w, waddr[8:0], raddr[8:0], din, Aout);
    Bank B1(clk, b1r, b1w, waddr[8:0], raddr[8:0], din, Bout);
    Bank B2(clk, b2r, b2w, waddr[8:0], raddr[8:0], din, Cout);
    Bank B3(clk, b3r, b3w, waddr[8:0], raddr[8:0], din, Dout);
    or_8bit OO(Aout, Bout, Cout, Dout, dout);

endmodule


module Multi_Bank_Memory (clk, ren, wen, waddr, raddr, din, dout);

    input clk;
    input ren, wen;
    input [11-1:0] waddr;
    input [11-1:0] raddr;
    input [8-1:0] din;
    output [8-1:0] dout;

    Bank_4 BB(clk, ren, wen, waddr, raddr, din, dout);

endmodule

`timescale 1ns/1ps

module Dmux_1x4_4bit_t;
    reg [3:0] in = 4'b1;
    reg [1:0] sel = 2'b0;

    wire [3:0] a, b, c, d;

    Dmux_1x4_4bit m1(
        .in (in),
        .a (a),
        .b (b),
        .c (c),
        .d (d),
        .sel (sel)
    );

    initial begin
        $dumpfile("DMUX.vcd");
        $dumpvars("+all");
    end

    initial begin
        repeat (2 ** 3) begin
            #1 sel = sel + 2'b1;
            in = in + 4'b1;
        end
        #1 $finish;
    end

endmodule

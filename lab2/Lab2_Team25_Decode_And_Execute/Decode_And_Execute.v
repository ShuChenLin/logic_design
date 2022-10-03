`timescale 1ns/1ps

module Decode_And_Execute_t;
    reg [3:0] rs = 4'b010;
    reg [3:0] rt = 4'b111;
    reg [2:0] sel = 3'b000;
    wire [3:0] rd;

    Decode_And_Execute m1(
        .rs (rs),
        .rt (rt),
        .sel (sel),
        .rd (rd)
    );

    initial begin
        $dumpfile("decode_and_execute.vcd");
        $dumpvars("+all");
    end

    initial begin
        repeat (2 ** 3) begin
            #1 sel = sel + 1'b1;
        end
        #1 $finish;
    end

endmodule

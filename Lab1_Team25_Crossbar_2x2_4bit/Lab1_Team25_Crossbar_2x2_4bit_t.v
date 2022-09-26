`timescale 1ns/1ps

module Crossbar_2x2_4bit_t;
    reg [3:0] in1 = 4'b0001;
    reg [3:0] in2 = 4'b0101;
    wire [3:0] out1, out2;
    reg control = 1'b0;

    Crossbar_2x2_4bit m1(
        .in1 (in1),
        .in2 (in2),
        .control (control),
        .out1 (out1),
        .out2 (out2)
    );

    initial begin
        $dumpfile("Crossbar_2x2.vcd");
        $dumpvars("+all");
    end

    initial begin
        repeat(2 ** 3) begin
            #1 control = 1'b1 - control;
            in1 = in1 + 4'b1;
            in2 = in2 + 4'b1;
        end
        #1 $finish;
    end 

endmodule

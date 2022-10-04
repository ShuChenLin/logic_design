`timescale 1ns/1ps

module NADN_Implement_t;
reg a = 1'b0;
reg b = 1'b0;
reg [2:0] sel = 3'd0;
wire out;

NAND_Implement nand_i(
    .a (a),
    .b (b),
    .sel (sel),
    .out (out)
);

initial begin
    $dumpfile("NAND_Implement.vcd");
    $dumpvars("+all");
end

initial begin
    repeat (2 ** 5) begin
        #1 {sel, a, b} = {sel, a, b} + 1'b1;
    end
    #1 $finish;
end
endmodule

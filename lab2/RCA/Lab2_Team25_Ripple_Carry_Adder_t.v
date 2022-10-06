`timescale 1ns/1ps

module ripple_carry_adder_t;

    reg [8-1:0] a = 8'b00000000;
    reg [8-1:0] b = 8'b00000000;
    reg cin = 1'b0;
    wire cout;
    wire [8-1:0] sum;

    Ripple_Carry_Adder m1(
        .a (a),
        .b (b),
        .cin (cin),
        .cout (cout),
        .sum (sum)
    );

    initial begin
        $dumpfile("rca.vcd");
        $dumpvars("+all");
    end

    initial begin
        repeat (2 ** 17) begin
            #1 {a, b, cin} = {a, b, cin} + 1'b1;
        end
        #1 $finish;
    end
endmodule

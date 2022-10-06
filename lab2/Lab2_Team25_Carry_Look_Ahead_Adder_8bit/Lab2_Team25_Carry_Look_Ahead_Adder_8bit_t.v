`timescale 1ns/1ps

module Carry_Look_Ahead_Adder_t;
	
	reg [8-1:0] a = 8'b00000000, b = 8'b00000000;
	reg c0 = 1'b0;

	wire [8-1:0] s;
	wire c8;

	Carry_Look_Ahead_Adder_8bit m1(
		.a(a), 
		.b(b), 
		.c0(c0), 
		.s(s),
		.c8(c8)
	);

	initial begin
		$dumpfile("cla.vcd");
		$dumpvars("+all");
	end

	initial begin 
		repeat (2**17) begin
			#1
			assign {a, b, c0} = {a, b, c0} + 17'b1;
		end
		#1 $finish;
	end

endmodule


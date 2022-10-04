`timescale 1ns/1ps

module Decode_And_Exectue_t;
	
	reg [4-1:0] rs = 4'b0000, rt = 4'b0000;
	reg [3-1:0] sel = 3'b000;

	wire [4-1:0] rd;

	Decode_And_Execute m1(
		.rs (rs),
		.rt (rt),
		.sel (sel),
		.rd (rd)
	);

	initial begin
		$dumpfile("Decode_And_Execute.vcd");
		$dumpvars("+all");
	end

	initial begin 
		repeat (2**3) begin
			repeat (2**4) begin
				repeat (2**4) begin
					#1 rt = rt + 4'b0001;
				end
				rs = rs + 4'b0001;
			end
			sel = sel + 3'b001;
		end
		#1 $finish;
	end

endmodule


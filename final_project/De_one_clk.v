`timescale 1ns/1ps

module onepulse(clk, s, s_op);

	input s, clk;
	output reg s_op;

	reg s_delay;

	always@(posedge clk)begin
		s_op <= s&(!s_delay);
		s_delay <= s;
	end

endmodule

module debounce(clk, s, s_db);

	input s, clk;
	output s_db;

	reg [3:0] DFF;
	
	always@(posedge clk)begin
		DFF[3:1] <= DFF[2:0];
		DFF[0] <= s;
	end

	assign s_db = (DFF == 4'b1111)? 1'b1 : 1'b0;

endmodule

module clk_div #(parameter n = 2)(clk, clk_d);

	input clk;
	output clk_d;

	reg [n-1:0]count;
	wire[n-1:0]next_count;
	
	always@(posedge clk)begin
		count <= next_count;
	end
	
	assign next_count = count + 1;
	assign clk_d = count[n-1];

endmodule

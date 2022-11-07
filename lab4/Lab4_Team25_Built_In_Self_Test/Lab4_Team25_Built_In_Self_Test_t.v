`timescale 1ns/1ps

module Built_in_Self_Test_t();

	reg clk = 0;
	reg rst_n = 0;
	reg scan_en = 0;

	wire scan_in;
	wire scan_out;

	always #(5) clk = ~clk;

	Built_In_Self_Test M1(
		.clk(clk),
		.rst_n(rst_n),
		.scan_en(scan_en),
		.scan_in(scan_in),
		.scan_out(scan_out)
	);

	initial begin
		$dumpfile("Build_In_Self_Test.vcd");
		$dumpvars("+all");
	end

	initial begin
		@(negedge clk)
		rst_n = 1;
		@(negedge clk)
		scan_en = 1;

		repeat (100) begin
			@(negedge clk)
			scan_en = $random | $random | $random;
		end
		$finish;
	end



endmodule

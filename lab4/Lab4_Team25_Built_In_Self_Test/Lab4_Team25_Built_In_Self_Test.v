`timescale 1ns/1ps

module Built_In_Self_Test(clk, rst_n, scan_en, scan_in, scan_out);

    input clk;
    input rst_n;
    input scan_en;
    output scan_in;
    output scan_out;

    Q3 M1(
        .clk(clk),
        .rst_n(rst_n),
        .out(scan_in)
    );    
    Scan_Chain_Design M2(
        .clk(clk),
        .rst_n(rst_n),
        .scan_in(scan_in),
        .scan_en(scan_en),
        .scan_out(scan_out)
    );

endmodule

module Q3(clk, rst_n, out);

    input clk, rst_n;
    output wire out;
    reg [8-1:0] mem;

    assign out = mem[7];

    always @(posedge clk) begin
        if (~rst_n) begin
            mem <= 8'b10111101;
        end else begin
            mem[7] <= mem[6];
            mem[6] <= mem[5];
            mem[5] <= mem[4];
            mem[4] <= mem[3];
            mem[3] <= mem[2];
            mem[2] <= mem[1];
            mem[1] <= mem[0];
            mem[0] <= (mem[1] ^ mem[2] ^ mem[3] ^ mem[7]);
        end
    end
//    always #(5) begin
//        $display("out: %b", out);
//    end
endmodule

module Scan_Chain_Design(clk, rst_n, scan_in, scan_en, scan_out);
    input clk;
    input rst_n;
    input scan_in;
    input scan_en;
    output reg scan_out;

    reg [7:0] p;
    reg [7:0] sdff;

    always @(*) begin
        p = sdff[7:4]*sdff[3:0];
        scan_out = sdff[0];
    end

    always @(posedge clk) begin
        if (!rst_n) begin
            sdff <= 8'b00000000;
        end else begin
            if (scan_en) begin
                sdff <= {scan_in, sdff[7:1]};
            end else begin
                sdff <= p;
            end
        end
    end

	always @(negedge clk) begin
		$display(
			"scan_in: %b | scan_en: %b | a: %d | b: %d | p: %d | sdff: %b",
			scan_in, scan_en, sdff[7:4], sdff[3:0], p, sdff[7:0]
		);
	end

endmodule

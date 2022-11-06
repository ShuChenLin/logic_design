`timescale 1ns/1ps

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
            "rst_n: %b | scan_in: %b | scan_en: %b | a: %d | b: %d | p: %d | sdff: %b",
            rst_n, scan_in, scan_en, sdff[7:4], sdff[3:0], p, sdff[7:0]
        );
    end

endmodule

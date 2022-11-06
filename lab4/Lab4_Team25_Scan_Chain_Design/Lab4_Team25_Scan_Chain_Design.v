`timescale 1ns/1ps

module Scan_Chain_Design(clk, rst_n, scan_in, scan_en, scan_out);
    input clk;
    input rst_n;
    input scan_in;
    input scan_en;
    output scan_out;

    reg [3:0] a, b;
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
                sdff <= p;
            end else begin
                sdff <= {scan_in, sdff[7:1]};
            end
        end
    end

endmodule

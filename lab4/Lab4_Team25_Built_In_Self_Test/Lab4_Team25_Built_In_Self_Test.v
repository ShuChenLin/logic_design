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
    output reg [8-1:0] out;

    always @(posedge clk) begin
        if (~rst_n) begin
            out <= 8'b10111101;
        end else begin
            out[7] <= out[6];
            out[6] <= out[5];
            out[5] <= out[4];
            out[4] <= out[3];
            out[3] <= out[2];
            out[2] <= out[1];
            out[1] <= out[0];
            out[0] <= (out[1] ^ out[2] ^ out[3] ^ out[7]);
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

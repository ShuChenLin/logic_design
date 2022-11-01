`timescale 1ns/1ps

module Many_To_One_LFSR(clk, rst_n, out);

    input clk;
    input rst_n;
    output reg [8-1:0] out;

    wire tmp1, tmp2, in;

    xor x0(tmp1, out[7], out[3]);
    xor x1(tmp2, out[1], out[2]);
    xor x2(in, tmp1, tmp2);

    always @(posedge clk) begin
        if (!rst_n) begin
            out <= 8'b10111101;
        end else begin
            out[0] <= in;
            out[1] <= out[0];
            out[2] <= out[1];
            out[3] <= out[2];
            out[4] <= out[3];
            out[5] <= out[4];
            out[6] <= out[5];
            out[7] <= out[6];
        end
    end

endmodule


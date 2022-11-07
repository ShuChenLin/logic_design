`timescale 1ns/1ps

module Content_Addressable_Memory(clk, wen, ren, din, addr, dout, hit);

    input clk;
    input wen, ren;
    input [7:0] din;
    input [3:0] addr;
    output [3:0] dout;
    output hit;

    reg [4-1:0] dout, tmp_out;
    reg hit, found, next_hit;
    reg [8-1:0] memory [16-1:0];
    wire [4-1:0] next_dout;
    integer i;

    always @(posedge clk) begin
        if (ren) begin
            if (next_hit) begin
                dout <= tmp_out;  
            end else begin
                dout <= 4'b0;
            end
        end else if (wen) begin
            memory[addr] <= din;
            dout <= 4'b0;
        end
    end

    always @(posedge clk) begin
        hit <= next_hit;
    end

    always @(*) begin
        next_hit = 0;
        found = 0;
        if (ren) begin
            for (i = 0; i < 16; i = i + 1) begin
                if (memory[i] == din && !found) begin
                    next_hit = 1'b1;
                    found = 1'b1;
                    tmp_out = i;
                end else begin
                    next_hit = next_hit;
                    found = found;
                    tmp_out = tmp_out;
                end
            end
        end else begin
            next_hit = 1'b0;
            found = 1'b0;
            tmp_out = 4'b0;
        end
    end

endmodule

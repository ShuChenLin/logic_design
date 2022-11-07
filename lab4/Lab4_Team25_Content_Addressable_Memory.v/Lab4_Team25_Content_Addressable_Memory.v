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
            if (memory[0] == din && !found) begin
                next_hit = 1'b1;
                found = 1'b1;
                tmp_out = 0;
            end else if (memory[1] == din && !found) begin
                next_hit = 1'b1;
                found = 1'b1;
                tmp_out = 1;
            end else if (memory[2] == din && !found) begin
                next_hit = 1'b1;
                found = 1'b1;
                tmp_out = 2;
            end else if (memory[3] == din && !found) begin
                next_hit = 1'b1;
                found = 1'b1;
                tmp_out = 3;
            end else if (memory[4] == din && !found) begin
                next_hit = 1'b1;
                found = 1'b1;
                tmp_out = 4;
            end else if (memory[5] == din && !found) begin
                next_hit = 1'b1;
                found = 1'b1;
                tmp_out = 5;
            end else if (memory[6] == din && !found) begin
                next_hit = 1'b1;
                found = 1'b1;
                tmp_out = 6;
            end else if (memory[7] == din && !found) begin
                next_hit = 1'b1;
                found = 1'b1;
                tmp_out = 7;
            end else if (memory[8] == din && !found) begin
                next_hit = 1'b1;
                found = 1'b1;
                tmp_out = 8;
            end else if (memory[9] == din && !found) begin
                next_hit = 1'b1;
                found = 1'b1;
                tmp_out = 9;
            end else if (memory[10] == din && !found) begin
                next_hit = 1'b1;
                found = 1'b1;
                tmp_out = 10;
            end else if (memory[11] == din && !found) begin
                next_hit = 1'b1;
                found = 1'b1;
                tmp_out = 11;
            end else if (memory[12] == din && !found) begin
                next_hit = 1'b1;
                found = 1'b1;
                tmp_out = 12;
            end else if (memory[13] == din && !found) begin
                next_hit = 1'b1;
                found = 1'b1;
                tmp_out = 13;
            end else if (memory[14] == din && !found) begin
                next_hit = 1'b1;
                found = 1'b1;
                tmp_out = 14;
            end else if (memory[15] == din && !found) begin
                next_hit = 1'b1;
                found = 1'b1;
                tmp_out = 15;
            end else begin
                next_hit = next_hit;
                found = found;
                tmp_out = tmp_out;
            end
        end else begin
            next_hit = 1'b0;
            found = 1'b0;
            tmp_out = 4'b0;
        end
    end

endmodule

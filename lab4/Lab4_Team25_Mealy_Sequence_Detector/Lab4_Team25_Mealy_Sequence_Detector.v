`timescale 1ns/1ps

module Mealy_Sequence_Detector (clk, rst_n, in, dec);

    input clk, rst_n;
    input in;
    output dec;

    reg dec;
    reg [4-1:0] state, next_state;

    always @(posedge clk, negedge in) begin
        if (!rst_n && clk) begin
            state <= 4'b0000;
        end else begin
            state <= next_state;
        end
    end

    always @(*) begin
        if (in) begin
            next_state = (state << 1) + 1'b1;
        end else begin
            next_state = state << 1;
        end
    end

    always @(*) begin
        if (state == 4'b0111) begin
            dec = 1;
        end else if (state == 4'b1011) begin
            dec = 1;
        end else if (state == 4'b1100) begin
            dec = 1;
        end else begin
            dec = 0;
        end
    end


endmodule

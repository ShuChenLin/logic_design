`timescale 1ns/1ps

module Mealy (clk, rst_n, in, out, state);

    input clk, rst_n;
    input in;
    output out;
    output [3-1:0] state;

    parameter S0 = 3'b000;
    parameter S1 = 3'b001;
    parameter S2 = 3'b010;
    parameter S3 = 3'b011;
    parameter S4 = 3'b100;
    parameter S5 = 3'b101;

    reg [3-1:0] next_state, state;
    reg out;

    always @(posedge clk) begin
        if (!rst_n) begin
            state <= S0;
        end else begin
            state <= next_state;
        end
    end

    always @(*) begin
        case (state)
            S0 : begin
                if (in) begin
                    out = 1;
                    next_state = S2;
                end else begin
                    out = 0;
                    next_state = S0;
                end
            end
            S1 : begin
                if (in) begin
                    out = 1;
                    next_state = S4;
                end else begin
                    out = 1;
                    next_state = S0;
                end
            end
            S2 : begin
                if (in) begin
                    out = 0;
                    next_state = S1;
                end else begin
                    out = 1;
                    next_state = S5;
                end
            end
            S3 : begin
                if (in) begin
                    out = 0;
                    next_state = S2;
                end else begin
                    out = 1;
                    next_state = S3;
                end
            end
            S4 : begin
                if (in) begin
                    out = 1;
                    next_state = S4;
                end else begin
                    out = 1;
                    next_state = S2;
                end
            end
            S5 : begin
                if (in) begin
                    out = 0;
                    next_state = S4;
                end else begin
                    out = 0;
                    next_state = S3;
                end
            end
        endcase
    end
endmodule

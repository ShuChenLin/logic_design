`timescale 1ns/1ps

module Sliding_Window_Sequence_Detector (clk, rst_n, in, dec);

    input clk, rst_n;
    input in;
    output dec;

    reg [3:0] state, next_state;
    reg dec;

    parameter S0 = 4'b0000;
    parameter S1 = 4'b0001;
    parameter S2 = 4'b0010;
    parameter S3 = 4'b0011;
    parameter S4 = 4'b0100;
    parameter S5 = 4'b0101;
    parameter S6 = 4'b0110;
    parameter S7 = 4'b0111;
    parameter S8 = 4'b1000;

    always @(*) begin
        case (state) 
            S0 : begin
                if (in) next_state = S1;
                else next_state = S0;
            end
            S1 : begin
                if (in) next_state = S2;
                else next_state = S0;
            end
            S2 : begin
                if (in) next_state = S3;
                else next_state = S0;
            end
            S3 : begin
                if (in) next_state = S3;
                else next_state = S4;
            end
            S4 : begin
                if (in) next_state = S1;
                else next_state = S5;
            end
            S5 : begin
                if (in) next_state = S6;
                else next_state = S0;
            end
            S6 : begin
                if (in) next_state = S7;
                else next_state = S5;
            end
            S7 : begin
                if (in) next_state = S8;
                else next_state = S0;
            end
            S8 : begin
                if (in) next_state = S3;
                else next_state = S0;
            end
            default : begin
                next_state = S0;
            end
        endcase
    end

    always @(*) begin
        if (state == S7 && in) begin
            dec = 1;
        end else dec = 0;
    end

    always @(posedge clk) begin
        if (!rst_n) begin
            state <= S0;
        end else begin
            state <= next_state;
        end
    end

endmodule 

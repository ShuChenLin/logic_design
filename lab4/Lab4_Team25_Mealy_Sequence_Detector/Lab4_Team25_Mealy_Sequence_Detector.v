`timescale 1ns/1ps

module Mealy_Sequence_Detector (clk, rst_n, in, dec);

    input clk, rst_n;
    input in;
    output dec;
        
    parameter S0 = 4'b0000;
    parameter S1 = 4'b0001;
    parameter S2 = 4'b0010;
    parameter S3 = 4'b0011;
    parameter S4 = 4'b0100;
    parameter S5 = 4'b0101;
    parameter S6 = 4'b0110;
    parameter S7 = 4'b0111;
    parameter S8 = 4'b1000;
    parameter S9 = 4'b1001;
    parameter S10 = 4'b1010;

    reg dec;
    reg [4-1:0] state, next_state;

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
               if (in) next_state = S4;
               else next_state = S1;
            end
            S1 : begin
                if (in) next_state = S2;
                else next_state = S9;
            end
            S2 : begin
                if (in) next_state = S3;
                else next_state = S10;
            end
            S3 : begin
                next_state = S0;
            end
            S4 : begin
                if (in) next_state = S7;
                else next_state = S5;
            end
            S5 : begin
                if (in) next_state = S6;
                else next_state = S10;
            end
            S6 : begin
                next_state = S0;
            end
            S7 : begin
                if (in) next_state = S10;
                else next_state = S8;
            end
            S8 : begin
                next_state = S0;
            end
            S9 : begin
                next_state = S10;
            end
            S10 : begin
                next_state = S0;
            end
            default : begin
                next_state = S0;
            end
        endcase
    end

    always @(*) begin
        if (in) begin
            if ((state == S3) || (state == S6)) begin
                dec = 1'b1;
            end else begin
                dec = 1'b0;
            end
        end else begin
            if (state == S8) begin
                dec = 1'b1;
            end else begin
                dec = 1'b0;
            end
        end
    end


endmodule

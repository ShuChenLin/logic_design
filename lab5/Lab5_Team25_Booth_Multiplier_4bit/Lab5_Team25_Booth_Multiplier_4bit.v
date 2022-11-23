`timescale 1ns/1ps

module Booth_Multiplier_4bit(clk, rst_n, start, a, b, p);

    input clk, rst_n;
    input start;
    input signed [3:0] a, b;
    output signed [7:0] p;
    
    parameter WAIT = 2'b00;
    parameter CAL = 2'b01;
    parameter FINISH = 2'b10;

    reg [9:0] P, A, S, next_P;

    reg [2:0] count, next_count;
    wire [9:0] ps, pa;

    reg [1:0] state, next_state;

    reg [7:0] p;

    wire signed [4:0] aaa;

    assign ps = P+S;
    assign pa = P+A;

    assign aaa = a;

    always @(*) begin
        if (state == WAIT) begin
            p = 8'b0;
            if (start == 1'b1) begin
                next_state = CAL;
                next_count = 3'b0;
                A = {aaa, 5'b0};
                S = {-aaa, 5'b0};
                next_P = {5'b0, b, 1'b0};
            end else begin
                next_state = WAIT;
            end
        end else if (state == CAL) begin
            p = 8'b0;
            next_count = count + 1'b1;
            if (P[1:0] == 2'b10) begin
                next_P = {ps[9], (ps>>1)};
            end else if (P[1:0] == 2'b01) begin
                next_P = {pa[9], (pa>>1)};
            end else begin
                next_P = {P[9], (P>>1)};
            end
            if (count == 3'b11) begin
                next_state = FINISH;
                next_count = 3'b0;
            end else begin
                next_state = CAL;
            end
        end else if (state == FINISH) begin
            p = P[8:1];
            next_count = count + 1'b1;
            if (count == 3'b1) begin
                next_state = WAIT;
            end else begin
                next_state = FINISH;
            end
        end
    end

    always @(posedge clk) begin
        if (rst_n == 1'b0) begin
            state <= WAIT;
            count <= 3'b0;
            P <= 8'b0;
        end else begin
            state <= next_state;
            count <= next_count;
            P <= next_P;
        end
    end
    
endmodule

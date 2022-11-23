`timescale 1ns/1ps

module Greatest_Common_Divisor (clk, rst_n, start, a, b, done, gcd);

    input clk, rst_n;
    input start;
    input [15:0] a;
    input [15:0] b;
    output reg done;
    output reg [15:0] gcd;
    
    parameter WAIT = 2'b00;
    parameter CAL = 2'b01;
    parameter FINISH = 2'b10;
    
    reg [15:0] A, B, next_A, next_B;
    reg [15:0] mygcd;

    reg [1:0] count, next_count;
    reg [1:0] state, next_state;

    always @(*) begin
        if (state == WAIT) begin
            next_count = 2'b0;
            gcd = 16'b0;
            done = 1'b0;
            if (start == 1'b1) begin
                next_A = a;
                next_B = b;
                next_state = CAL;
            end else begin
                next_state = WAIT; 
            end
        end else if (state == CAL) begin
            next_count = 2'b0;
            gcd = 16'b0;
            done = 1'b0;
            if (A == 0) begin
                next_state = FINISH;
                mygcd = B;
            end else begin
                if (B == 0) begin
                    next_state = FINISH;
                    mygcd = A;
                end else if (A > B) begin
                    next_state = CAL;
                    next_A = A-B;
                    next_B = B;
                end else begin
                    next_state = CAL;
                    next_A = A;
                    next_B = B-A;
                end
            end
        end else if (state == FINISH) begin
            gcd = mygcd;
            done = 1'b1;
            if (count == 2'b0) begin
                next_count = count + 1'b1;
                next_state = FINISH;
            end else begin
                next_count = 2'b0;
                next_state = WAIT;
            end
        end
    end

    always @(posedge clk) begin
        if (rst_n == 1'b0) begin
            state <= WAIT;
            A <= 16'b0;
            B <= 16'b0;
            gcd <= 16'b0;
            done <= 1'b0;
            count <= 2'b0;
        end else begin
            state <= next_state;
            A <= next_A;
            B <= next_B;
            count <= next_count;
        end
    end
    
endmodule

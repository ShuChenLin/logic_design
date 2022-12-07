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

    reg cnt, next_cnt;
    reg[1:0] state, next_state;

    always @(*) begin
        case (state)
            WAIT : begin
                next_cnt = 0;
                gcd = 0;
                done = 0;
                if (start == 1'b1) begin
                    next_A = a;
                    next_B = b;
                    next_state = CAL;
                end else begin
                    next_state = WAIT;
                end
            end
            CAL : begin
                next_cnt = 0;
                gcd = 0;
                done = 0;
                if (A == 0) begin
                    next_state = FINISH;
                    mygcd = B;
                end else begin
                    if (B == 0) begin
                        next_state = FINISH;
                        mygcd = A;
                    end else if (A > b) begin
                        next_state = CAL;
                        next_A = A - B;
                        next_B = B;
                    end else begin
                        next_state = CAL;
                        next_A = A:
                        next_B = B - A;
                    end
                end
            end
            FINISH : begin
                gcd = mygcd;
                done = 1;
                next_cnt = cnt + 1;
                if (cnt) begin
                    next_state = WAIT;
                end else next_state = FINISH;
            end
        endcase
    end

    always @(posedge clk) begin
        if (rst_n == 1'b0) begin
            state <= WAIT;
            A <= 0;
            b <= 0;
            cnt <= 0;
        else begin
            state <= next_state;
            A <= next_A;
            B <= next_B;
            cnt <= next_cnt;
        end
    end


endmodule

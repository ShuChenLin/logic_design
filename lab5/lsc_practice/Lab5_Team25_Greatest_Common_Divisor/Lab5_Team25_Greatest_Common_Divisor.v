`timescale 1ns/1ps

module Greatest_Common_Divisor (clk, rst_n, start, a, b, done, gcd);

    input clk, rst_n;
    input start;
    input [15:0] a;
    input [15:0] b;
    output done;
    output [15:0] gcd;

    reg [15:0] x, y, nx, ny;
    reg [1:0] state;
    parameter WAIT = 2'b00;
    parameter CAL = 2'b01;
    parameter FINISH = 2'b10;

    //cal=================================
    always @(*) begin
        gcd = 0; nx = 0, ny = 0;
        case (state)
            WAIT : begin
                nx = a;
                ny = b;
            end
            CAL : begin
                
            end
        endcase
    end
        
    always @(posedge clk) begin
        if (rst_n) begin
            x <= a;
            y <= b;
        end else begin
            x <= nx;
            y <= ny;
        end
    end
    //====================================
    
    //FSM=================================
    always @(*) begin
        case (state) 
            WAIT : begin
                if (start == 1'b1) next_state = CAL;
                else next_state = WAIT;
            end
            CAL : begin
                if (done == 1'b1) next_state = FINISH;
                else next_state = CAL;
            end
            FINISH : begin
                if (gcd > 0 && cnt == 1'b1) next_state = WAIT;
                else next_state = FINISH;
            end
        endcase
    end

    always @(posedge clk) begin
        if (rst_n) begin
            state <= WAIT;
        end else state <= next_state;
    end
    //===================================

endmodule

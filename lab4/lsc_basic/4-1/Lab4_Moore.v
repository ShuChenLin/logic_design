`timescale 1ns/1ps

module Moore (clk, rst_n, in, out, state);

    input clk, rst_n;
    input in;
    output [2-1:0] out;
    output [3-1:0] state;

    reg [3-1:0] state, next_state;
    reg [2-1:0] out, next_out;

    parameter S0 = 3'b000;
    parameter S1 = 3'b001;
    parameter S2 = 3'b010;
    parameter S3 = 3'b011;
    parameter S4 = 3'b100;
    parameter S5 = 3'b101;

    always @(posedge clk) begin
        if (!rst_n) begin
            state <= S0;
            out <= 2'b11;
        end
        else begin
            state <= next_state;
            out <= next_out;
        end
    end

    always @(*) begin
        case (state)
            S0 : begin
                if (in) begin
                    next_state = S2;
                    next_out = 2'b11;
                end else begin
                    next_state = S1;
                    next_out = 2'b01;
                end
            end
            S1 : begin
                if (in) begin
                    next_state = S5;
                    next_out = 2'b00;
                end else begin
                    next_state = S4;
                    next_out = 2'b10;
                end
            end
            S2 : begin
                if (in) begin
                    next_state = S3;
                    next_out = 2'b10;
                end else begin
                    next_state = S1;
                    next_out = 2'b01;
                end
            end
            S3 : begin
                if (in) begin
                    next_state = S0;
                    next_out = 2'b11;
                end else begin
                    next_state = S1;
                    next_out = 2'b01;
                end
            end
            S4 : begin
                if (in) begin
                    next_state = S5;
                    next_out = 2'b00;
                end else begin
                    next_state = S4;
                    next_out = 2'b10;
                end
            end
            S5 : begin
                if (in) begin
                    next_state = S0;
                    next_out = 2'b11;
                end else begin
                    next_state = S3;
                    next_out = 2'b10;
                end
            end
            default : begin
                next_state = S0;
                next_out = 2'b11;
            end
        endcase
    end

endmodule

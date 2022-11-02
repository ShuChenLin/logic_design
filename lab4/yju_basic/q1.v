`timescale 1ns/1ps

module moore_machine(clk, rst_n, dir, state, out);

    input clk, rst_n, dir;
    output reg [3-1:0] state;
    output reg [2-1:0] out;

    always @(*) begin
        case (state)
            3'b000: next_state = (~dir ? 3'b001 : 3'b010);
            3'b001: next_state = (~dir ? 3'b100 : 3'b101);
            3'b010: next_state = (~dir ? 3'b001 : 3'b011);
            3'b011: next_state = (~dir ? 3'b001 : 3'b000);
            3'b100: next_state = (~dir ? 3'b100 : 3'b101);
            3'b101: next_state = (~dir ? 3'b011 : 3'b000);
            default: next_state = 3'b111;
        endcase
        case (state)
            3'b000: out = 2'b11;
            3'b001: out = 2'b01;
            3'b010: out = 2'b11;
            3'b011: out = 2'b10;
            3'b100: out = 2'b10;
            3'b101: out = 2'b00;
            default: out = 2'b11;
        endcase
    end

    always @(posedge clk) begin
        if (rst_n) begin
            state <= 3'b000;
        end else begin
            state <= next_state;
        end
    end

endmodule

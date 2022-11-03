`timescale 1ns/1ps

//`define 3'b000 3'b000;
//`define 3'b001 3'b001;
//`define 3'b010 3'b010;
//`define 3'b011 3'b011;
//`define 3'b100 3'b100;
//`define 3'b101 3'b101;

module mealy_machine(clk, rst_n, in, state, out);

    input rst_n, clk, in;
    output reg [3-1:0] state;
    output reg out;

    always @(*) begin
        case ({state, in})
            {3'b000, 1'b0}: out = 1'b0;
            {3'b000, 1'b1}: out = 1'b1;
            {3'b001, 1'b0}: out = 1'b1;
            {3'b001, 1'b1}: out = 1'b1;
            {3'b010, 1'b0}: out = 1'b1;
            {3'b010, 1'b1}: out = 1'b0;
            {3'b011, 1'b0}: out = 1'b1;
            {3'b011, 1'b1}: out = 1'b0;
            {3'b100, 1'b0}: out = 1'b1;
            {3'b100, 1'b1}: out = 1'b1;
            {3'b101, 1'b0}: out = 1'b0;
            {3'b101, 1'b1}: out = 1'b0;
        endcase
    end

    always @(posedge clk) begin
        if (~rst_n) begin
            state <= 3'b000;
        end else begin
            case (state)
                3'b000: state <= (~in ? 3'b000 : 3'b010);
                3'b001: state <= (~in ? 3'b000 : 3'b100);
                3'b010: state <= (~in ? 3'b101 : 3'b001);
                3'b011: state <= (~in ? 3'b011 : 3'b010);
                3'b100: state <= (~in ? 3'b010 : 3'b100);
                3'b101: state <= (~in ? 3'b011 : 3'b100);
            endcase
        end
    end

    always #(5) begin
        $display("state: %b, out: %b, in: %b",state, out, in);
    end

endmodule

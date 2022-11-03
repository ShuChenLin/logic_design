`timescale 1ns/1ps

`define S0 3'b000;
`define S1 3'b001;
`define S2 3'b010;
`define S3 3'b011;
`define S4 3'b100;
`define S5 3'b101;

module mealy_machine(clk, rst_n, in, state, out);

    input rst_n, clk, in;
    output reg state, out;


    always @(*) begin
        case ({state, in})
            {S0, 1'b0}: out =  1'b0;
            {S0, 1'b1}: out =  1'b1;
            {S1, 1'b0}: out =  1'b1;
            {S1, 1'b1}: out =  1'b1;
            {S2, 1'b0}: out =  1'b1;
            {S2, 1'b1}: out =  1'b0;
            {S3, 1'b0}: out =  1'b1;
            {S3, 1'b1}: out =  1'b0;
            {S4, 1'b0}: out =  1'b1;
            {S4, 1'b1}: out =  1'b1;
            {S5, 1'b0}: out =  1'b0;
            {S5, 1'b1}: out =  1'b0;
        end
    end

    always @(posedge clk) begin
        if (!rst_n) begin
            state <= S0;
        end else begin
            case (state) begin
                S0: state <= (~in ? S0 : S2);
                S1: state <= (~in ? S0 : S4);
                S2: state <= (~in ? S5 : S1);
                S3: state <= (~in ? S3 : S2);
                S4: state <= (~in ? S2 : S4);
                S5: state <= (~in ? S3 : S4);
            end
        end
    end

endmodule

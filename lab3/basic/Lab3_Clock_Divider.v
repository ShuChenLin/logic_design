`timescale 1ns/1ps

module Clock_Divider (clk, rst_n, sel, clk1_2, clk1_4, clk1_8, clk1_3, dclk);
    
    input clk, rst_n;
    input [2-1:0] sel;
    output clk1_2;
    output clk1_4;
    output clk1_8;
    output clk1_3;
    output dclk;

    reg clk1_2, clk1_3, clk1_4, clk1_8, dclk;
    reg cnt2, next_cnt2;
    reg [2-1:0] cnt3, next_cnt3, cnt4, next_cnt4;
    reg [3-1:0] cnt8, next_cnt8;

    always @(*) begin
        next_cnt2 = cnt2 + 1'b1;
        next_cnt4 = cnt4 + 1'b1;
        next_cnt8 = cnt8 + 1'b1;
        if (cnt3 === 2'b10) next_cnt3 = 2'b00;
        else next_cnt3 = cnt3 + 1;
    end

    always @(posedge clk) begin
        if (!rst_n) begin
            cnt2 <= 0;
            cnt3 <= 0;
            cnt4 <= 0;
            cnt8 <= 0;
        end else begin
            cnt2 <= next_cnt2;
            cnt3 <= next_cnt3;
            cnt4 <= next_cnt4;
            cnt8 <= next_cnt8;
        end
    end

    always @(posedge clk) begin
        if (!rst_n) begin
            clk1_2 <= 1'b1;
            clk1_4 <= 1'b1;
            clk1_8 <= 1'b1;
            clk1_3 <= 1'b1;
        end else begin
            if (cnt2 === 1) clk1_2 <= 1;
            else clk1_2 <= 0;
            if (cnt3 === 2'b10) clk1_3 <= 1;
            else clk1_3 <= 0;
            if (cnt4 === 2'b11) clk1_4 <= 1;
            else clk1_4 <= 0;
            if (cnt8 === 3'b111) clk1_8 <= 1;
            else clk1_8 <= 0;
        end
    end

    always @(*) begin
        case (sel)
            2'b00 : begin
                dclk = clk1_3;
            end
            2'b01 : begin
                dclk = clk1_2;
            end
            2'b10 : begin
                dclk = clk1_4;
            end
            2'b11 : begin
                dclk = clk1_8;
            end
            default : begin
                dclk = 0;
            end
        endcase
    end

endmodule

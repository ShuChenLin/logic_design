`timescale 1ns / 1ps
module top(clk, rst, ir_signal, run, gogo, see);

    input clk, rst, ir_signal;
    output see;
    output [3:0] gogo;
    output [1:0] run;
    
    reg [30:0] cnt, next_cnt;
    
    assign see = ir_signal;
    
    always @(*) begin
        // ir_signal == 0 means finsih ten char
        if (!ir_signal) begin
            next_cnt = 10000000;
        end else if (cnt == 0) next_cnt = 0;
        else next_cnt = cnt - 1;
    end
    
    assign run = (cnt > 0) ? 2'b11 : 2'b00;
    assign gogo = (cnt > 0) ? 4'b1010 : 4'b1111;
    
    always @(posedge clk) begin
        if (rst) begin
            cnt <= 0;
        end else begin
            cnt <= next_cnt;
        end
    end
    
endmodule

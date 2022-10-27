`timescale 1ns/1ps
module FIFO_8(clk, rst_n, wen, ren, din, dout, error);
input clk;
input rst_n;
input wen, ren;
input [8-1:0] din;
output [8-1:0] dout;
reg [7:0] dout;
output error;
reg error;
reg empty,full,nexte,re,we;
reg [7:0] cocoqueue [63:0];
reg [3:0] front,rear,nextf,nextr;
reg [4:0] cnt,nextc;

always @(posedge clk ) begin
    if(!rst_n) begin
        front<=3'd0;
        rear<=3'd0;
        dout<= 8'd0;
        error <= 1'b0;
        cnt <= 4'd0;
    end
    else begin
       dout <= re?cocoqueue[front]:8'dx;
       cocoqueue[rear] = we?din:cocoqueue[rear];
       front <= nextf;
       rear <= nextr;
       error <= nexte;
       cnt <= nextc;
    end
end
always @(*) begin
    empty = cnt==4'd0;
    full = cnt==4'd8;
    we = wen&!full&!ren;
    re = ren&!empty;
    case ({ren,wen})
        2'd0: begin
            nextr = rear;
            nextf = front;
            nextc = cnt;
            nexte = 1'b0;
        end
        2'd1: begin
            nextf = front;
            nexte = full;
            nextr = full?rear:rear+1'b1;
            nextc = full?cnt:cnt+1'b1;
        end 
        default: begin
            nextr = rear;
            nexte = empty;
            nextf = empty?front:front+1'b1;
            nextc = empty?cnt:cnt-1'b1;
        end
    endcase
end

endmodule

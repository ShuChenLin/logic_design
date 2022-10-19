`timescale 1ns/1ps

module FIFO_8(clk, rst_n, wen, ren, din, dout, error);

    input clk;
    input rst_n;
    input wen, ren;
    input [8-1:0] din;
    output [8-1:0] dout;
    output error;

    reg [8-1:0] FIFO [0:128-1];
    reg [8-1:0] dout = 0;
    reg error;
    reg [4-1:0] head, tail;

    reg [4-1:0] next_head, next_tail;

    reg [8-1:0] do_car;

    always @(*) begin
//        next_head = head + 1;
//        next_tail = tail + 1;
        if (head === 4'b1000) begin
            next_head <= 0;
        end else begin
            next_head <= head+1;
        end
        if (tail === 4'b1000) begin
            next_tail <= 0;
        end else begin
            next_tail <= tail+1;
        end
    end

    always @(posedge clk) begin
        //$display("head next_head %b %b", head, next_head);
        //$display("tail next_tail %b %b", tail, next_tail);
        //$display("FIFO %b", FIFO [tail-1]);
        if (!rst_n) begin
            head <= 0;
            tail <= 0;
            dout <= 0;
            error <= 0;
        end 
        else if (ren) begin
            if ((head === tail)) begin
                head <= head;
                error <= 1;
                tail <= tail;
                dout <= do_car;
            end else begin
                error <= 0;
                dout <= FIFO[head];
                head <= next_head;
                tail <= tail;
            end
        end 
        else if (wen) begin
            if (head === next_tail) begin
                head <= head;
                tail <= tail;
                error <= 1;
                dout <= do_car;
            end else begin
                error <= 0;
                dout <= do_car;
                FIFO[tail] <= din;
                head <= head;
                tail <= next_tail;
            end
        end 
        else begin
            dout <= do_car;
            error <= 0;
            head <= head;
            tail <= tail;
        end
    end

endmodule

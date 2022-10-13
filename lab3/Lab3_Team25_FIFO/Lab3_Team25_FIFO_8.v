`timescale 1ns/1ps

module FIFO_8(clk, rst_n, wen, ren, din, dout, error);

    input clk;
    input rst_n;
    input wen, ren;
    input [8-1:0] din;
    output [8-1:0] dout;
    output error;

    reg [8-1:0] FIFO [0:128-1];
    reg [8-1:0] dout;
    reg error;
    reg [3-1:0] head, tail;

    wire [3-1:0] next_head, next_tail;

    reg [8-1:0] do_car;

    assign next_head = head + 1;
    assign next_tail = tail + 1;

    always @(posedge clk) begin
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
            error <= error;
            head <= head;
            tail <= tail;
        end
    end

endmodule

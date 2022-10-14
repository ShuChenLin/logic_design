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
    reg [4-1:0] head, tail;

    reg [4-1:0] next_head, next_tail;

    reg [8-1:0] do_car;

    always @(*) begin
        next_head = head + 1;
        next_tail = tail + 1;
        if (head === 4'b1000) begin
            next_head = 0;
        end
        if (tail === 4'b1000) begin
            next_tail = 0;
        end
    end

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

module Round_Robin_FIFO_Arbiter(clk, rst_n, wen, a, b, c, d, dout, valid);

    input clk;
    input rst_n;
    input [4-1:0] wen;
    input [8-1:0] a, b, c, d;
    output [8-1:0] dout;
    output valid;

    wire era, erb, erc, erd;
    wire [2-1:0] next_counter;
    wire [8-1:0] Aout, Bout, Cout, Dout;

    reg ra = 0, rb = 0, rc = 0, rd = 0, valid;
    reg [3-1:0] counter;
    reg [8-1:0] dout;

    assign next_counter = counter + 1;

    always @(posedge clk) begin
        counter <= next_counter;
    end

    always @(*) begin
        ra = 0;
        rb = 0;
        rc = 0;
        rd = 0;
        if (counter == 2'b00) begin
            ra = 1;
        end
        else if (counter == 2'b01) begin
            rb = 1;
        end
        else if (counter == 2'b10) begin
            rc = 1;
        end
        else if (counter == 2'b11) begin
            rd = 1;
        end
    end

    always @(posedge clk) begin
        if (!rst_n) begin
            counter <= 0;
            valid <= 0;
            dout <= 0;
        end
        else begin
            case (counter)
                2'b01 : begin
                    if ((era || wen[0])) begin
                        valid <= 0;
                        dout <= 0;
                    end
                    else begin
                        valid <= 1;
                        dout <= Aout;
                    end
                end
                2'b10 : begin
                    if ((erb || wen[1])) begin
                        valid <= 0;
                        dout <= 0;
                    end
                    else begin
                        valid <= 1;
                        dout <= Bout;
                    end
                end
                2'b11 : begin
                    if ((erc || wen[2])) begin
                        valid <= 0;
                        dout <= 0;
                    end
                    else begin
                        valid <= 1;
                        dout <= Cout;
                    end
                end
                2'b00 : begin
                    if ((erd || wen[3])) begin
                        valid <= 0;
                        dout <= 0;
                    end
                    else begin
                        valid <= 1;
                        dout <= Dout;
                    end
                end
            endcase
        end
    end

    
    FIFO_8 fa(clk, rst_n, wen[0], ra, a, Aout, era);
    FIFO_8 fb(clk, rst_n, wen[1], rb, b, Bout, erb);
    FIFO_8 fc(clk, rst_n, wen[2], rc, c, Cout, erc);
    FIFO_8 fd(clk, rst_n, wen[3], rd, d, Dout, erd);

endmodule

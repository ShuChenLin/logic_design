`timescale 1ns/1ps

module or_4 (a, b, c, d, out);
    
    input a, b, c, d;
    output out;

    wire tmp1, tmp2;

    or o0(tmp1, a, b);
    or o1(tmp2, c, d);
    or o2(out, tmp1, tmp2);

endmodule

module or_8bit (a, b, c, d, out);
    
    input [8-1:0] a, b, c, d;
    output [8-1:0] out;

    or_4 a0(a[0], b[0], c[0], d[0], out[0]);
    or_4 a1(a[1], b[1], c[1], d[1], out[1]);
    or_4 a2(a[2], b[2], c[2], d[2], out[2]);
    or_4 a3(a[3], b[3], c[3], d[3], out[3]);
    or_4 a4(a[4], b[4], c[4], d[4], out[4]);
    or_4 a5(a[5], b[5], c[5], d[5], out[5]);
    or_4 a6(a[6], b[6], c[6], d[6], out[6]);
    or_4 a7(a[7], b[7], c[7], d[7], out[7]);

endmodule

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
                dout <= 8'bx;
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
                dout <= 8'bx;
            end else begin
                error <= 0;
                dout <= 8'bx;
                FIFO[tail] <= din;
                head <= head;
                tail <= next_tail;
            end
        end 
        else begin
            error <= 0;
            dout <= 8'bx;
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

    reg ra = 0, rb = 0, rc = 0, rd = 0;
    reg valid = 0, tmp_valid = 0;
    reg [3-1:0] counter = 0;
    reg [8-1:0] dout = 0;

    assign next_counter = counter + 1;

    always @(wen, counter) begin
        ra = 0; rb = 0; rc = 0; rd = 0;
        if (!wen[0] && (counter == 2'b00)) ra = 1;
        else if (!wen[1] && (counter == 2'b01)) rb = 1;
        else if (!wen[2] && (counter == 2'b10)) rc = 1;
        else if (!wen[3] && (counter == 2'b11)) rd = 1;
        else begin
            ra = 0; rb = 0; rc = 0; rd = 0;
        end
    end

    always @(*) begin
        if (rst_n && counter === 2'b01) begin
            valid = (!era && tmp_valid);
        end
        else if (rst_n && counter === 2'b10) begin
            valid = (!erb && tmp_valid);
        end
        else if (rst_n && counter === 2'b11) begin
            valid = (!erc && tmp_valid);
        end
        else if (rst_n && counter === 2'b00) begin
            valid = (!erd && tmp_valid);
        end
        else if (!rst_n) begin
            valid = 0;
        end else begin
            valid = valid;
        end
    end

    always @(*) begin
        if (counter === 2'b01 && valid) begin
            dout = Aout;
        end
        else if (counter === 2'b10 && valid) begin
            dout = Bout;
        end
        else if (counter === 2'b11 && valid) begin
            dout = Cout;
        end
        else if (counter === 2'b00 && valid) begin
            dout = Dout;
        end
        else if (!valid) begin
            dout = 0;
        end else begin
            dout = dout;
        end
    end

    always @(posedge clk) begin
        if (!rst_n) begin
            counter <= 0;
        end
        else begin
            counter <= next_counter;
            if (counter == 2'b00 && !wen[0]) tmp_valid <= 1;
            else if (counter == 2'b01 && !wen[1]) tmp_valid <= 1;
            else if (counter == 2'b10 && !wen[2]) tmp_valid <= 1;
            else if (counter == 2'b11 && !wen[3]) tmp_valid <= 1;
            else tmp_valid <= 0;
        end
    end

    FIFO_8 fa(clk, rst_n, wen[0], ra, a, Aout, era);
    FIFO_8 fb(clk, rst_n, wen[1], rb, b, Bout, erb);
    FIFO_8 fc(clk, rst_n, wen[2], rc, c, Cout, erc);
    FIFO_8 fd(clk, rst_n, wen[3], rd, d, Dout, erd);
    //or_8bit oo(Aout, Bout, Cout, Dout, dout);

endmodule

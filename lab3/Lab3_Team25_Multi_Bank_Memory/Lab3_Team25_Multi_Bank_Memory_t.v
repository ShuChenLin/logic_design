`timescale 1ns/1ps


module Multi_Bank_Memory_t;
    
    reg clk = 0;
    reg ren = 1'b0;
    reg wen = 1'b0;
    reg [11-1:0] waddr = 11'b0;
    reg [11-1:0] raddr = 11'b0;
    reg [8-1:0] din = 8'b0;
    wire [8-1:0] dout;

    parameter cyc = 10;
    always#(cyc/2)clk = !clk;

    Multi_Bank_Memory hello(
        .clk (clk),
        .ren (ren),
        .wen (wen),
        .waddr (waddr),
        .raddr (raddr),
        .din (din),
        .dout (dout)
    );

    initial begin
        $dumpfile("multi_memory.vcd");
        $dumpvars("+all");
    end

    initial begin
        @(negedge clk)
        ren = 0;
        wen = 1;
        waddr = 11'b00001010100;
        raddr = 11'b00001010101;
        din = 8'b00000001;
        @(negedge clk)
        ren = 1;
        wen = 1;
        waddr = 11'b00011010100;
        raddr = 11'b00001010100;
        din = 8'b00000011;
        @(negedge clk)
        ren = 1;
        wen = 1;
        waddr = 11'b00101010100;
        raddr = 11'b00011010100;
        din = 8'b00000111;
        @(negedge clk)
        ren = 1;
        wen = 1;
        waddr = 11'b00111010100;
        raddr = 11'b00101010100;
        din = 8'b00001111;
        @(negedge clk)
        ren = 1;
        wen = 1;
        waddr = 11'b01001010100;
        raddr = 11'b00111010100;
        din = 8'b00011111;
        @(negedge clk)
        ren = 1;
        wen = 1;
        waddr = 11'b01011010100;
        raddr = 11'b01001010100;
        din = 8'b00111111;
        @(negedge clk)
        ren = 1;
        wen = 1;
        waddr = 11'b01101010100;
        raddr = 11'b01011010100;
        din = 8'b01111111;
        @(negedge clk)
        ren = 1;
        wen = 1;
        waddr = 11'b01111010100;
        raddr = 11'b01101010100;
        din = 8'b11111111;
        @(negedge clk)
        ren = 1;
        wen = 1;
        waddr = 11'b10001010100;
        raddr = 11'b01111010100;
        din = 8'b10000000;
        @(negedge clk)
        ren = 1;
        wen = 1;
        waddr = 11'b10011010100;
        raddr = 11'b10001010100;
        din = 8'b11000000;
        @(negedge clk)
        ren = 1;
        wen = 1;
        waddr = 11'b10101010100;
        raddr = 11'b10011010100;
        din = 8'b11100000;
        @(negedge clk)
        ren = 1;
        wen = 1;
        waddr = 11'b10111010100;
        raddr = 11'b10101010100;
        din = 8'b11110000;
        @(negedge clk)
        ren = 1;
        wen = 1;
        waddr = 11'b11001010100;
        raddr = 11'b10111010100;
        din = 8'b11111000;
        @(negedge clk)
        ren = 1;
        wen = 1;
        waddr = 11'b11011010100;
        raddr = 11'b11001010100;
        din = 8'b11111100;
        @(negedge clk)
        ren = 1;
        wen = 1;
        waddr = 11'b11101010100;
        raddr = 11'b11011010100;
        din = 8'b11111110;
        @(negedge clk)
        ren = 1;
        wen = 1;
        waddr = 11'b11111010100;
        raddr = 11'b11101010100;
        din = 8'b11111111;
        @(negedge clk)
        ren = 1;
        wen = 0;
        waddr = 11'b00000000000;
        raddr = 11'b11111010100;
        din = 8'b00000000;
        @(negedge clk)
        ren = 1;
        wen = 1;
        waddr = 11'b00001010100;
        raddr = 11'b00001010100;
        din = 8'b00000000;
        @(negedge clk)
        ren = 1;
        wen = 0;
        waddr = 11'b0;
        raddr = 11'b00001010100;
        din = 8'b0;
        @(negedge clk)
        ren = 0;
        wen = 0;
        waddr = 11'b00001010100;
        raddr = 11'b00001010100;
        din = 8'b0;
        @(negedge clk)
        ren = 1;
        wen = 0;
        waddr = 11'b0;
        raddr = 11'b0;
        din = 8'b0;
        @(negedge clk)
        $finish;
    end

endmodule

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
        raddr = 11'b00101010100;
        din = 8'b00101010;
        @(negedge clk)
        ren = 1;
        wen = 1;
        waddr = 11'b01101010100;
        raddr = 11'b00001010100;
        din = 8'b00000011;
        @(negedge clk)
        ren = 0;
        wen = 1;
        waddr = 11'b10101010100;
        raddr = 11'b00000000000;
        din = 8'b00010001;
        @(negedge clk)
        ren = 1;
        wen = 1;
        waddr = 11'b00000000000;
        raddr = 11'b01101010100;
        din = 8'b00000000;
        @(negedge clk)
        ren = 0;
        wen = 1;
        waddr = 11'b00001010100;
        raddr = 11'b00101010100;
        din = 8'b00101010;
        @(negedge clk)
        ren = 1;
        wen = 1;
        waddr = 11'b01101010100;
        raddr = 11'b00001010100;
        din = 8'b00000011;
        @(negedge clk)
        ren = 0;
        wen = 1;
        waddr = 11'b10101010100;
        raddr = 11'b00000000000;
        din = 8'b00010001;
        @(negedge clk)
        ren = 1;
        wen = 1;
        waddr = 11'b00000000000;
        raddr = 11'b10101010100;
        din = 8'b00000000;
        @(negedge clk)
        ren = 1;
        wen = 1;
        waddr = 11'b11111010100;
        raddr = 11'b00000000000;
        din = 8'b00111111;
        @(negedge clk)
        ren = 1;
        wen = 0;
        waddr = 11'b00000000000;
        raddr = 11'b11111010100;
        din = 8'b00000000;
        @(negedge clk);
        $finish;
    end

endmodule

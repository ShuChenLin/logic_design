`timescale 1ns/1ps

module cam_t;
    
    reg clk = 0;
    reg wen = 0, ren = 0;
    reg [8-1:0] din;
    reg [4-1:0] addr;
    wire [4-1:0] dout;
    wire hit;

    parameter cyc = 10;
    always#(cyc/2)clk = ~clk;

    Content_Addressable_Memory mq(
        .clk(clk),
        .wen(wen),
        .ren(ren),
        .din(din),
        .addr(addr),
        .dout(dout),
        .hit(hit)
    );

    initial begin
        $dumpfile("cam.vcd");
        $dumpvars("+all");
    end

    initial begin
        @(negedge clk)
        wen = 0;
        ren = 0;
        din = 0;
        addr = 0;
        @(negedge clk)
        ren = 0;
        wen = 1;
        din = 4;
        addr = 0;
        @(negedge clk)
        ren = 0;
        wen = 1;
        din = 8;
        addr = 7;
        @(negedge clk)
        ren = 0;
        wen = 1;
        din = 35;
        addr = 15;
        @(negedge clk)
        ren = 0;
        wen = 1;
        din = 8;
        addr = 9;
        @(negedge clk)
        ren = 0;
        wen = 0;
        din = 0;
        addr = 0;
        @(negedge clk)
        ren = 0;
        wen = 0;
        din = 0;
        addr = 0;
        @(negedge clk)
        ren = 1;
        wen = 0;
        din = 4;
        addr = 0;
        @(negedge clk)
        ren = 1;
        wen = 1;
        din = 8;
        addr = 0;
        @(negedge clk)
        ren = 1;
        wen = 1;
        din = 35;
        addr = 0;
        @(negedge clk)
        ren = 1;
        wen = 1;
        din = 87;
        addr = 0;
        @(negedge clk)
        ren = 1;
        wen = 1;
        din = 45;
        addr = 0;
        @(negedge clk)
        ren = 0;
        wen = 0;
        @(negedge clk);
        @(negedge clk);
        @(negedge clk) $finish;
    end
endmodule

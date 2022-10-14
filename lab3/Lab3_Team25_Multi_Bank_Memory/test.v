`timescale 1ns/1ps

module Multi_Bank_Memory_t;
reg clk = 0;
reg ren = 1'b0;
reg wen = 1'b0;
reg [10:0] waddr = 0, raddr = 0;
reg [7:0] din = 8'd0;
wire [7:0] dout;

// specify duration of a clock cycle.
parameter cyc = 10;

// generate clock.
always#(cyc/2)clk = !clk;

Multi_Bank_Memory mem(
    .clk(clk),
    .ren(ren),
    .wen(wen),
    .din(din),
    .waddr(waddr),
    .raddr(raddr),
    .dout(dout)
);

// uncommment and add "+access+r" to your nverilog command to dump fsdb waveform on NTHUCAD
 initial begin
     $dumpfile("Memory.vcd");
     $dumpvars("+all");
 end

    initial begin
        @(negedge clk)
            waddr = 1;
            raddr = 0;
            wen = 1;
            ren = 0;
            din = 1;
        @(negedge clk)
            waddr = 200;
            raddr = 1;
            wen = 1;
            ren = 1;
            din = 200;
        @(negedge clk)
            waddr = 1;
            raddr = 200;
            wen = 0;
            ren = 1;
            din = 200;
        @(negedge clk)
            waddr = 1;
            raddr = 201;
            wen = 0;
            ren = 1;
            din = 201;
        @(negedge clk)
            waddr = 201;
            raddr = 200;
            wen = 1;
            ren = 1;
            din = 20;
        @(negedge clk)
            waddr = 201;
            raddr = 201;
            wen = 0;
            ren = 1;
            din = 20;
        $finish;
    end
endmodule

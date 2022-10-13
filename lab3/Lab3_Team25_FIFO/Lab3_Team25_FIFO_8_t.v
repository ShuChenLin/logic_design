`timescale 1ns/1ps

module FIFO_8_t;
    
    reg clk = 0;
    reg rst_n = 0;
    reg ren = 1'b0;
    reg wen = 1'b0;
    reg [7:0] din = 8'd0;
    wire [7:0] dout;
    wire error;

    parameter cyc = 10;

    // generate clock.
    always#(cyc/2)clk = !clk;

    FIFO_8 fifo(
        .clk (clk),
        .ren (ren),
        .wen (wen),
        .din (din),
        .dout (dout),
        .error (error)
    );
        
    initial begin
        @(negedge clk)
            
        end
        @(negedge clk)
        end
        @(negedge clk)
        end
        @(negedge clk)
        end
    end

endmodule

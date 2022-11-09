`timescale 1ns/1ps

module mealy_t;
    
    reg clk = 0, rst_n = 0;
    reg in = 0;
    wire dec;

    parameter cyc=10;

    always#(cyc/2)clk = ~clk;

    Mealy_Sequence_Detector m1(
        .clk(clk),
        .rst_n(rst_n),
        .in(in),
        .dec(dec)
    );

    initial begin
        $dumpfile("msd.vcd");
        $dumpvars("+all");
    end

    initial begin
        @(negedge clk);
            rst_n = 0;
            in = 0;

        @(negedge clk) 
            rst_n = 1;
            in = 0;
        @(negedge clk) in = 1;
        @(negedge clk) in = 1;
        @(negedge clk) in = 1;

        @(negedge clk) in = 0;        
        @(negedge clk) in = 0;
        @(negedge clk) in = 0;
        @(negedge clk) in = 1;

        @(negedge clk) in = 0;        
        @(negedge clk) in = 0;
        @(negedge clk) in = 1;
        @(negedge clk) in = 0;

        @(negedge clk) in = 0;        
        @(negedge clk) in = 0;
        @(negedge clk) in = 1;
        @(negedge clk) in = 1;

        @(negedge clk) in = 0;        
        @(negedge clk) in = 1;
        @(negedge clk) in = 0;
        @(negedge clk) in = 0;

        @(negedge clk) in = 0;        
        @(negedge clk) in = 1;
        @(negedge clk) in = 0;
        @(negedge clk) in = 1;

        @(negedge clk) in = 0;        
        @(negedge clk) in = 1;
        @(negedge clk) in = 1;
        @(negedge clk) in = 0;

        @(negedge clk) in = 0;        
        @(negedge clk) in = 1;
        @(negedge clk) in = 1;
        @(negedge clk) in = 1;

        @(negedge clk) in = 1;        
        @(negedge clk) in = 0;
        @(negedge clk) in = 0;
        @(negedge clk) in = 0;

        @(negedge clk) in = 1;        
        @(negedge clk) in = 0;
        @(negedge clk) in = 0;
        @(negedge clk) in = 1;

        @(negedge clk) in = 1;        
        @(negedge clk) in = 0;
        @(negedge clk) in = 1;
        @(negedge clk) in = 0;

        @(negedge clk) in = 1;        
        @(negedge clk) in = 0;
        @(negedge clk) in = 1;
        @(negedge clk) in = 1;

        @(negedge clk) in = 1;        
        @(negedge clk) in = 1;
        @(negedge clk) in = 0;
        @(negedge clk) in = 0;

        @(negedge clk) in = 1;        
        @(negedge clk) in = 1;
        @(negedge clk) in = 0;
        @(negedge clk) in = 1;
            
        @(negedge clk) in = 1;        
        @(negedge clk) in = 1;
        @(negedge clk) in = 1;
        @(negedge clk) in = 0;

        @(negedge clk) in = 1;        
        @(negedge clk) in = 1;
        @(negedge clk) in = 1;
        @(negedge clk) in = 1;

        @(negedge clk) in = 1;        
        @(negedge clk) in = 0;
        @(negedge clk) in = 1;
        @(negedge clk) in = 1;

        @(negedge clk) in = 1;        
        @(negedge clk) 
            in = 1;
            rst_n = 0;
        @(negedge clk) in = 0;
        @(negedge clk) in = 0;

        @(negedge clk) 
            in = 1;
            rst_n = 1; 
        @(negedge clk) in = 1;
        @(negedge clk) in = 0;
        @(negedge clk) in = 1;
            
        @(negedge clk) in = 1;        
        @(negedge clk) in = 1;
        @(negedge clk) in = 1;
        @(negedge clk) in = 0;

        @(negedge clk) in = 1;        
        @(negedge clk) in = 1;
        @(negedge clk) in = 1;
        @(negedge clk) in = 1;
        @(negedge clk) $finish;
    end
endmodule

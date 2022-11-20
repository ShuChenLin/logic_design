`timescale 1ns/1ps

module q2_t;
    
    reg clk = 0;
    reg rst_n = 0;
    reg lr_has_car = 0;
    wire [2:0] hw_light, lr_light;

    parameter cyc = 10;

    always # (cyc/2) clk = ~clk;

    Traffic_Light_Controller T1(
        .clk(clk),
        .rst_n(rst_n),
        .lr_has_car(lr_has_car),
        .hw_light(hw_light),
        .lr_light(lr_light)
    );

    initial begin
        $dumpfile("Traffic.vcd");
        $dumpvars("+all");
    end

    initial begin
        @(negedge clk)
        rst_n = 0;
        @(negedge clk)
        rst_n = 1;
        @(negedge clk);
        lr_has_car = 1;
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        @(negedge clk); 
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        $finish;
    end

endmodule

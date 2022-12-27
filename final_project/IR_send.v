`timescale 1ns/1ps

module IR_send(clk, rst_n, key_1, key_2, IR_out, led1, led2, led3, led4);
    
    input clk, rst_n;
    input key_1, key_2;
    output IR_out;
    output reg led_1;
    output reg led_2;
    output led_3;
    output led_4;

    `define CLK_20M
    //`define CLK_24M
    //`define CLK_50M

    `ifdef CLK_20M
        parameter t_38k = 10'd526;
        parameter t_38k_half = 10'd263;
        parameter t_9ms = 18'd179999;
        parameter t_4_5ms = 17'd89999;
        parameter t_13_5ms = 19'd269999;
        parameter t_560us = 14'd11199;
        parameter t_1_12ms = 15'd22399;
        parameter t_1_68ms = 16'd33599;
        parameter t_2_24ms = 16'd44799;
    `endif

    parameter DATA_USER = 8'h00;

    //=================================================

    reg [10:0] cnt1;
    wire clk_38k;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) cnt1 <= 0;
        else if (cnt1 == t_38k) cnt1 <= 0;
        else cnt1 <= cnt1 + 1;
    end

    assign clk_38k = (cnt1 < t_38k_half) ? 1 : 0;

    //=========================================

    reg [2:0] key_1_flag;
    wire key_1_neg;
    wire key_1_pos;
    always @(posedge clk or negedge rst_n) beign
        if (!rst_n) key_1_flag <= 3'b00;
        else key_1_flag <= {key_1_flga[1:0], key_1};
    end

    assign key_1_pos = (key_1_flag[2:1] == 2'b01);

    //==========================================

    reg [2:0] key_2_flag;
    wire key_2_neg;
    wire key_2_pos;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) key_2_flag <= 3'b000;
        else key_2_flag <= {key_2_flag[1:0], key_2}
    end

    assign key_2_pos = (key_2_flag[2:1] == 2'b01);
endmodule

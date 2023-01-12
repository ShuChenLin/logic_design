`timescale 1ns / 1ps
// cpm1, cpm2, cpm3 returns the digit of characters per minute.

module char_per_min(clk, rst, word_cnt, cpm1, cpm2, cpm3, state);

    input clk, rst;
    input [10:0] word_cnt;
    input [2:0] state;
    output [3:0] cpm1, cpm2, cpm3;
    
    reg [31:0] counter, next_counter; // counter is used to compute the time passed.
    reg [31:0] dsec, next_dsec; // dsec is the time passed when the game starts, the unit is 0.1 second.
    
    wire [9:0] cpm;
    
    assign cpm = (state == 3'b100) ? (298 * 600 / (1+dsec)) : (word_cnt*600 / (1 + dsec)); // compute cpm in binary representation
    
    assign cpm1 = (cpm)%10; // get the first digit of cpm
    assign cpm2 = (cpm/10)%10; // get the second digit of cpm
    assign cpm3 = (cpm/100)%10; // get the third digit of cpm
    
    always @(*) begin
        if (state == 3'b010 || state == 3'b011) begin
            if (counter >= 10000000) begin
                next_counter = 0;
                next_dsec = dsec + 1;
            end else begin 
                next_counter = counter + 1;
                next_dsec = dsec;
            end
        end else if (state == 3'b100) begin
            next_counter = 0;
            next_dsec = dsec;
        end else begin
            next_counter = 0;
            next_dsec = 0;
        end
    end
        
    always @(posedge clk) begin
        if (rst) begin
            counter <= 0;
            dsec <= 0;
        end else begin
            counter <= next_counter;
            dsec <= next_dsec;
        end
    end

endmodule

`timescale 1ns/1ps

module Ping_Pong_Counter (clk, rst_n, enable, direction, out);

    input clk, rst_n;
    input enable;
    output direction;
    output [4-1:0] out;

    wire [4-1:0] next_counter, pre_counter;

    reg [4-1:0] counter;
    reg direction;

    assign next_counter = counter + 1;
    assign pre_counter = counter - 1;
    assign out = counter;

    always @(posedge clk) begin
        if (!rst_n) begin
            counter <= 0;
            direction <= 1;
        end
        else begin
            if (enable) begin
                if (direction) begin
                    if (counter === 4'b1111) begin
                        direction <= 0;
                        counter <= pre_counter;
                    end
                    else begin
                        counter <= next_counter;
                    end
                end
                else begin
                    if (counter === 4'b0000) begin
                        direction <= 1;
                        counter <= next_counter;
                    end
                    else begin
                        counter <= pre_counter;
                    end
                end
            end
            else begin
                counter <= counter;
                direction <= direction;
            end
        end
    end

endmodule

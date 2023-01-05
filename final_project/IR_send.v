`timescale 1ns/1ps

module IR_send(clk, rst, out);
    
    input clk, rst;
    output out;

    wire [12:0] tk38;
    wire [12:0] tk38_half;
    wire [12:0] cnt_next;
    reg [12:0] cnt;

    assign tk38 = 2631;
    assign tk38_half = 1315;
    assign cnt_next = cnt + 1;

    always @(posedge clk) begin
        if (rst) cnt <= 0;
        else begin
            if (cnt >= tk38) next_cnt = 0;
            else next_cnt = cnt + 1;
        end
    end

    assign out = (cnt <= tk38_half) ? 1 : 0;

endmodule

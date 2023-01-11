`timescale 1ns/1ps

module IR_send(clk, rst, ready, out);
    
    input clk, rst, ready;
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
            if (cnt >= tk38) cnt <= 0;
            else cnt <= cnt_next;
        end
    end

    assign out = ready ? ((cnt <= tk38_half) ? 1 : 0) : 0;

endmodule

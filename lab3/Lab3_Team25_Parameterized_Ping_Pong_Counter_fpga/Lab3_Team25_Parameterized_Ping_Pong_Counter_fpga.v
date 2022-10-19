`timescale 1ns/1ps

module debounced(clk, pb, pb_debounced);

    input clk, pb;
    output pb_debounced;

    reg [3:0] DFF;

    always @(posedge clk) begin
        DFF[3:1] <= DFF[2:0];
        DFF[0] <= pb;
    end

    assign pb_debounced = ((DFF == 4'b1111) ? 1'b1 : 1'b0);

endmodule

module one_pause(clk, pb_debounced, pb_one_pulse):

    input clk, pb_debounced;
    output pb_one_pulse;

    reg pb_one_pulse, pb_debounced_delay;

    always @(posedge clk) begin
        pb_one_pulse <= pb_debounced & (!pb_debounced_delay);

        pb_debounced_delay <= pb_debounced;
    end

endmodule

`timescale 1ns/1ps
module tracker_sensor(clk, reset, left_signal, right_signal, mid_signal, state);
    input clk;
    input reset;
    input left_signal, right_signal, mid_signal;
    output reg [1:0] state;

    // [TO-DO] Receive three signals and make your own policy.
    // Hint: You can use output state to change your action.
    
    wire [2:0] cur_sit;
    reg [1:0] next_state;
    parameter forward = 2'b00;
    parameter turn_right = 2'b01;
    parameter turn_left = 2'b10;
    parameter backward = 2'b11;
    
    assign cur_sit = {left_signal, mid_signal, right_signal};
    
    always @(posedge clk) begin
        if (reset) begin
            state <= 0;
        end else begin
            state <= next_state;
        end
    end
    
    always @(*) begin
        case (cur_sit) 
            3'b111 : next_state = forward;
            3'b001 : next_state = turn_right;
            3'b011 : next_state = turn_right;
            3'b100 : next_state = turn_left;
            3'b110 : next_state = turn_left;
            3'b000 : next_state = backward;
            default : next_state = forward;
        endcase
    end

endmodule

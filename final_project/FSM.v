`timescale 1ns/1ps

module FSM(clk, rst, key_down, last_change, been_ready, correct_n, wrong_cnt, state, stcnt, word_cnt);
    
    input clk, rst;
    input [511:0] key_down;
    input [8:0] last_change;
    input [5:0] wrong_cnt;
    input been_ready, correct_n;
    input [10:0] word_cnt;
    output [2:0] state;
    output [28:0] stcnt;

    reg [2:0] state, next_state;

    parameter [8:0] KEY_CODE_ENTER = 90;

    parameter WAIT = 3'b000;
    parameter WAIT_TO_START = 3'b001;
    parameter WORD = 3'b010;
    parameter WRONG = 3'b011;
    parameter FINISH = 3'b100;

    reg [31:0] stcnt; // wait three secs to start;
    wire next_stcnt;

    always @(*) begin
        case (state)
            WAIT : begin
                if (been_ready && key_down[last_change] && last_change == KEY_CODE_ENTER) begin
                    next_state = WAIT_TO_START;
                end else next_state = state;
            end
            WAIT_TO_START : begin
                if (stcnt >= 300000000) next_state = WORD;
                else next_state = WORD;
            end
            WORD : begin
                if (word_cnt == 298) next_state = FINISH;
                else if (!correct_n) next_state = WORD;
                else if (correct_n) next_state = WRONG;
            end
            WRONG : begin
                if (wrong_cnt == 0) next_state = WORD;
                else next_state = WRONG;
            end
            FINISH : begin
                if (key_down[last_change] && last_change == KEY_CODE_ENTER) begin
                    next_state = WAIT;
                end else next_state = FINISH;
            end
            default : begin
                next_state = WAIT;
            end
        endcase
    end

    always @(posedge clk) begin
        if (rst) begin
            state <= WAIT;
        end else begin
            state <= next_state;
        end
    end


    assign next_stcnt = (state == WAIT_TO_START) ? ((stcnt >= 300000000) ? stcnt : stcnt + 1) : 0;

    always @(posedge clk) begin
        if (rst) begin
            stcnt <= 0;
        end else begin
            stcnt <= next_stcnt;
        end
    end

endmodule

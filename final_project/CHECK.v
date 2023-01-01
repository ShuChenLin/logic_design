`timescale 1ns/1ps

module CHECK(clk, rst, state, correct_n, word_cnt, wrong_words, word, key_down, last_change, been_ready);
    
    input clk, rst;
    input [511:0] key_down;
    input [8:0] last_change;
    input been_ready;
    input [2:0] state;
    input [5:0] word;
    output [10:0] word_cnt;
    output correct_n;
    output [5:0] wrong_words;

    parameter WORD = 3'b010;
    parameter WRONG = 3'b011;

    parameter KEY_A = 28; //1C
    parameter KEY_B = 50; //32
    parameter KEY_C = 33; //21
    parameter KEY_D = 35; //23
    parameter KEY_E = 36; //24
    parameter KEY_F = 43; //2B
    parameter KEY_G = 52; //34
    parameter KEY_H = 51; //33
    parameter KEY_I = 67; //43
    parameter KEY_J = 59; //3B
    parameter KEY_K = 66; //42
    parameter KEY_L = 75; //4B
    parameter KEY_M = 58; //3A
    parameter KEY_N = 49; //31
    parameter KEY_O = 68; //44
    parameter KEY_P = 77; //4D
    parameter KEY_Q = 21; //15
    parameter KEY_R = 45; //2D
    parameter KEY_S = 27; //1B
    parameter KEY_T = 44; //2C
    parameter KEY_U = 60; //3C
    parameter KEY_V = 42; //2A
    parameter KEY_W = 29; //1D
    parameter KEY_X = 34; //22
    parameter KEY_Y = 53; //35
    parameter KEY_Z = 26; //1A
    parameter KEY_SPACE = 41; //29
    parameter KEY_COM = 65; //41
    parameter KEY_DOT = 73; //49
    parameter KEY_APO = 82; //52
    parameter KEY_BACK = 102; //66
    parameter KEY_LEFT_SHIFT = 18; //12
    parameter KEY_RIGHT_SHIFT = 99; //59

    reg [8:0] cur_word;
    reg correct_n, next_cor;
    reg [30:0] cnt_wrong, next_wrong;
    reg [10:0] word_cnt, next_word_cnt;

    assign wrong_words = cnt_wrong;

    /*
    space 26
    , 27
    . 28
    ' 29
    a - z 0 - 25
    A - Z 30 - 55
    */

    //WORD PLACE============================
    always @(*) begin
        case (state)
            WORD : begin
                if (been_ready && key_down[last_change]) begin
                    if (last_change != cur_word) next_word_cnt = word_cnt;
                    else begin
                        if (word >= 30 && !key_down[KEY_LEFT_SHIFT] && !key_down[KEY_RIGHT_SHIFT]) next_word_cnt = word_cnt;
                        else next_word_cnt = word_cnt + 1;
                    end
                end
            end
            WRONG : begin
                next_word_cnt = word_cnt;
            end
            default : next_word_cnt = 0;
        endcase
    end

    always @(posedge clk) begin
        if (rst) begin
            word_cnt <= 0;
        end else begin
            word_cnt <= next_word_cnt;
        end
    end
    //======================================

    //CORRECT===============================
    always @(*) begin
        case (state)
            WORD : begin
                if (cnt_wrong) next_cor = 1;
                else next_cor = 0;
            end
            WRONG : begin
                if (cnt_wrong == 0) next_cor = 0;
                else next_cor = 1;
            end
            default : begin
                next_cot = 0;
            end
        endcase
    end

    always @(posedge clk) begin
        if (rst) begin
            correct_n <= 0;
        end else begin
            correct_n <= next_cor;
        end
    end
    //==========================================

    //WRONG COUNT===============================
    always @(*) begin
        case (state)
            WORD : begin
                if (last_change == KEY_LEFT_SHIFT || last_change ==KEY_RIGHT_SHIFT || last_change == KEY_BACK) begin
                    next_wrong = cnt_wrong;
                end
                else if (been_ready && key_down[last_change] && last_change != cur_word) next_wrong = cnt_wrong + 1;
                else begin
                    if (word >= 30 && !key_down[KEY_LEFT_SHIFT] && !key_down[KEY_RIGHT_SHIFT]) next_wrong = cnt_wrong + 1;
                    else next_wrong = cnt_wrong + 1;
                end
            end
            WRONG : begin
                if (last_change == KEY_LEFT_SHIFT || last_change == KEY_RIGHT_SHIFT) begin
                    next_wrong = cnt_wrong;
                else if (been_ready && key_down[last_change]) begin
                    if (last_change == KEY_BACK) next_wrong = cnt_wrong - 1;
                    else if (last_change != cur_word) next_wrong = cnt_wrong + 1;
                    else begin
                        if (word >= 30 && !key_down[KEY_LEFT_SHIFT] && !key_down[KEY_RIGHT_SHIFT]) next_wrong = cnt_wrong + 1;
                        else next_wrong = cnt_wrong + 1;  
                    end
                end
                else next_wrong = cnt_wrong;
            end
            default : begin
                next_wrong = 0;
            end
        endcase
    end

    always @(posedge clk) begin
        if (rst) begin
            cnt_wrong <= 0;
        end else begin
            cnt_wrong <= next_wrong;
        end
    end
    //=============================================

    always @(*) begin
        case (word)
            0 : cur_word = KEY_A;
            1 : cur_word = KEY_B;
            2 : cur_word = KEY_C;
            3 : cur_word = KEY_D:
            4 : cur_word = KEY_E:
            5 : cur_word = KEY_F:
            6 : cur_word = KEY_G:
            7 : cur_word = KEY_H:
            8 : cur_word = KEY_I:
            9 : cur_word = KEY_J:
            10 : cur_word = KEY_K:
            11 : cur_word = KEY_L:
            12 : cur_word = KEY_M:
            13 : cur_word = KEY_N:
            14 : cur_word = KEY_O:
            15 : cur_word = KEY_P:
            16 : cur_word = KEY_Q:
            17 : cur_word = KEY_R;
            18 : cur_word = KEY_S;
            19 : cur_word = KEY_T;
            20 : cur_word = KEY_U;
            21 : cur_word = KEY_V;
            22 : cur_word = KEY_W;
            23 : cur_word = KEY_X;
            24 : cur_word = KEY_Y;
            25 : cur_word = KEY_Z;
            26 : cur_word = KEY_SPACE;
            27 : cur_word = KEY_COM;
            28 : cur_word = KEY_DOT;
            29 : cur_word = KEY_APO; //'
            30 : cur_word = KEY_A;
            31 : cur_word = KEY_B;
            32 : cur_word = KEY_C;
            33 : cur_word = KEY_D;
            34 : cur_word = KEY_E;
            35 : cur_word = KEY_F;
            36 : cur_word = KEY_G;
            37 : cur_word = KEY_H;
            38 : cur_word = KEY_I;
            39 : cur_word = KEY_J;
            40 : cur_word = KEY_K;
            41 : cur_word = KEY_L;
            42 : cur_word = KEY_M;
            43 : cur_word = KEY_N;
            44 : cur_word = KEY_O;
            45 : cur_word = KEY_P;
            46 : cur_word = KEY_Q;
            47 : cur_word = KEY_R;
            48 : cur_word = KEY_S;
            49 : cur_word = KEY_T;
            50 : cur_word = KEY_U;
            51 : cur_word = KEY_V;
            52 : cur_word = KEY_W;
            53 : cur_word = KEY_X;
            54 : cur_word = KEY_Y;
            55 : cur_word = KEY_Z;
            default : cur_word = KEY_A;
        endcase
    end
    
endmodule

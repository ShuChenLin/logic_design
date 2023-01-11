`timescale 1ns/1ps

module top(clk, rst, ir_send, vgaRed, vgaBlue, vgaGreen, PS2_DATA, PS2_CLK, an, seg, state, hsync, vsync, cc, www, f, goo);
    
    input clk, rst;
    inout PS2_DATA, PS2_CLK;
    output ir_send;
    output cc;
    output [5:0] www;
    output [2:0] f;
    output goo;
    output [3:0] vgaRed, vgaBlue, vgaGreen;
    output [3:0] an;
    output [6:0] seg;
    output [2:0] state;
    output hsync, vsync;

    wire clk_d2; //25MHz
    wire clk_d22;
    wire rst_debounce, rst_op;
    wire [5:0] adr [300:0];
    wire [16:0] pixel_addr; //picture address;
    wire [11:0] pixel;
    wire [11:0] data;
    wire valid;
    //640*480
    wire [9:0] h_cnt, v_cnt;
    wire run;

    wire [511:0] key_down;
    wire [8:0] last_change;
    wire been_ready;

    wire [2:0] statee;
    wire [6:0] wpm;
    wire [28:0] stcnt; //count down three seconds.
    wire correct_n;
    wire [5:0] wrong_cnt;
    wire [10:0] word_cnt;
    wire [8:0] output_word; //used for vga
    wire [3:0] Red, Green, Blue;
    wire finish_ten_char;

    assign goo = wrong_cnt[0];
    assign f[0] = word_cnt[0];
    assign f[1] = word_cnt[1];
    assign f[2] = word_cnt[2];
    assign cc = correct_n;
    assign www = wrong_cnt;
    
    assign state[0] = !statee[0];
    assign state[1] = !statee[1];
    assign state[2] = !statee[2];

    assign finish_ten_char = (word_cnt % 10 == 0) ? 1 : 0;
    assign {vgaRed, vgaGreen, vgaBlue} = (valid == 1'b1) ? {Red, Green, Blue} : 12'h0;

    clk_div #(2) CD0(.clk(clk), .clk_d(clk_d2));
    clk_div #(22) CD1(.clk(clk), .clk_d(clk_d22));
    debounce d0(clk, rst, rst_debounce);
    one_pulse o0(clk, rst_debounce, rst_op);
    
    //keyboard==================================
    KeyboardDecoder key_de (
        .key_down(key_down),
        .last_change(last_change),
        .key_valid(been_ready),
        .PS2_DATA(PS2_DATA),
        .PS2_CLK(PS2_CLK),
        .rst(rst_op),
        .clk(clk)
    );
    //==========================================

    //FSM=======================================
    FSM F0(
        .clk(clk),
        .rst(rst_op),
        .key_down(key_down),
        .last_change(last_change),
        .been_ready(been_ready),
        .correct_n(correct_n),
        .wrong_cnt(wrong_cnt),
        .state(statee),
        .wpm(wpm),
        .stcnt(stcnt)
    );
    //==========================================

    //INPUT=====================================
    CHECK ck(
        .clk(clk),
        .rst(rst_op),
        .key_down(key_down),
        .last_change(last_change),
        .been_ready(been_ready),
        .state(statee),
        .correct_n(correct_n),
        .word_cnt(word_cnt),
        .wrong_words(wrong_cnt),
        .word(adr[word_cnt])
    );
    //==========================================

    //VGA=======================================
    
    assign output_word = (h_cnt >= 80 && v_cnt >= 208) ? ( ((h_cnt - 80) / 8) + (60 * ((v_cnt-208) / 16))) : 0;
    
    mem_addr_gen MAG(
        .clk(clk_d2),
        .rst(rst_op),
        .h_cnt(h_cnt),
        .v_cnt(v_cnt),
        .word_num(output_word),
        .letter(adr[output_word]),
        .red(Red),
        .green(Green),
        .blue(Blue),
        .correct(correct_n),
        .word_cnt(word_cnt)
    );


    vga_controller VC0(
        .pclk(clk_d2),
        .reset(rst_op),
        .hsync(hsync),
        .vsync(vsync),
        .valid(valid),
        .h_cnt(h_cnt),
        .v_cnt(v_cnt)
    );
    //==========================================
    
    //IR========================================
    IR_send irr(.clk(clk), .rst(rst_op), .ready(finish_ten_word), .out(ir_send));
    //==========================================

    //input the article=============================
    assign adr[0] = 38;
    assign adr[1] = 26;
    assign adr[2] = 6;
    assign adr[3] = 14;
    assign adr[4] = 19;
    assign adr[5] = 26;
    assign adr[6] = 0;
    assign adr[7] = 26;
    assign adr[8] = 12;
    assign adr[9] = 14;
    assign adr[10] = 13;
    assign adr[11] = 18;
    assign adr[12] = 19;
    assign adr[13] = 4;
    assign adr[14] = 17;
    assign adr[15] = 26;
    assign adr[16] = 8;
    assign adr[17] = 13;
    assign adr[18] = 26;
    assign adr[19] = 12;
    assign adr[20] = 24;
    assign adr[21] = 26;
    assign adr[22] = 2;
    assign adr[23] = 11;
    assign adr[24] = 14;
    assign adr[25] = 18;
    assign adr[26] = 4;
    assign adr[27] = 19;
    assign adr[28] = 28;
    assign adr[29] = 26;
    assign adr[30] = 48;
    assign adr[31] = 14;
    assign adr[32] = 12;
    assign adr[33] = 4;
    assign adr[34] = 14;
    assign adr[35] = 13;
    assign adr[36] = 4;
    assign adr[37] = 29;
    assign adr[38] = 18;
    assign adr[39] = 26;
    assign adr[40] = 20;
    assign adr[41] = 13;
    assign adr[42] = 3;
    assign adr[43] = 4;
    assign adr[44] = 17;
    assign adr[45] = 13;
    assign adr[46] = 4;
    assign adr[47] = 0;
    assign adr[48] = 19;
    assign adr[49] = 7;
    assign adr[50] = 26;
    assign adr[51] = 12;
    assign adr[52] = 24;
    assign adr[53] = 26;
    assign adr[54] = 1;
    assign adr[55] = 4;
    assign adr[56] = 3;
    assign adr[57] = 28;
    assign adr[58] = 26;
    assign adr[59] = 49;
    assign adr[60] = 7;
    assign adr[61] = 4;
    assign adr[62] = 26;
    assign adr[63] = 22;
    assign adr[64] = 8;
    assign adr[65] = 13;
    assign adr[66] = 3;
    assign adr[67] = 29;
    assign adr[68] = 18;
    assign adr[69] = 26;
    assign adr[70] = 10;
    assign adr[71] = 13;
    assign adr[72] = 14;
    assign adr[73] = 2;
    assign adr[74] = 10;
    assign adr[75] = 8;
    assign adr[76] = 13;
    assign adr[77] = 6;
    assign adr[78] = 26;
    assign adr[79] = 0;
    assign adr[80] = 19;
    assign adr[81] = 26;
    assign adr[82] = 12;
    assign adr[83] = 24;
    assign adr[84] = 26;
    assign adr[85] = 22;
    assign adr[86] = 8;
    assign adr[87] = 13;
    assign adr[88] = 3;
    assign adr[89] = 14;
    assign adr[90] = 22;
    assign adr[91] = 28;
    assign adr[92] = 26;
    assign adr[93] = 38;
    assign adr[94] = 29;
    assign adr[95] = 3;
    assign adr[96] = 26;
    assign adr[97] = 10;
    assign adr[98] = 8;
    assign adr[99] = 11;
    assign adr[100] = 11;
    assign adr[101] = 26;
    assign adr[102] = 8;
    assign adr[103] = 19;
    assign adr[104] = 26;
    assign adr[105] = 1;
    assign adr[106] = 20;
    assign adr[107] = 19;
    assign adr[108] = 26;
    assign adr[109] = 8;
    assign adr[110] = 19;
    assign adr[111] = 29;
    assign adr[112] = 18;
    assign adr[113] = 26;
    assign adr[114] = 0;
    assign adr[115] = 11;
    assign adr[116] = 17;
    assign adr[117] = 4;
    assign adr[118] = 0;
    assign adr[119] = 3;
    assign adr[120] = 24;
    assign adr[121] = 26;
    assign adr[122] = 3;
    assign adr[123] = 4;
    assign adr[124] = 0;
    assign adr[125] = 3;
    assign adr[126] = 28;
    assign adr[127] = 26;
    assign adr[128] = 30;
    assign adr[129] = 19;
    assign adr[130] = 26;
    assign adr[131] = 5;
    assign adr[132] = 8;
    assign adr[133] = 17;
    assign adr[134] = 18;
    assign adr[135] = 19;
    assign adr[136] = 26;
    assign adr[137] = 38;
    assign adr[138] = 26;
    assign adr[139] = 22;
    assign adr[140] = 0;
    assign adr[141] = 18;
    assign adr[142] = 26;
    assign adr[143] = 18;
    assign adr[144] = 2;
    assign adr[145] = 0;
    assign adr[146] = 17;
    assign adr[147] = 4;
    assign adr[148] = 3;
    assign adr[149] = 26;
    assign adr[150] = 22;
    assign adr[151] = 7;
    assign adr[152] = 4;
    assign adr[153] = 13;
    assign adr[154] = 26;
    assign adr[155] = 38;
    assign adr[156] = 26;
    assign adr[157] = 11;
    assign adr[158] = 14;
    assign adr[159] = 14;
    assign adr[160] = 10;
    assign adr[161] = 4;
    assign adr[162] = 3;
    assign adr[163] = 26;
    assign adr[164] = 0;
    assign adr[165] = 19;
    assign adr[166] = 26;
    assign adr[167] = 7;
    assign adr[168] = 8;
    assign adr[169] = 18;
    assign adr[170] = 26;
    assign adr[171] = 4;
    assign adr[172] = 24;
    assign adr[173] = 4;
    assign adr[174] = 18;
    assign adr[175] = 26;
    assign adr[176] = 1;
    assign adr[177] = 20;
    assign adr[178] = 19;
    assign adr[179] = 26;
    assign adr[180] = 13;
    assign adr[181] = 14;
    assign adr[182] = 22;
    assign adr[183] = 26;
    assign adr[184] = 19;
    assign adr[185] = 7;
    assign adr[186] = 0;
    assign adr[187] = 19;
    assign adr[188] = 26;
    assign adr[189] = 38;
    assign adr[190] = 26;
    assign adr[191] = 10;
    assign adr[192] = 13;
    assign adr[193] = 14;
    assign adr[194] = 22;
    assign adr[195] = 26;
    assign adr[196] = 7;
    assign adr[197] = 8;
    assign adr[198] = 12;
    assign adr[199] = 26;
    assign adr[200] = 38;
    assign adr[201] = 29;
    assign adr[202] = 12;
    assign adr[203] = 26;
    assign adr[204] = 13;
    assign adr[205] = 14;
    assign adr[206] = 19;
    assign adr[207] = 26;
    assign adr[208] = 19;
    assign adr[209] = 7;
    assign adr[210] = 0;
    assign adr[211] = 19;
    assign adr[212] = 26;
    assign adr[213] = 18;
    assign adr[214] = 20;
    assign adr[215] = 17;
    assign adr[216] = 15;
    assign adr[217] = 17;
    assign adr[218] = 8;
    assign adr[219] = 18;
    assign adr[220] = 4;
    assign adr[221] = 3;
    assign adr[222] = 28;
    assign adr[223] = 26;
    assign adr[224] = 38;
    assign adr[225] = 29;
    assign adr[226] = 12;
    assign adr[227] = 26;
    assign adr[228] = 9;
    assign adr[229] = 20;
    assign adr[230] = 18;
    assign adr[231] = 19;
    assign adr[232] = 26;
    assign adr[233] = 22;
    assign adr[234] = 0;
    assign adr[235] = 8;
    assign adr[236] = 19;
    assign adr[237] = 8;
    assign adr[238] = 13;
    assign adr[239] = 6;
    assign adr[240] = 26;
    assign adr[241] = 14;
    assign adr[242] = 13;
    assign adr[243] = 26;
    assign adr[244] = 19;
    assign adr[245] = 7;
    assign adr[246] = 4;
    assign adr[247] = 26;
    assign adr[248] = 18;
    assign adr[249] = 20;
    assign adr[250] = 13;
    assign adr[251] = 26;
    assign adr[252] = 19;
    assign adr[253] = 14;
    assign adr[254] = 26;
    assign adr[255] = 17;
    assign adr[256] = 8;
    assign adr[257] = 18;
    assign adr[258] = 4;
    assign adr[259] = 28;
    assign adr[260] = 26;
    assign adr[261] = 44;
    assign adr[262] = 7;
    assign adr[263] = 26;
    assign adr[264] = 7;
    assign adr[265] = 14;
    assign adr[266] = 22;
    assign adr[267] = 26;
    assign adr[268] = 38;
    assign adr[269] = 26;
    assign adr[270] = 22;
    assign adr[271] = 8;
    assign adr[272] = 18;
    assign adr[273] = 7;
    assign adr[274] = 26;
    assign adr[275] = 19;
    assign adr[276] = 7;
    assign adr[277] = 0;
    assign adr[278] = 19;
    assign adr[279] = 26;
    assign adr[280] = 14;
    assign adr[281] = 11;
    assign adr[282] = 3;
    assign adr[283] = 26;
    assign adr[284] = 18;
    assign adr[285] = 20;
    assign adr[286] = 13;
    assign adr[287] = 26;
    assign adr[288] = 22;
    assign adr[289] = 14;
    assign adr[290] = 20;
    assign adr[291] = 11;
    assign adr[292] = 3;
    assign adr[293] = 26;
    assign adr[294] = 17;
    assign adr[295] = 8;
    assign adr[296] = 18;
    assign adr[297] = 4;
    assign adr[298] = 28; 
    //========================================

endmodule

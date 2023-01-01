`timescale 1ns/1ps

module top(clk, rst, vgaRed, vgaBlue, vgaGreen, PS2_DATA, PS2_CLK, an, seg, state, hsync, vsync);
    
    input clk, rst;
    inout PS2_DATA, PS2_CLK;
    output [3:0] vgaRed, vgaBlue, vgaGreen;
    output [3:0] an;
    output [6:0] seg;
    output [2:0] state;
    output hsync, vsync;

    wire clk_d2; //25MHz
    wire clk_d22;
    wire rst_debounce, rst_op;
    wire [5:0] adr [511:0];
    wire [16:0] pixel_addr; //picture address;
    wire [11:0] pixel;
    wire [11:0] data;
    wire valid;
    //640*480
    wire [9:0] h_cnt, v_cnt;
    wire [9:0] h_cnt_re, v_cnt_re;
    wire run;

    wire [511:0] key_down;
    wire [8:0] last_change;
    wire been_ready;

    wire [2:0] statee;
    wire [6:0] wpm;
    wire [28:0] stcnt; //count down three seconds.

    assign h_cnt_re = h_cnt>>1;
    assign v_cnt_re = v_cnt>>1;
    
    assign state[0] = !statee[0];
    assign state[1] = !statee[1];
    assign state[2] = !statee[2];

    assign {vgaRed, vgaGreen, vgaBlue} = (valid == 1'b1) ? pixel : 12'h0;

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
        .state(statee),
        .wpm(wpm),
        .stcnt(stcnt)
    );
    //==========================================

    //VGA=======================================
    
    mem_addr_gen MAG(
        .clk(clk_d22),
        .rst(rst_op),
        .h_cnt(h_cnt_re),
        .v_cnt(v_cnt_re),
//        .words(word_mem),
        .pixel_addr(pixel_addr)
    );
    blk_mem_gen_0 BMG0(
        .clka(clk_d2),
        .wea(0),
        .addra(pixel_addr),
        .dina(data[11:0]),
        .douta(pixel)
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

    //input the article=============================
    assign adr[0] = 33;
    assign adr[1] = 13;
    assign adr[2] = 3;
    assign adr[3] = 26;
    assign adr[4] = 18;
    assign adr[5] = 14;
    assign adr[6] = 12;
    assign adr[7] = 4;
    assign adr[8] = 26;
    assign adr[9] = 19;
    assign adr[10] = 7;
    assign adr[11] = 8;
    assign adr[12] = 13;
    assign adr[13] = 6;
    assign adr[14] = 18;
    assign adr[15] = 26;
    assign adr[16] = 19;
    assign adr[17] = 7;
    assign adr[18] = 0;
    assign adr[19] = 19;
    assign adr[20] = 26;
    assign adr[21] = 18;
    assign adr[22] = 7;
    assign adr[23] = 14;
    assign adr[24] = 20;
    assign adr[25] = 11;
    assign adr[26] = 3;
    assign adr[27] = 26;
    assign adr[28] = 13;
    assign adr[29] = 14;
    assign adr[30] = 19;
    assign adr[31] = 26;
    assign adr[32] = 7;
    assign adr[33] = 0;
    assign adr[34] = 21;
    assign adr[35] = 4;
    assign adr[36] = 26;
    assign adr[37] = 1;
    assign adr[38] = 4;
    assign adr[39] = 4;
    assign adr[40] = 13;
    assign adr[41] = 26;
    assign adr[42] = 5;
    assign adr[43] = 14;
    assign adr[44] = 17;
    assign adr[45] = 6;
    assign adr[46] = 14;
    assign adr[47] = 19;
    assign adr[48] = 19;
    assign adr[49] = 4;
    assign adr[50] = 13;
    assign adr[51] = 26;
    assign adr[52] = 22;
    assign adr[53] = 4;
    assign adr[54] = 17;
    assign adr[55] = 4;
    assign adr[56] = 26;
    assign adr[57] = 11;
    assign adr[58] = 14;
    assign adr[59] = 18;
    assign adr[60] = 19;
    assign adr[61] = 28;
    assign adr[62] = 26;
    assign adr[63] = 40;
    assign adr[64] = 8;
    assign adr[65] = 18;
    assign adr[66] = 19;
    assign adr[67] = 14;
    assign adr[68] = 17;
    assign adr[69] = 24;
    assign adr[70] = 26;
    assign adr[71] = 1;
    assign adr[72] = 4;
    assign adr[73] = 2;
    assign adr[74] = 0;
    assign adr[75] = 12;
    assign adr[76] = 4;
    assign adr[77] = 26;
    assign adr[78] = 11;
    assign adr[79] = 4;
    assign adr[80] = 6;
    assign adr[81] = 4;
    assign adr[82] = 13;
    assign adr[83] = 3;
    assign adr[84] = 28;
    assign adr[85] = 26;
    assign adr[86] = 44;
    assign adr[87] = 4;
    assign adr[88] = 6;
    assign adr[89] = 4;
    assign adr[90] = 13;
    assign adr[91] = 3;
    assign adr[92] = 26;
    assign adr[93] = 1;
    assign adr[94] = 4;
    assign adr[95] = 2;
    assign adr[96] = 0;
    assign adr[97] = 12;
    assign adr[98] = 4;
    assign adr[99] = 26;
    assign adr[100] = 12;
    assign adr[101] = 24;
    assign adr[102] = 19;
    assign adr[103] = 7;
    assign adr[104] = 28;
    assign adr[105] = 26;
    assign adr[106] = 33;
    assign adr[107] = 13;
    assign adr[108] = 3;
    assign adr[109] = 26;
    assign adr[110] = 5;
    assign adr[111] = 14;
    assign adr[112] = 17;
    assign adr[113] = 26;
    assign adr[114] = 19;
    assign adr[115] = 22;
    assign adr[116] = 14;
    assign adr[117] = 26;
    assign adr[118] = 0;
    assign adr[119] = 13;
    assign adr[120] = 3;
    assign adr[121] = 26;
    assign adr[122] = 0;
    assign adr[123] = 26;
    assign adr[124] = 7;
    assign adr[125] = 0;
    assign adr[126] = 11;
    assign adr[127] = 5;
    assign adr[128] = 26;
    assign adr[129] = 19;
    assign adr[130] = 7;
    assign adr[131] = 14;
    assign adr[132] = 20;
    assign adr[133] = 18;
    assign adr[134] = 0;
    assign adr[135] = 13;
    assign adr[136] = 3;
    assign adr[137] = 26;
    assign adr[138] = 24;
    assign adr[139] = 4;
    assign adr[140] = 0;
    assign adr[141] = 17;
    assign adr[142] = 18;
    assign adr[143] = 27;
    assign adr[144] = 26;
    assign adr[145] = 19;
    assign adr[146] = 7;
    assign adr[147] = 4;
    assign adr[148] = 26;
    assign adr[149] = 17;
    assign adr[150] = 8;
    assign adr[151] = 13;
    assign adr[152] = 6;
    assign adr[153] = 26;
    assign adr[154] = 15;
    assign adr[155] = 0;
    assign adr[156] = 18;
    assign adr[157] = 18;
    assign adr[158] = 4;
    assign adr[159] = 3;
    assign adr[160] = 26;
    assign adr[161] = 14;
    assign adr[162] = 20;
    assign adr[163] = 19;
    assign adr[164] = 26;
    assign adr[165] = 14;
    assign adr[166] = 5;
    assign adr[167] = 26;
    assign adr[168] = 0;
    assign adr[169] = 11;
    assign adr[170] = 11;
    assign adr[171] = 26;
    assign adr[172] = 10;
    assign adr[173] = 13;
    assign adr[174] = 14;
    assign adr[175] = 22;
    assign adr[176] = 11;
    assign adr[177] = 4;
    assign adr[178] = 3;
    assign adr[179] = 6;
    assign adr[180] = 4;
    assign adr[181] = 28;
    //========================================

endmodule

module mem_addr_gen(
   input clk,
   input rst,
   input [9:0] h_cnt,
   input [9:0] v_cnt,
   output [16:0] pixel_addr
   );
    
   reg [7:0] position;
  
   assign pixel_addr = (v_cnt < 75 || v_cnt > 150) ? 76000 : (((h_cnt))+(320*((v_cnt%76))))% 76800;
//   assign pixel_addr = (((h_cnt))+(320*((v_cnt%76)+74)))% 76800;  //a
//   assign pixel_addr = (((h_cnt))+(320*((v_cnt%76)+144)))% 76800;
   
   always @ (posedge clk or posedge rst) begin
      if(rst)
          position <= 0;
       else if(position < 239)
           position <= position + 1;
       else
           position <= 0;
   end
    
endmodule

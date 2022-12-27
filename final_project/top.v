`timescale 1ns/1ps

module top(clk, rst, vgaRed, vgaBlue, vgaGreen, PS2_DATA, PS2_CLK);
    
    input clk, rst;
    inout PS2_DATA, PS2_CLK;
    output [3:0] an;
    output [7:0] seg;

    wire clk_d2; //25MHz
    wire rst_debounce, rst_op;
    wire [5:0] adr [511:0];
    wire [16:0] pixel_addr;
    wire [11:0] pixel;
    wire [11:0] data;
    wire valid;
    //640*480
    wire [9:0] h_cnt, v_cnt;
    wire [9:0] h_cnt_re, v_cnt_re;
    wire run;

    assign h_cnt_re = h_cnt>>1;
    assign v_cnt_re = v_cnt>>1;

    assign {vgaRed, vgaGreen, vgaBlue} = (valid == 1'b1) ? pixel : 12'h0;

    clk_div #(2) CD0(.clk(clk), .clk_d(clk_d2));
    debounce d0(clk, rst, rst_debounce);
    one_pulse o0(clk, rst_debounce, rst_op);

    //input the article=========================
    ReadArticle R0(adr);
    //==========================================

    //keyboard==================================
    KeyboardDecoder key_de (
        .key_down(key_down),
        .last_change(last_change),
        .ley_valid(been_ready),
        .PS2_DATA(PS2_DATA),
        .PS2_CLK(PS2_CLK),
        .rst(rst),
        .clk(clk)
    );

    always @(*) begin
        case (last_change)
            
        endcase
    end
    //==========================================

    //VGA=======================================
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


endmodule


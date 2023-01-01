`timescale 1ns/1ps

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

`timescale 1ns / 1ps

module Display_Gen_Digilent(
input clk, 
input resetn,

output TMDS_Clk_p,
output TMDS_Clk_n,
output [2:0] TMDS_Data_p,
output [2:0] TMDS_Data_n
    );

//VTC PORTS
logic sof_state,
clken, 
gen_clken,
active_video_out,
hsync_out,
vsync_out;

//DIGILENT PORTS
logic 



   

    
rgb2dvi_0 rgb2dvi (





);


 VTC vtc(
 .clk(clk),
 .clken(1'b1),
 .gen_clken(1'b1),
 .resetn(resetn),
 .sof_state(sof_state),
 .active_video_out(NATIVE_VID_IN_active_video),
 .hsync_out(NATIVE_VID_IN_hsync),
 .vsync_out(NATIVE_VID_IN_vsync)
 
 
 
 );
endmodule

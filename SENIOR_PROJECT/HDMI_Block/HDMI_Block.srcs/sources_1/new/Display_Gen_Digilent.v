`timescale 1ns / 1ps

module Display_Gen_Digilent(

input clk,

input resetn,
input PixelClk,

 

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

 

 

///* output */ logic TMDS_Clk_p;

///* output */ logic TMDS_Clk_n;

///* output */ logic[2:0] TMDS_Data_p;

///* output */ logic[2:0] TMDS_Data_n;

 

/*        */   // Auxiliary signals

/* input  */ logic aRst;   // --asynchronous reset; must be reset when RefClk is not within spec

/* input  */ logic aRst_n; // --asynchronous reset; must be reset when RefClk is not within spec

/*        */

/*        */   // Video in

/* input  */ logic [23:0] vid_pData ;

/* input  */ logic vid_pVDE  ;

/* input  */ logic vid_pHSync;

/* input  */ logic vid_pVSync;



/*        */

/* input  */ logic SerialClk;   // 5x PixelClk

 

 

rgb2dvi_0 rgb2dvi (

.TMDS_Clk_p (TMDS_Clk_p ),     

 .TMDS_Clk_n (TMDS_Clk_n ),

.TMDS_Data_p(TMDS_Data_p),

.TMDS_Data_n(TMDS_Data_n),

.aRst       (aRst       ),

.aRst_n     (aRst_n     ),

.vid_pData  (vid_pData  ),

.vid_pVDE   (vid_pVDE   ),

.vid_pHSync (vid_pHSync ),

.vid_pVSync (vid_pVSync ),

.PixelClk   (PixelClk   ),

.SerialClk  (clk  )

);

 

VTC vtc(

.clk(clk),

.clken(1'b1),

.gen_clken(1'b1),

.resetn(resetn),

.sof_state(sof_state),

.active_video_out(VID_pVDE),

.hsync_out(vid_pHSync),

.vsync_out(vid_pVSync)

);



endmodule

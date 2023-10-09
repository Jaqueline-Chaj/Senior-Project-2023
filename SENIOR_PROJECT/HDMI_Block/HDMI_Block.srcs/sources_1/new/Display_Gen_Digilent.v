`timescale 1ns / 1ps

module Display_Gen_Digilent(

input cpu_resetn,
input clk,

output hdmi_tx_clk_p,

output hdmi_tx_clk_n,

output [2:0] hdmi_tx_p,

output [2:0] hdmi_tx_n

    );

//VTC PORTS

logic sof_state,

clken,

gen_clken,

active_video_out,

hsync_out,

vsync_out;

/*        */   // Auxiliary signals

/* input  */ logic aRst;   // --asynchronous reset; must be reset when RefClk is not within spec
/*        */   // Video in
/* input  */ logic PixelClk;
/* input  */ logic [23:0] vid_pData ;

/* input  */ logic vid_pVDE  ;

/* input  */ logic vid_pHSync;

/* input  */ logic vid_pVSync;

assign vid_pData=24'h00_FF_00;


//reset flip_flop to avoid metastability
logic res_d1;
logic res_d2;
logic reset;
logic resetn;
always_ff@(posedge PixelClk)
begin
    res_d1<=~cpu_resetn;
    res_d2<=res_d1;
    reset<=res_d2;
end

assign resetn=~reset;

//Clocking wizard
clk_wiz_0 clk_wiz 
 (
  // Clock out ports
 .clk_out1(PixelClk),
  // Status and control signals
 .reset(~cpu_resetn),
 // output   locked,
 // Clock in ports
  .clk_in1(clk)
 );




//Display IP
rgb2dvi_0 rgb2dvi (

.TMDS_Clk_p (hdmi_tx_clk_p ),     

 .TMDS_Clk_n (hdmi_tx_clk_n ),

.TMDS_Data_p(hdmi_tx_p),

.TMDS_Data_n(hdmi_tx_n),

.aRst       (~resetn  ),

//.aRst_n     (resetn     ),

.vid_pData  (vid_pData  ),

.vid_pVDE   (vid_pVDE   ),

.vid_pHSync (vid_pHSync ),

.vid_pVSync (vid_pVSync ),

.PixelClk   (PixelClk )//,

//.SerialClk  (SerialClk  )

);

 
//VTC IP
VTC vtc(

.clk(PixelClk),

.clken(1'b1),

.gen_clken(1'b1),

.resetn(resetn),

.sof_state(sof_state),

.active_video_out(vid_pVDE),

.hsync_out(vid_pHSync),

.vsync_out(vid_pVSync)

);



endmodule

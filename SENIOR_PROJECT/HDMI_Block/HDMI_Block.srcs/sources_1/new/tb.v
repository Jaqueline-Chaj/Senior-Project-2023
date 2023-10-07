`timescale 1ns / 1ps


module tb();
logic clk, resetn,pixel_clk;

logic sof_state,

clken,

gen_clken,

active_video_out,

hsync_out,

vsync_out;

//DIGILENT PORTS


logic TMDS_Clk_p;
logic TMDS_Clk_n;
logic[2:0] TMDS_Data_p;
logic[2:0] TMDS_Data_n;

/* input  */ logic aRst;   // --asynchronous reset; must be reset when RefClk is not within spec

/* input  */ logic aRst_n; // --asynchronous reset; must be reset when RefClk is not within spec

/*        */   // Video in

/* input  */ logic [23:0] vid_pData ;
/* input  */ logic vid_pVDE  ;
/* input  */ logic vid_pHSync;
/* input  */ logic vid_pVSync;
/* input  */ logic PixelClk  ;

  

assign DDC_OUT_sda_i=1;
assign DDC_OUT_scl_i=1;


Display_Gen_Digilent disp_gen (


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

.SerialClk  (SerialClk  )

);


int i=0;
initial begin
clk=1;
for(i=0; i<5000000000; i=i+1) 
    #6.73 clk=~clk;
$finish;
end

int k=0;
initial begin
clk=1;
for(k=0; k<5000000000; k=k+1) 
    #1.346 SerialClk=SerialClk;
$finish;
end

initial begin
reset_n=0;
#100 reset_n=1;
end
endmodule

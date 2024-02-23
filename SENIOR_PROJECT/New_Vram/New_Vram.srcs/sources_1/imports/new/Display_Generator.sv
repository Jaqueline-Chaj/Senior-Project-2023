`timescale 1ns / 1ps

module Display_Gen_Digilent(

input reset,

input PixelClk,

input [23:0] rgbtodvi,

output hdmi_tx_clk_p,

output hdmi_tx_clk_n,

output [2:0] hdmi_tx_p,

output [2:0] hdmi_tx_n,

output [19:0] rd_addr  //This detirmines the address to read from the VRAM

    );

//VTC PORTS

logic sof_state,

clken,

gen_clken,

active_video_out,

h_blank,

v_blank;


logic h_drive_start;
logic h_blank_p1;
logic v_drive_start;
logic v_blank_p1;

/*        */   // Auxiliary signals

/* input  */ logic aRst;   // --asynchronous reset; must be reset when RefClk is not within spec
/*        */   // Video in
/* input  */ logic [23:0] vid_pData ;  //Data inserted into the HDMI output

/* input  */ logic vid_pVDE  ;  //Enables the HDMI

/* input  */ logic vid_pHSync;  //The Vsync and Hsync from the VTC
/*input */   logic vid_pVSync; 
           
             logic[11:0]disp_x;  //This is the vectors that detirmine the Read address
             logic[9:0]disp_y;
             logic[12:0] prod;


//reset flip_flop to avoid metastability


//ASSIGN THE DATA FROM THE VRAM INTO THE PORT THAT WILL GO INTO THE HDMI
assign vid_pData=rgbtodvi;



//Display IP
rgb2dvi_0 rgb2dvi (

.TMDS_Clk_p (hdmi_tx_clk_p ),     

 .TMDS_Clk_n (hdmi_tx_clk_n ),

.TMDS_Data_p(hdmi_tx_p),

.TMDS_Data_n(hdmi_tx_n),

.aRst       (reset),

//.aRst_n     (resetn     ),

.vid_pData  (vid_pData  ),

.vid_pVDE   (vid_pVDE   ),

.vid_pHSync (vid_pHSync ),

.vid_pVSync (vid_pVSync ),

.PixelClk   (PixelClk )//,

//.SerialClk  (SerialClk  )

);

 
//VTC IP
v_tc_0 vtc(

.clk(PixelClk),

.clken(1'b1),

.gen_clken(1'b1),

.resetn(~reset),

.sof_state(sof_state),      // INP -- only used for AXI4

.active_video_out(vid_pVDE), // OUT - generated active video signal, active for non-blanking liness

.hsync_out(vid_pHSync),

.vsync_out(vid_pVSync),
 
.hblank_out(h_blank),

.vblank_out(v_blank)
);


//Counter and case statement

always_ff@(posedge PixelClk) begin
    h_blank_p1<=h_blank;
    v_blank_p1<=v_blank;
end

assign h_drive_start=~(h_blank) & h_blank_p1; //Pulse on the falling ende of h blankj
assign v_drive_start=~(v_blank) & v_blank_p1;  //Unsure if needed but added just in case
//
always_ff@(posedge PixelClk) begin  //These two always statements read through the VRAM for each possible pixel.
	if(reset || h_drive_start)
		disp_x<=0;
    else begin
        if(~h_blank) begin  //Only counts if it is not horizontally blanking 
            if(disp_x<1279) //Could this be v_blank instead?
                disp_x<=disp_x+1;
            else
                disp_x<=0;  //Counts up the display engine x counter
        end	
    end
end


always_ff@(posedge PixelClk) begin   
	if(reset)
		disp_y<=0;
	else begin 
        if(~v_blank) begin
            if(h_drive_start) begin
            //if(disp_x==1279) begin  //Same here- Should we do this via blanking rather than #'s(?)
              if(disp_y<719) 
                disp_y<=disp_y+1;
            else
                disp_y<=0;
            end     
       end	
    end
end

assign prod = disp_y * 5;
  
assign rd_addr= {prod, 8'b0} +disp_x;  //This puts the pixel data from the counters into a format for the VRAM.


endmodule

`timescale 1ns / 1ps

module Display_Gen_Digilent(

input cpu_resetn,

input PixelClk,

input [23:0] rgbtodvi,

output hdmi_tx_clk_p,

output hdmi_tx_clk_n,

output [2:0] hdmi_tx_p,

output [2:0] hdmi_tx_n,

output [19:0] RD_addr

    );

//VTC PORTS

logic sof_state,

clken,

gen_clken,

active_video_out,

hsync_out,

vsync_out,

h_blank,

v_blank;



/*        */   // Auxiliary signals

/* input  */ logic aRst;   // --asynchronous reset; must be reset when RefClk is not within spec
/*        */   // Video in
/* input  */ logic [23:0] vid_pData ;

/* input  */ logic vid_pVDE  ;

/* input  */ logic vid_pHSync;
/*input */   logic vid_pVSync;
           
             logic[11:0]disp_x;
             logic[9:0]disp_y;
             logic[12:0] prod;


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

//ASSIGN THE DATA FROM THE VRAM INTO THE PORT THAT WILL GO INTO THE HDMI
assign vid_pData=rgbtodvi;



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
v_tc_0 vtc(

.clk(PixelClk),

.clken(1'b1),

.gen_clken(1'b1),

.resetn(resetn),

.sof_state(sof_state),

.active_video_out(vid_pVDE),

.hsync_out(vid_pHSync),

.vsync_out(vid_pVSync),
 
.hblank_out(h_blank),

.vblank_out(v_blank)
);


//Counter and case statement
always_ff@(posedge PixelClk) begin  //These two always statements read through the VRAM for each possible pixel.
	if(reset)
		disp_x<=0;
	if(~h_blank) begin
		if(disp_x<1279) 
			disp_x<=disp_x+1;
		else
			disp_x<=0;
    end	
end


always_ff@(posedge PixelClk) begin   
	if(reset)
		disp_y<=0;
	if(~v_blank) begin
		if(disp_x==1279) begin
		  if(disp_y<719) 
			disp_y<=disp_y+1;
		else
			disp_y<=0;
		end
			
    end	
end

assign prod = disp_y * 5;
  
assign RD_addr= {prod, 8'b0} +disp_x;  //This puts the pixel data from the counters into a format for the VRAM.
/*
always@(disp_x[10:7]) begin
case(disp_x[10:7])
    4'b0000: vid_pData<=black;
    4'b0001: vid_pData<=blue;
    4'b0010: vid_pData<=orange;
    4'b0011: vid_pData<=green;
    4'b0100: vid_pData<=yellow;
    4'b0101: vid_pData<=cyan;
    4'b0110: vid_pData<=red;
    4'b0111: vid_pData<=silver;
    4'b1000: vid_pData<=purple;
    4'b1001: vid_pData<=magenta;
    4'b1010: vid_pData<=peach;
    4'b1011: vid_pData<=olive;
    4'b1100: vid_pData<=white;
    4'b1101: vid_pData<=navy_blue;
    4'b1110: vid_pData<=brown;
    4'b1111: vid_pData<=yellow;
    endcase
end*/   
/*
always_comb

begin

    if (disp_x >=640) begin

    // Right half of screen

    case (disp_y[2:0])

        0:  vid_pData = 24'hFF0000;// red

        1:  vid_pData = 24'hFF7F00;// orange

        2:  vid_pData = 24'hFFFF00;// yellow

        3:  vid_pData = 24'h00FF00;// green

        4:  vid_pData = 24'h0000FF;// blue

        5:  vid_pData = 24'h7F00FF;// indigo

        6:  vid_pData = 24'hFF00FF;// violet

        7:  vid_pData = 24'hFFFFFF;// white

    endcase
    end
    else

    // Left half of screen

    case (disp_y[2:0])

        7:  vid_pData = 24'hFF0000;// red

        6:  vid_pData = 24'hFF7F00;// orange

        5:  vid_pData = 24'hFFFF00;// yellow

        4:  vid_pData = 24'h00FF00;// green

        3:  vid_pData = 24'h0000FF;// blue

        2:  vid_pData = 24'h7F00FF;// indigo

        1:  vid_pData = 24'hFF00FF;// violet

        0:  vid_pData = 24'hFFFFFF;// white

    endcase

end
*/ 
/*
always_comb begin
    if (disp_y[2:0]==disp_x[5:3])
     vid_pData<=24'hFFFFFF;
     else
     vid_pData<=000000;
 end
*/

//Counting and color active_video_out

/*Test pattern stuff */
/*
logic[23:0] black, green, yellow, orange, blue, purple, 
red, white, cyan, magenta, brown, navy_blue, silver, olive, peach;

;

assign black=23'h00_00_00;
assign green=23'h00_00_FF;
assign yellow=23'hFF_00_FF;
assign orange=23'hFF_00_B5;
assign blue=23'h00_FF_00;
assign purple=23'h80_80_00;
assign red=23'hFF_00_00;
assign white=23'hFF_FF_FF;
assign cyan=23'h00_FF_FF;
assign magenta=23'hFF_FF_00;
assign brown=23'hB5_2A_2A;
assign navy_blue=23'h00_80_00;
assign silver=23'hC0_C0_C0;
assign olive=23'h80_00_80;
assign peach=23'h00_B9_DA;

*/


endmodule

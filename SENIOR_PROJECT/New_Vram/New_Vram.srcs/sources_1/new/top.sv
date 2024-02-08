`timescale 1ns / 1ps


module top(
input clk, cpu_resetn, 


//input wr_en,
//input logic[19:0] Wr_addr,
//input logic[7:0] Wr_data,
output hdmi_tx_clk_p,

output hdmi_tx_clk_n,

output [2:0] hdmi_tx_p,

output [2:0] hdmi_tx_n//,
//Outputting the VRAM ports to Ja for testing purposes to make sure timing is correct
//output[1:0] ja
    );
logic[7:0] RD_data;
logic[7:0] red;
logic[7:0] blue;
logic[7:0] green;
logic[23:0] rgbtodvi;
logic PixelClk;

logic reset_p1;
logic reset_p2;
logic reset;

always_ff @ (posedge PixelClk)
begin
    reset_p1 <= ~cpu_resetn;
    reset_p2 <= reset_p1;
    reset <= reset_p2;
end   
assign red=RD_data[7:5];
assign blue=RD_data[4:2];
assign green=RD_data[1:0];

assign rgbtodvi[23:16]={(red),5'b1};
assign rgbtodvi[15:8]={(green), 5'b1};
assign rgbtodvi[7:0]={(blue), 5'b1};
//assign rgbtodvi[23:16]=RD_data[7:5];
//assign rgbtodvi[15:8]=RD_data[4:2];
//assign rgbtodvi[7:0]=RD_data[1:0];
logic[19:0] RD_addr;
logic[19:0] pattern_waddr;
logic[19:0] rect_waddr;
logic[19:0] waddr;
logic[7:0]  pat_vram;
logic[7:0] rect_vram;
logic[7:0] wr_vram;
logic start_trigger;
/*
Disp_Counter Disp(
.clk(PixelClk),
.reset(~cpu_resetn),
.RD_addr(RD_addr)
);
*/

pattern_gen pattern_gen(
.clk(PixelClk),
.reset(reset),
.waddr(pattern_waddr),
.wr_vram(pat_vram),
.wr_en(pat_wr_en)
);

RectFill RectFill(
.clk(PixelClk),
.reset(reset),
.waddr(rect_waddr),
.foreground_color(24'hFFFF00),
.start_trigger(start_trigger),
.top(10'b0000100000), //30
.lft(11'b00000100000),//30
.bot(10'b00_1111_1111),
.rgt(11'b000_1111_1111),
.pixel_val(rect_vram),
.wr_en(rect_wr_en)
);  
 
 /*this is a temporary simulation of the start trigger.  It ensures that a pulse emanates when the 
pattern generator goes to idle, and then stops after the next clock cycle */
   
logic pat_wr_en_p1;
assign start_trigger=(~pat_wr_en) & pat_wr_en_p1;
always@(posedge PixelClk) begin
    pat_wr_en_p1<=pat_wr_en; 
end





logic[19:0] pat_bitwise_and;
logic[19:0] rect_bitwise_and;
logic[7:0] pat_wr_bitwise_and;
logic[7:0] rect_wr_bitwise_and;
//Chooses which engine adddress and color value we want.
assign pat_bitwise_and=pattern_waddr & {20{pat_wr_en}};  //If the pattern write enable is active, then bitwise and returns the pattern write address
assign rect_bitwise_and=rect_waddr & {20{rect_wr_en}};
assign waddr=rect_bitwise_and | pat_bitwise_and;

assign pat_wr_bitwise_and=pat_vram & {8{pat_wr_en}};  //If the pattern write enable is active, then bitwise and returns the pattern write address
assign rect_wr_bitwise_and=rect_vram & {8{rect_wr_en}};
assign wr_vram=rect_wr_bitwise_and | pat_wr_bitwise_and;



VRAM VRAM(
.clk(PixelClk),
.wr_en(pat_wr_en | rect_wr_en),
.waddr(waddr),
.wr_data(wr_vram),
.RD_addr(RD_addr),
.RD_Data(RD_data));

Display_Gen_Digilent Display_Gen(
.PixelClk(PixelClk),
.cpu_resetn(~reset),
.RD_addr(RD_addr),
.rgbtodvi(rgbtodvi),
.hdmi_tx_clk_n(hdmi_tx_clk_n),
.hdmi_tx_clk_p(hdmi_tx_clk_p),
.hdmi_tx_n(hdmi_tx_n),
.hdmi_tx_p(hdmi_tx_p));

//assign ja[1]=hdmi_tx_clk_p;
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
endmodule

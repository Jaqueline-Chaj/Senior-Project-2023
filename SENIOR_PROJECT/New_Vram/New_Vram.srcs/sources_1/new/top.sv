`timescale 1ns / 1ps


module top(
input clk, cpu_resetn, 
//input[10:0] lft, rgt,
//input[9:0] top, bot,
//input[23:0] foreground_color,

output hdmi_tx_clk_p,

output hdmi_tx_clk_n,

output [2:0] hdmi_tx_p,

output [2:0] hdmi_tx_n//,
    );
    
logic[7:0] rd_data;
logic[7:0] red;
logic[7:0] blue;
logic[7:0] green;
logic[23:0] rgbtodvi;
logic PixelClk;

logic reset_p1;
logic reset_p2;
logic reset;

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
logic pat_wr_en;

always_ff @ (posedge PixelClk)
begin
    reset_p1 <= ~cpu_resetn;
    reset_p2 <= reset_p1;
    reset <= reset_p2;
end   
 //Not permanent:  Meant to just simulate rectangle engine.


//assign rgbtodvi[23:16]=RD_data[7:5];
//assign rgbtodvi[15:8]=RD_data[4:2];
//assign rgbtodvi[7:0]=RD_data[1:0];
logic[19:0] rd_addr; //Read address
logic[19:0] pattern_waddr;  //Write address from the pattern generator
logic[19:0] rect_waddr;
logic[19:0] waddr;
logic[7:0] pat_wr_data;
logic[7:0] rect_wr_data;
logic[7:0] wr_data;
logic start_trigger;
logic[2:0] start_trigger_ff;  //Im delaying the start trigger so it doesnt proc at the same time as reset.
logic start_trigger_p1;

logic[23:0]     foreground_color;
logic[9:0]    top;
logic[9:0]    bot;
logic[10:0]    lft;
logic[10:0]    rgt;

assign   foreground_color=24'hFFFF00;
assign    top=10'b00_0010_0000;
assign    bot=10'b00_1111_1111;
assign    lft=11'b000_0010_0000;
assign    rgt=11'b000_1111_1111;

pattern_gen pattern_gen(
.clk(PixelClk),
.reset(reset),
.waddr(pattern_waddr),
.pat_wr_data(pat_wr_data),
.pat_wr_en(pat_wr_en)
);


logic pat_wr_en_p1;

always@(posedge PixelClk) begin
    pat_wr_en_p1<=pat_wr_en; 
end
assign start_trigger=(~pat_wr_en) & pat_wr_en_p1;
;



RectFill RectFill(
.clk(PixelClk),
.reset(reset),
.waddr(rect_waddr),
.foreground_color(foreground_color),
.start_trigger(start_trigger),
.top(top), 
.lft(lft),
.bot(bot), 
.rgt(rgt),
.rect_wr_data(rect_wr_data),
.rect_wr_en(rect_wr_en)
);  
 

 //Temporary


logic[19:0] pat_bitwise_and;
logic[19:0] rect_bitwise_and;
logic[7:0] pat_wr_bitwise_and;
logic[7:0] rect_wr_bitwise_and;

//Chooses which engine adddress and color value we want.
assign pat_bitwise_and=pattern_waddr & {20{pat_wr_en}};  //If the pattern write enable is active, then bitwise and returns the pattern write address

    
assign rect_bitwise_and=rect_waddr & {20{rect_wr_en}};  //Similar

assign waddr=rect_bitwise_and | pat_bitwise_and;

assign pat_wr_bitwise_and=pat_wr_data & {8{pat_wr_en}};  //If the pattern write enable is active, then bitwise and returns the pattern write address
assign rect_wr_bitwise_and=rect_wr_data & {8{rect_wr_en}};
assign wr_data=rect_wr_bitwise_and | pat_wr_bitwise_and;



VRAM VRAM(
.clk(PixelClk),
.wr_en(pat_wr_en | rect_wr_en),
.waddr(waddr),
.wr_data(wr_data),
.rd_addr(rd_addr),
.rd_data(rd_data));

assign red=rd_data[7:5];
assign blue=rd_data[4:2];
assign green=rd_data[1:0];

assign rgbtodvi[23:16]={(red),5'b1};
assign rgbtodvi[15:8]={(green), 5'b1};
assign rgbtodvi[7:0]={(blue), 5'b1};

Display_Gen_Digilent Display_Gen(
.PixelClk(PixelClk),
.reset(reset),
.rd_addr(rd_addr),
.rgbtodvi(rgbtodvi),
.hdmi_tx_clk_n(hdmi_tx_clk_n),
.hdmi_tx_clk_p(hdmi_tx_clk_p),
.hdmi_tx_n(hdmi_tx_n),
.hdmi_tx_p(hdmi_tx_p));

//assign ja[1]=hdmi_tx_clk_p;

endmodule

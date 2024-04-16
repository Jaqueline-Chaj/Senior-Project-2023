`timescale 1ns / 1ps


module Display_gen(
input PixelClk, reset, 
input[10:0] lft, rgt,
input[10:0] top, bot,
input[23:0] foreground_color,
input rect_start_trigger,
input line_start_trigger, 
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

/*
logic reset_p1;
logic reset_p2;
logic reset;*/

//Clocking wizard


logic pat_wr_en;
/*
always_ff @ (posedge PixelClk)
begin
    reset_p1 <= ~cpu_resetn;
    reset_p2 <= reset_p1;
    reset <= reset_p2;
end   */
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

logic[19:0] line_waddr;
logic[7:0] line_wr_data;
logic line_wr_en;




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


LineEngine LineEng(
.clk(PixelClk),
.reset(reset),
.waddr(line_waddr),
.color(foreground_color),
.start_trigger(line_start_trigger),
.x1(top),
.x2(lft),
.y1(bot),
.y2(rgt),
.line_wr_data(line_wr_data),
.line_wr_en(line_wr_en));


RectFill RectFill(
.clk(PixelClk),
.reset(reset),
.waddr(rect_waddr),
.foreground_color(foreground_color),
.start_trigger(rect_start_trigger),
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
logic[19:0] line_bitwise_and;
logic[7:0] pat_wr_bitwise_and;
logic[7:0] rect_wr_bitwise_and;
logic[7:0] line_wr_bitwise_and;

//Chooses which engine adddress and color value we want.
assign pat_bitwise_and=pattern_waddr & {20{pat_wr_en}};  //If the pattern write enable is active, then bitwise and returns the pattern write address

    
assign rect_bitwise_and=rect_waddr & {20{rect_wr_en}};  //Similar


assign line_bitwise_and=line_waddr & {20{line_wr_en}};

assign waddr=rect_bitwise_and |  pat_bitwise_and | line_bitwise_and;
                               //
assign pat_wr_bitwise_and=pat_wr_data & {8{pat_wr_en}};  //If the pattern write enable is active, then bitwise and returns the pattern write address
assign rect_wr_bitwise_and=rect_wr_data & {8{rect_wr_en}};
assign line_wr_bitwise_and=rect_wr_data & {8{line_wr_en}};
assign wr_data=rect_wr_bitwise_and | pat_wr_bitwise_and | line_wr_bitwise_and;
                //  


VRAM VRAM(
.clk(PixelClk),
.wr_en(pat_wr_en | rect_wr_en),
.waddr(waddr),
.wr_data(wr_data),
.rd_addr(rd_addr),
.rd_data(rd_data));

assign red={rd_data[7:5], 5'b1};
assign blue={rd_data[4:3], 6'b1};
assign green={rd_data[2:0], 5'b1};

assign rgbtodvi[23:16]=red;
assign rgbtodvi[15:8]=blue;
assign rgbtodvi[7:0]=green;

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

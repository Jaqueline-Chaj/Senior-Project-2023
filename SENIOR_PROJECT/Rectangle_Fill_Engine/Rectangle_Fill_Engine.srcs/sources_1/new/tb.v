`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/26/2024 02:17:37 PM
// Design Name: 
// Module Name: tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb(

    );
logic[23:0] foreground_color;
logic start_trigger;
logic clk, reset; 
logic[10:0] lft, rgt;
logic[9:0] top, bot;
logic[10:0] marx;
logic[9:0] mary;
logic wr_en; 
logic[7:0] pixel_val;

RectFill Rect(.clk(clk),
.reset(reset),
.foreground_color(foreground_color),
.start_trigger(start_trigger),
.lft(lft),
.rgt(rgt),
.top(top),
.bot(bot),
.marx(marx),
.mary(mary),
.wr_en(wr_en),
.pixel_val(pixel_val));

assign top=10'b0000001111;
assign lft=11'b00000001111;
assign bot=10'b01111111111;
assign rgt=11'b01111111111;


initial begin
#201 foreground_color=24'hFFFFFF;
#50 foreground_color=24'h000000;
#50 foreground_color=24'h00FFFF;
end 
    


int i=0;
initial begin
clk=1;
for(i=0; i<100000000; i=i+1) 
    #5 clk=~clk;
$finish;
end

initial begin
reset=0;
start_trigger=0;
#57 reset=1;
#57 reset=0;
#57 start_trigger=1;
#57 start_trigger=0;

end
endmodule

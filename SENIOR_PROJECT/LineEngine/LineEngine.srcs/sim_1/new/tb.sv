`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/01/2024 12:23:59 PM
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
    
    logic[19:0] waddr;
    logic start_trigger;
    logic clk, reset;
    logic[23:0] color;
    logic[10:0] x1, x2, y1, y2;
    logic line_wr_en;
    logic[7:0] line_wr_data;
    
    
initial begin
    clk=0;
forever #5 clk=~clk;
end

initial begin 
reset=1;
#57 reset=~reset;
end

initial begin
 start_trigger=0;
 #63  start_trigger=1; 
 #5 start_trigger=0; end
initial begin
 color=23'h000000;
x1=10;
y1=200;
x2=300;
y2=100;

end

LineEngine lineEng(.clk(clk),
.reset(reset),
.x1(x1),
.y1(y1),
.x2(x2),
.y2(y2),
.waddr(waddr),
.line_wr_data(line_wr_data),
.line_wr_en(line_wr_en),
.color(color),
.start_trigger(start_trigger));
endmodule

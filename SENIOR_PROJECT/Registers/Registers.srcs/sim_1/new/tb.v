`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2023 04:14:09 PM
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


module tb();
logic clk;
logic reset;
logic[3:0] addr;
logic[31:0] M_dat;
logic wr_en;
logic[10:0] reg_top_left_x;
logic[10:0] reg_top_left_y;
logic[10:0] reg_bot_right_x;
logic[10:0] reg_bot_right_y;
logic[23:0] fill_color;
logic[4:0] test_pat_mode;

assign wr_en=1;


Register register(.clk(clk),
.reset(reset),
.addr(addr),
.M_dat(M_dat),
.wr_en(wr_en),
.reg_top_left_x(reg_top_left_x),
.reg_top_left_y(reg_top_left_y),
.reg_bot_right_x(reg_bot_right_x),
.reg_bot_right_y(reg_bot_right_y),
.fill_color(fill_color),
.test_pat_mode(test_pat_mode));

int j=0;
initial begin
#105
M_dat=32'h00000001;
addr=4'b0000;
#50
M_dat=32'h00080000;
addr=4'b0000;
#50
M_dat=32'h000000FF;
addr=4'b0001;
#50
M_dat=32'h00F80000;
addr=4'b0001;
#50
M_dat=32'h0000000AA;
addr=4'b0010;
#50
M_dat=32'h00000001;
addr=4'b0111;


end

int i=0;
initial begin
clk=1;
for(i=0; i<1000000; i=i+1) 
    #5 clk=~clk;

end

initial begin
reset=0;
#101 reset=1;
end
    
endmodule

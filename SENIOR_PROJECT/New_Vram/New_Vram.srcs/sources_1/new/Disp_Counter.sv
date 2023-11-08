`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2023 11:39:45 PM
// Design Name: 
// Module Name: Disp_Counter
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


module Disp_Counter(
input logic clk, reset,
output logic[19:0] RD_addr);

logic[10:0] disp_x;
logic[9:0] disp_y;
always_ff@(posedge clk) begin
	if(reset)
		disp_x<=0;
	else if(disp_x<1279) 
			disp_x<=disp_x+1;
		else
			disp_x<=0;
    
end


always_ff@(posedge clk) begin
	if(reset)
		disp_y<=0;
	else if(disp_x<1279) begin
		  if(disp_y<719) 
			disp_y<=disp_y+1;
		else
			disp_y<=0;
		end
			

end
  
assign RD_addr={(disp_y)*5, 8'b0} +disp_x;  

endmodule

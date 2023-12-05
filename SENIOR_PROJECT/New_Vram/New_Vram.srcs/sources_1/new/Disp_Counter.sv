`timescale 1ns / 1ps


module Disp_Counter(
input logic clk, reset,
output logic[19:0] RD_addr

);

logic[10:0] disp_x;
logic[9:0] disp_y;
logic[12:0] prod;

always_ff@(posedge clk) begin
	if(reset)
		disp_x<=0;
	else if(disp_x<1649) 
			disp_x<=disp_x+1;
		else
			disp_x<=0;
    
end


always_ff@(posedge clk) begin
	if(reset)
		disp_y<=0;
	else if(disp_x==1649) begin
		  if(disp_y<749) 
			disp_y<=disp_y+1;
		else
			disp_y<=0;
		end
			

end

assign prod = disp_y * 5;
  
assign RD_addr= {prod, 8'b0} +disp_x;  

endmodule

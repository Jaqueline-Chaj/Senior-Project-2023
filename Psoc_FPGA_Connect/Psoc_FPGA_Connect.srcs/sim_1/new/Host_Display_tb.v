`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2024 12:52:37 PM
// Design Name: 
// Module Name: Host_Display_tb
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


module Host_Display_tb(

    );
logic clk, reset_n,psoc_reset_raw;
logic[7:0] host_hostif_d;
logic host_hostif_host_xfc_raw;  
logic host_hostif_fpga_xfc;
logic hdmi_tx_clk_p;
logic hdmi_tx_clk_n;
logic[2:0] hdmi_tx_p, hdmi_tx_n;  
    
    Host_to_Display_top Host(.clk(clk),
    .reset_n(reset_n),
    .psoc_reset_raw(psoc_reset_raw),
    .host_hostif_id(host_hostif_id),
    .host_hostif_host_xfc_raw(host_hostif_host_xfc_raw),
    .host_hostif_fpga_xfc(host_hostif_fpga_xfc),
    .hdmi_tx_clk_p(hdmi_tx_clk_p),
    .hdmi_tx_clk_n(hdmi_tx_clk_n),
    .hdmi_tx_p(hdmi_tx_p),
    .hdmi_tx_n(hdmi_tx_n) 
    );
 
logic[7:0] master_counter;
logic[7:0] addr_counter;
logic[7:0] data_counter;
  

 
 
 initial begin
 clk=0;
 forever #5 clk=~clk;
 end
 
 initial begin
 reset_n=0;
 psoc_reset_raw=1;
 #87 reset_n=1;
  psoc_reset_raw=0;
  end
endmodule

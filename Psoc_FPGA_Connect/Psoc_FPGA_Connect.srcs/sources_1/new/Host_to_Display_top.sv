`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/26/2024 01:25:00 PM
// Design Name: 
// Module Name: Host_to_Display_top
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


module Host_to_Display_top(
 input clk,
    input reset_n,
    input psoc_reset_raw,
    input [7:0] host_hostif_d,
    input host_hostif_host_xfc_raw,
    output logic host_hostif_fpga_xfc,
    output hdmi_tx_clk_p,

    output hdmi_tx_clk_n,

    output [2:0] hdmi_tx_p,

    output [2:0] hdmi_tx_n//,
    );
  logic reset;
  logic start_trigger;
  logic [10:0] reg_top_left_x; //lft
  logic [10:0] reg_top_left_y; //clk
  logic [10:0] reg_bot_right_x; //bot
  logic [10:0] reg_bot_right_y; //rgt
  logic[23:0] fill_color;
  //logic[3:0] engine_trigger;
  logic engine_rect_fill_trigger;
  logic engine_line_fill_trigger;
  //Initialize the Host interface
  
  logic PixelClk;
  
  
  
  clk_wiz_0 clk_wiz 
 (
  // Clock out ports
 .clk_out1(PixelClk),
  // Status and control signals
 .reset(~reset_n),
 // output   locked,
 // Clock in ports
  .clk_in1(clk)
 );
  
  
  
  
  
  
  
  TopLevelInterface Host(
  .clk(PixelClk),
  .reset_n(reset_n),
  .psoc_reset_raw(psoc_reset_raw),
  .host_hostif_d(host_hostif_d),
  .host_hostif_host_xfc_raw(host_hostif_host_xfc_raw),
  .host_hostif_fpga_xfc(host_hostif_fpga_xfc),
  .reset(reset),//output
  .reg_top_left_x(reg_top_left_x),
  .reg_top_left_y(reg_top_left_y),
  .reg_bot_right_x(reg_bot_right_x),
  .reg_bot_right_y(reg_bot_right_y),
  .fill_color(fill_color),
  .engine_rect_fill_trigger(engine_rect_fill_trigger),
  .engine_line_fill_trigger(engine_line_fill_trigger)
  );
  
  //Initialize the display generator
  Display_gen Display(.PixelClk(PixelClk),
  .reset(reset),
  .rect_start_trigger(engine_rect_fill_trigger),
  .line_start_trigger(engine_line_fill_trigger),
  .lft(reg_top_left_x),
  .top(reg_top_left_y),
  .rgt(reg_bot_right_x),
  .bot(reg_bot_right_y),
  .foreground_color(fill_color),
  .hdmi_tx_clk_p(hdmi_tx_clk_p),
  .hdmi_tx_clk_n(hdmi_tx_clk_n),
  .hdmi_tx_p(hdmi_tx_p),
  .hdmi_tx_n(hdmi_tx_n));

  
endmodule

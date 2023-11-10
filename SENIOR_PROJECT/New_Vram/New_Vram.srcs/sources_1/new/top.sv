`timescale 1ns / 1ps


module top(
input clk, cpu_resetn,

//input wr_en,
//input logic[19:0] Wr_addr,
//input logic[7:0] Wr_data,
output hdmi_tx_clk_p,

output hdmi_tx_clk_n,

output [2:0] hdmi_tx_p,

output [2:0] hdmi_tx_n
    );
logic[7:0] RD_data;
logic[7:0] red;
logic[7:0] blue;
logic[7:0] green;
logic[23:0] rgbtodvi;

assign red=RD_data[7:5];
assign blue=RD_data[4:2];
assign green=RD_data[1:0];

assign rgbtodvi[23:16]=red;
assign rgbtodvi[15:8]=blue;
assign rgbtodvi[7:0]=green;
logic[19:0] RD_addr;

Disp_Counter Disp(
.clk(clk),
.reset(~cpu_resetn),
.RD_addr(RD_addr)
);

VRAM VRAM(
.clk(clk),
.RD_addr(RD_addr),
.RD_Data(RD_data));

Display_Gen_Digilent Display_Gen(
.clk(clk),
.cpu_resetn(cpu_resetn),
.rgbtodvi(rgbtodvi),
.hdmi_tx_clk_n(hdmi_tx_clk_n),
.hdmi_tx_clk_p(hdmi_tx_clk_p),
.hdmi_tx_n(hdmi_tx_n),
.hdmi_tx_p(hdmi_tx_p)

);

endmodule

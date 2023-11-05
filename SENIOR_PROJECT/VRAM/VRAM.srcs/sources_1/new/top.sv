`timescale 1ns / 1ps


module top(
input clk, reset,
//input wr_en,
//input logic[19:0] Wr_addr,
//input logic[7:0] Wr_data,
output logic[7:0] RD_data
    );

logic[19:0] RD_addr;

Disp_Counter Disp(
.clk(clk),
.reset(reset),
.RD_addr(RD_addr)
);

VRAM VRAM(
.clk(clk),
.RD_addr(RD_addr),
.RD_Data(RD_data));





endmodule
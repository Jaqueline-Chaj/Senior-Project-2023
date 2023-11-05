`timescale 1ns / 1ps


module top(
input clk, reset,
//input wr_en,
//input logic[19:0] Wr_addr,
//input logic[7:0] Wr_data,
output logic[23:0] rbgtodvi
    );
logic[7:0] RD_data;
logic[2:0] red;
logic[2:0] blue;
logic[1:0] green;

assign red=RD_data[7:5];
assign blue=RD_data[4:2];
assign green=RD_data[1:0];

assign rbgtodvi[23:16]={(red),5'b0};
assign rbgtodvi[15:8]={(blue),5'b0};
assign rbgtodvi[7:0]={(green),6'b0};

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

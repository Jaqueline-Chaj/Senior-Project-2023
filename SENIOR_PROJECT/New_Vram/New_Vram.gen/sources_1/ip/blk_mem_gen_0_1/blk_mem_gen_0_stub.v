// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
// Date        : Sun Nov  5 14:59:01 2023
// Host        : ARM144-10 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               h:/Senior-Project-2023/SENIOR_PROJECT/New_Vram/New_Vram.gen/sources_1/ip/blk_mem_gen_0_1/blk_mem_gen_0_stub.v
// Design      : blk_mem_gen_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tsbg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2021.2" *)
module blk_mem_gen_0(clka, wea, addra, dina, clkb, addrb, doutb)
/* synthesis syn_black_box black_box_pad_pin="clka,wea[0:0],addra[19:0],dina[7:0],clkb,addrb[19:0],doutb[7:0]" */;
  input clka;
  input [0:0]wea;
  input [19:0]addra;
  input [7:0]dina;
  input clkb;
  input [19:0]addrb;
  output [7:0]doutb;
endmodule
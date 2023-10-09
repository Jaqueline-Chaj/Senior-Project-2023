// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
// Date        : Mon Oct  9 15:57:51 2023
// Host        : ARM144-11 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               h:/Senior-Project-2023/SENIOR_PROJECT/HDMI_Block/HDMI_Block.gen/sources_1/ip/HDMI_transmitter/HDMI_transmitter_stub.v
// Design      : HDMI_transmitter
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tfgg484-2L
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "bd_5fd0,Vivado 2021.2" *)
module HDMI_transmitter(s_axi_cpu_aclk, s_axi_cpu_aresetn, link_clk, 
  s_axis_audio_aclk, s_axis_audio_aresetn, acr_cts, acr_n, acr_valid, hpd, irq, video_clk, 
  video_rst, NATIVE_VID_IN_active_video, NATIVE_VID_IN_data, NATIVE_VID_IN_hsync, 
  NATIVE_VID_IN_vsync, SB_STATUS_IN_tdata, SB_STATUS_IN_tvalid, AUDIO_IN_tdata, 
  AUDIO_IN_tid, AUDIO_IN_tready, AUDIO_IN_tvalid, S_AXI_CPU_IN_araddr, S_AXI_CPU_IN_arprot, 
  S_AXI_CPU_IN_arready, S_AXI_CPU_IN_arvalid, S_AXI_CPU_IN_awaddr, S_AXI_CPU_IN_awprot, 
  S_AXI_CPU_IN_awready, S_AXI_CPU_IN_awvalid, S_AXI_CPU_IN_bready, S_AXI_CPU_IN_bresp, 
  S_AXI_CPU_IN_bvalid, S_AXI_CPU_IN_rdata, S_AXI_CPU_IN_rready, S_AXI_CPU_IN_rresp, 
  S_AXI_CPU_IN_rvalid, S_AXI_CPU_IN_wdata, S_AXI_CPU_IN_wready, S_AXI_CPU_IN_wstrb, 
  S_AXI_CPU_IN_wvalid, DDC_OUT_scl_i, DDC_OUT_scl_o, DDC_OUT_scl_t, DDC_OUT_sda_i, 
  DDC_OUT_sda_o, DDC_OUT_sda_t, LINK_DATA0_OUT_tdata, LINK_DATA0_OUT_tvalid, 
  LINK_DATA1_OUT_tdata, LINK_DATA1_OUT_tvalid, LINK_DATA2_OUT_tdata, 
  LINK_DATA2_OUT_tvalid)
/* synthesis syn_black_box black_box_pad_pin="s_axi_cpu_aclk,s_axi_cpu_aresetn,link_clk,s_axis_audio_aclk,s_axis_audio_aresetn,acr_cts[19:0],acr_n[19:0],acr_valid,hpd,irq,video_clk,video_rst,NATIVE_VID_IN_active_video,NATIVE_VID_IN_data[47:0],NATIVE_VID_IN_hsync,NATIVE_VID_IN_vsync,SB_STATUS_IN_tdata[1:0],SB_STATUS_IN_tvalid,AUDIO_IN_tdata[31:0],AUDIO_IN_tid[7:0],AUDIO_IN_tready,AUDIO_IN_tvalid,S_AXI_CPU_IN_araddr[8:0],S_AXI_CPU_IN_arprot[2:0],S_AXI_CPU_IN_arready,S_AXI_CPU_IN_arvalid,S_AXI_CPU_IN_awaddr[8:0],S_AXI_CPU_IN_awprot[2:0],S_AXI_CPU_IN_awready,S_AXI_CPU_IN_awvalid,S_AXI_CPU_IN_bready,S_AXI_CPU_IN_bresp[1:0],S_AXI_CPU_IN_bvalid,S_AXI_CPU_IN_rdata[31:0],S_AXI_CPU_IN_rready,S_AXI_CPU_IN_rresp[1:0],S_AXI_CPU_IN_rvalid,S_AXI_CPU_IN_wdata[31:0],S_AXI_CPU_IN_wready,S_AXI_CPU_IN_wstrb[3:0],S_AXI_CPU_IN_wvalid,DDC_OUT_scl_i,DDC_OUT_scl_o,DDC_OUT_scl_t,DDC_OUT_sda_i,DDC_OUT_sda_o,DDC_OUT_sda_t,LINK_DATA0_OUT_tdata[19:0],LINK_DATA0_OUT_tvalid,LINK_DATA1_OUT_tdata[19:0],LINK_DATA1_OUT_tvalid,LINK_DATA2_OUT_tdata[19:0],LINK_DATA2_OUT_tvalid" */;
  input s_axi_cpu_aclk;
  input s_axi_cpu_aresetn;
  input link_clk;
  input s_axis_audio_aclk;
  input s_axis_audio_aresetn;
  input [19:0]acr_cts;
  input [19:0]acr_n;
  input acr_valid;
  input hpd;
  output irq;
  input video_clk;
  output video_rst;
  input NATIVE_VID_IN_active_video;
  input [47:0]NATIVE_VID_IN_data;
  input NATIVE_VID_IN_hsync;
  input NATIVE_VID_IN_vsync;
  input [1:0]SB_STATUS_IN_tdata;
  input SB_STATUS_IN_tvalid;
  input [31:0]AUDIO_IN_tdata;
  input [7:0]AUDIO_IN_tid;
  output AUDIO_IN_tready;
  input AUDIO_IN_tvalid;
  input [8:0]S_AXI_CPU_IN_araddr;
  input [2:0]S_AXI_CPU_IN_arprot;
  output S_AXI_CPU_IN_arready;
  input S_AXI_CPU_IN_arvalid;
  input [8:0]S_AXI_CPU_IN_awaddr;
  input [2:0]S_AXI_CPU_IN_awprot;
  output S_AXI_CPU_IN_awready;
  input S_AXI_CPU_IN_awvalid;
  input S_AXI_CPU_IN_bready;
  output [1:0]S_AXI_CPU_IN_bresp;
  output S_AXI_CPU_IN_bvalid;
  output [31:0]S_AXI_CPU_IN_rdata;
  input S_AXI_CPU_IN_rready;
  output [1:0]S_AXI_CPU_IN_rresp;
  output S_AXI_CPU_IN_rvalid;
  input [31:0]S_AXI_CPU_IN_wdata;
  output S_AXI_CPU_IN_wready;
  input [3:0]S_AXI_CPU_IN_wstrb;
  input S_AXI_CPU_IN_wvalid;
  input DDC_OUT_scl_i;
  output DDC_OUT_scl_o;
  output DDC_OUT_scl_t;
  input DDC_OUT_sda_i;
  output DDC_OUT_sda_o;
  output DDC_OUT_sda_t;
  output [19:0]LINK_DATA0_OUT_tdata;
  output LINK_DATA0_OUT_tvalid;
  output [19:0]LINK_DATA1_OUT_tdata;
  output LINK_DATA1_OUT_tvalid;
  output [19:0]LINK_DATA2_OUT_tdata;
  output LINK_DATA2_OUT_tvalid;
endmodule

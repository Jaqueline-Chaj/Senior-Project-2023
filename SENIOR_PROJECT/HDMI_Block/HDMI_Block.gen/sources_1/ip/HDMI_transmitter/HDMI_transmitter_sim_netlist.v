// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
// Date        : Sun Sep 17 18:06:26 2023
// Host        : ARM144-12 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim {h:/Users/leopole1/HDMI IP TEST/HDMI IP
//               TEST.gen/sources_1/ip/HDMI_transmitter/HDMI_transmitter_sim_netlist.v}
// Design      : HDMI_transmitter
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tfgg484-2L
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "HDMI_transmitter,bd_5fd0,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "bd_5fd0,Vivado 2021.2" *) 
(* NotValidForBitStream *)
module HDMI_transmitter
   (s_axi_cpu_aclk,
    s_axi_cpu_aresetn,
    link_clk,
    s_axis_audio_aclk,
    s_axis_audio_aresetn,
    acr_cts,
    acr_n,
    acr_valid,
    hpd,
    irq,
    video_clk,
    video_rst,
    NATIVE_VID_IN_active_video,
    NATIVE_VID_IN_data,
    NATIVE_VID_IN_hsync,
    NATIVE_VID_IN_vsync,
    SB_STATUS_IN_tdata,
    SB_STATUS_IN_tvalid,
    AUDIO_IN_tdata,
    AUDIO_IN_tid,
    AUDIO_IN_tready,
    AUDIO_IN_tvalid,
    S_AXI_CPU_IN_araddr,
    S_AXI_CPU_IN_arprot,
    S_AXI_CPU_IN_arready,
    S_AXI_CPU_IN_arvalid,
    S_AXI_CPU_IN_awaddr,
    S_AXI_CPU_IN_awprot,
    S_AXI_CPU_IN_awready,
    S_AXI_CPU_IN_awvalid,
    S_AXI_CPU_IN_bready,
    S_AXI_CPU_IN_bresp,
    S_AXI_CPU_IN_bvalid,
    S_AXI_CPU_IN_rdata,
    S_AXI_CPU_IN_rready,
    S_AXI_CPU_IN_rresp,
    S_AXI_CPU_IN_rvalid,
    S_AXI_CPU_IN_wdata,
    S_AXI_CPU_IN_wready,
    S_AXI_CPU_IN_wstrb,
    S_AXI_CPU_IN_wvalid,
    DDC_OUT_scl_i,
    DDC_OUT_scl_o,
    DDC_OUT_scl_t,
    DDC_OUT_sda_i,
    DDC_OUT_sda_o,
    DDC_OUT_sda_t,
    LINK_DATA0_OUT_tdata,
    LINK_DATA0_OUT_tvalid,
    LINK_DATA1_OUT_tdata,
    LINK_DATA1_OUT_tvalid,
    LINK_DATA2_OUT_tdata,
    LINK_DATA2_OUT_tvalid);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.s_axi_cpu_aclk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.s_axi_cpu_aclk, FREQ_HZ 200000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN bd_5fd0_s_axi_cpu_aclk, ASSOCIATED_BUSIF SB_STATUS_IN:S_AXI_CPU_IN, ASSOCIATED_RESET s_axi_cpu_aresetn, INSERT_VIP 0" *) input s_axi_cpu_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.s_axi_cpu_aresetn RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.s_axi_cpu_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input s_axi_cpu_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.link_clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.link_clk, FREQ_HZ 74250000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN bd_5fd0_link_clk, ASSOCIATED_BUSIF LINK_DATA0_OUT:LINK_DATA1_OUT:LINK_DATA2_OUT, INSERT_VIP 0" *) input link_clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.s_axis_audio_aclk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.s_axis_audio_aclk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN bd_5fd0_s_axis_audio_aclk, ASSOCIATED_BUSIF AUDIO_IN, ASSOCIATED_RESET s_axis_audio_aresetn, INSERT_VIP 0" *) input s_axis_audio_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.s_axis_audio_aresetn RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.s_axis_audio_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input s_axis_audio_aresetn;
  input [19:0]acr_cts;
  input [19:0]acr_n;
  input acr_valid;
  input hpd;
  (* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 INTR.irq INTERRUPT" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME INTR.irq, SENSITIVITY LEVEL_HIGH, PortWidth 1" *) output irq;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.video_clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.video_clk, FREQ_HZ 148500000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN bd_5fd0_video_clk, ASSOCIATED_BUSIF NATIVE_VID_IN, INSERT_VIP 0" *) input video_clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.video_rst RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.video_rst, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) output video_rst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 NATIVE_VID_IN ACTIVE_VIDEO" *) input NATIVE_VID_IN_active_video;
  (* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 NATIVE_VID_IN DATA" *) input [47:0]NATIVE_VID_IN_data;
  (* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 NATIVE_VID_IN HSYNC" *) input NATIVE_VID_IN_hsync;
  (* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 NATIVE_VID_IN VSYNC" *) input NATIVE_VID_IN_vsync;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SB_STATUS_IN TDATA" *) input [1:0]SB_STATUS_IN_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SB_STATUS_IN TVALID" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME SB_STATUS_IN, TDATA_NUM_BYTES 0, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 0, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 200000000, PHASE 0.0, CLK_DOMAIN bd_5fd0_s_axi_cpu_aclk, LAYERED_METADATA undef, INSERT_VIP 0" *) input SB_STATUS_IN_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 AUDIO_IN TDATA" *) input [31:0]AUDIO_IN_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 AUDIO_IN TID" *) input [7:0]AUDIO_IN_tid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 AUDIO_IN TREADY" *) output AUDIO_IN_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 AUDIO_IN TVALID" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME AUDIO_IN, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 8, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN bd_5fd0_s_axis_audio_aclk, LAYERED_METADATA undef, INSERT_VIP 0" *) input AUDIO_IN_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN ARADDR" *) input [8:0]S_AXI_CPU_IN_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN ARPROT" *) input [2:0]S_AXI_CPU_IN_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN ARREADY" *) output S_AXI_CPU_IN_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN ARVALID" *) input S_AXI_CPU_IN_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN AWADDR" *) input [8:0]S_AXI_CPU_IN_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN AWPROT" *) input [2:0]S_AXI_CPU_IN_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN AWREADY" *) output S_AXI_CPU_IN_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN AWVALID" *) input S_AXI_CPU_IN_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN BREADY" *) input S_AXI_CPU_IN_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN BRESP" *) output [1:0]S_AXI_CPU_IN_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN BVALID" *) output S_AXI_CPU_IN_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN RDATA" *) output [31:0]S_AXI_CPU_IN_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN RREADY" *) input S_AXI_CPU_IN_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN RRESP" *) output [1:0]S_AXI_CPU_IN_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN RVALID" *) output S_AXI_CPU_IN_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN WDATA" *) input [31:0]S_AXI_CPU_IN_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN WREADY" *) output S_AXI_CPU_IN_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN WSTRB" *) input [3:0]S_AXI_CPU_IN_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN WVALID" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXI_CPU_IN, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 200000000, ID_WIDTH 0, ADDR_WIDTH 9, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN bd_5fd0_s_axi_cpu_aclk, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input S_AXI_CPU_IN_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 DDC_OUT SCL_I" *) input DDC_OUT_scl_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 DDC_OUT SCL_O" *) output DDC_OUT_scl_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 DDC_OUT SCL_T" *) output DDC_OUT_scl_t;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 DDC_OUT SDA_I" *) input DDC_OUT_sda_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 DDC_OUT SDA_O" *) output DDC_OUT_sda_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 DDC_OUT SDA_T" *) output DDC_OUT_sda_t;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 LINK_DATA0_OUT TDATA" *) output [19:0]LINK_DATA0_OUT_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 LINK_DATA0_OUT TVALID" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME LINK_DATA0_OUT, TDATA_NUM_BYTES 2, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 0, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 74250000, PHASE 0.0, CLK_DOMAIN bd_5fd0_link_clk, LAYERED_METADATA undef, INSERT_VIP 0" *) output LINK_DATA0_OUT_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 LINK_DATA1_OUT TDATA" *) output [19:0]LINK_DATA1_OUT_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 LINK_DATA1_OUT TVALID" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME LINK_DATA1_OUT, TDATA_NUM_BYTES 2, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 0, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 74250000, PHASE 0.0, CLK_DOMAIN bd_5fd0_link_clk, LAYERED_METADATA undef, INSERT_VIP 0" *) output LINK_DATA1_OUT_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 LINK_DATA2_OUT TDATA" *) output [19:0]LINK_DATA2_OUT_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 LINK_DATA2_OUT TVALID" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME LINK_DATA2_OUT, TDATA_NUM_BYTES 2, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 0, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 74250000, PHASE 0.0, CLK_DOMAIN bd_5fd0_link_clk, LAYERED_METADATA undef, INSERT_VIP 0" *) output LINK_DATA2_OUT_tvalid;

  wire [31:0]AUDIO_IN_tdata;
  wire [7:0]AUDIO_IN_tid;
  wire AUDIO_IN_tready;
  wire AUDIO_IN_tvalid;
  wire DDC_OUT_scl_i;
  wire DDC_OUT_scl_o;
  wire DDC_OUT_scl_t;
  wire DDC_OUT_sda_i;
  wire DDC_OUT_sda_o;
  wire DDC_OUT_sda_t;
  wire [19:0]LINK_DATA0_OUT_tdata;
  wire LINK_DATA0_OUT_tvalid;
  wire [19:0]LINK_DATA1_OUT_tdata;
  wire LINK_DATA1_OUT_tvalid;
  wire [19:0]LINK_DATA2_OUT_tdata;
  wire LINK_DATA2_OUT_tvalid;
  wire NATIVE_VID_IN_active_video;
  wire [47:0]NATIVE_VID_IN_data;
  wire NATIVE_VID_IN_hsync;
  wire NATIVE_VID_IN_vsync;
  wire [1:0]SB_STATUS_IN_tdata;
  wire SB_STATUS_IN_tvalid;
  wire [8:0]S_AXI_CPU_IN_araddr;
  wire [2:0]S_AXI_CPU_IN_arprot;
  wire S_AXI_CPU_IN_arready;
  wire S_AXI_CPU_IN_arvalid;
  wire [8:0]S_AXI_CPU_IN_awaddr;
  wire [2:0]S_AXI_CPU_IN_awprot;
  wire S_AXI_CPU_IN_awready;
  wire S_AXI_CPU_IN_awvalid;
  wire S_AXI_CPU_IN_bready;
  wire [1:0]S_AXI_CPU_IN_bresp;
  wire S_AXI_CPU_IN_bvalid;
  wire [31:0]S_AXI_CPU_IN_rdata;
  wire S_AXI_CPU_IN_rready;
  wire [1:0]S_AXI_CPU_IN_rresp;
  wire S_AXI_CPU_IN_rvalid;
  wire [31:0]S_AXI_CPU_IN_wdata;
  wire S_AXI_CPU_IN_wready;
  wire [3:0]S_AXI_CPU_IN_wstrb;
  wire S_AXI_CPU_IN_wvalid;
  wire [19:0]acr_cts;
  wire [19:0]acr_n;
  wire acr_valid;
  wire hpd;
  wire irq;
  wire link_clk;
  wire s_axi_cpu_aclk;
  wire s_axi_cpu_aresetn;
  wire s_axis_audio_aclk;
  wire s_axis_audio_aresetn;
  wire video_clk;
  wire video_rst;

  (* HW_HANDOFF = "HDMI_transmitter.hwdef" *) 
  HDMI_transmitter_bd_5fd0 inst
       (.AUDIO_IN_tdata(AUDIO_IN_tdata),
        .AUDIO_IN_tid(AUDIO_IN_tid),
        .AUDIO_IN_tready(AUDIO_IN_tready),
        .AUDIO_IN_tvalid(AUDIO_IN_tvalid),
        .DDC_OUT_scl_i(DDC_OUT_scl_i),
        .DDC_OUT_scl_o(DDC_OUT_scl_o),
        .DDC_OUT_scl_t(DDC_OUT_scl_t),
        .DDC_OUT_sda_i(DDC_OUT_sda_i),
        .DDC_OUT_sda_o(DDC_OUT_sda_o),
        .DDC_OUT_sda_t(DDC_OUT_sda_t),
        .LINK_DATA0_OUT_tdata(LINK_DATA0_OUT_tdata),
        .LINK_DATA0_OUT_tvalid(LINK_DATA0_OUT_tvalid),
        .LINK_DATA1_OUT_tdata(LINK_DATA1_OUT_tdata),
        .LINK_DATA1_OUT_tvalid(LINK_DATA1_OUT_tvalid),
        .LINK_DATA2_OUT_tdata(LINK_DATA2_OUT_tdata),
        .LINK_DATA2_OUT_tvalid(LINK_DATA2_OUT_tvalid),
        .NATIVE_VID_IN_active_video(NATIVE_VID_IN_active_video),
        .NATIVE_VID_IN_data(NATIVE_VID_IN_data),
        .NATIVE_VID_IN_hsync(NATIVE_VID_IN_hsync),
        .NATIVE_VID_IN_vsync(NATIVE_VID_IN_vsync),
        .SB_STATUS_IN_tdata(SB_STATUS_IN_tdata),
        .SB_STATUS_IN_tvalid(SB_STATUS_IN_tvalid),
        .S_AXI_CPU_IN_araddr(S_AXI_CPU_IN_araddr),
        .S_AXI_CPU_IN_arprot(S_AXI_CPU_IN_arprot),
        .S_AXI_CPU_IN_arready(S_AXI_CPU_IN_arready),
        .S_AXI_CPU_IN_arvalid(S_AXI_CPU_IN_arvalid),
        .S_AXI_CPU_IN_awaddr(S_AXI_CPU_IN_awaddr),
        .S_AXI_CPU_IN_awprot(S_AXI_CPU_IN_awprot),
        .S_AXI_CPU_IN_awready(S_AXI_CPU_IN_awready),
        .S_AXI_CPU_IN_awvalid(S_AXI_CPU_IN_awvalid),
        .S_AXI_CPU_IN_bready(S_AXI_CPU_IN_bready),
        .S_AXI_CPU_IN_bresp(S_AXI_CPU_IN_bresp),
        .S_AXI_CPU_IN_bvalid(S_AXI_CPU_IN_bvalid),
        .S_AXI_CPU_IN_rdata(S_AXI_CPU_IN_rdata),
        .S_AXI_CPU_IN_rready(S_AXI_CPU_IN_rready),
        .S_AXI_CPU_IN_rresp(S_AXI_CPU_IN_rresp),
        .S_AXI_CPU_IN_rvalid(S_AXI_CPU_IN_rvalid),
        .S_AXI_CPU_IN_wdata(S_AXI_CPU_IN_wdata),
        .S_AXI_CPU_IN_wready(S_AXI_CPU_IN_wready),
        .S_AXI_CPU_IN_wstrb(S_AXI_CPU_IN_wstrb),
        .S_AXI_CPU_IN_wvalid(S_AXI_CPU_IN_wvalid),
        .acr_cts(acr_cts),
        .acr_n(acr_n),
        .acr_valid(acr_valid),
        .hpd(hpd),
        .irq(irq),
        .link_clk(link_clk),
        .s_axi_cpu_aclk(s_axi_cpu_aclk),
        .s_axi_cpu_aresetn(s_axi_cpu_aresetn),
        .s_axis_audio_aclk(s_axis_audio_aclk),
        .s_axis_audio_aresetn(s_axis_audio_aresetn),
        .video_clk(video_clk),
        .video_rst(video_rst));
endmodule

(* HW_HANDOFF = "HDMI_transmitter.hwdef" *) (* ORIG_REF_NAME = "bd_5fd0" *) 
module HDMI_transmitter_bd_5fd0
   (AUDIO_IN_tdata,
    AUDIO_IN_tid,
    AUDIO_IN_tready,
    AUDIO_IN_tvalid,
    DDC_OUT_scl_i,
    DDC_OUT_scl_o,
    DDC_OUT_scl_t,
    DDC_OUT_sda_i,
    DDC_OUT_sda_o,
    DDC_OUT_sda_t,
    LINK_DATA0_OUT_tdata,
    LINK_DATA0_OUT_tvalid,
    LINK_DATA1_OUT_tdata,
    LINK_DATA1_OUT_tvalid,
    LINK_DATA2_OUT_tdata,
    LINK_DATA2_OUT_tvalid,
    NATIVE_VID_IN_active_video,
    NATIVE_VID_IN_data,
    NATIVE_VID_IN_hsync,
    NATIVE_VID_IN_vsync,
    SB_STATUS_IN_tdata,
    SB_STATUS_IN_tvalid,
    S_AXI_CPU_IN_araddr,
    S_AXI_CPU_IN_arprot,
    S_AXI_CPU_IN_arready,
    S_AXI_CPU_IN_arvalid,
    S_AXI_CPU_IN_awaddr,
    S_AXI_CPU_IN_awprot,
    S_AXI_CPU_IN_awready,
    S_AXI_CPU_IN_awvalid,
    S_AXI_CPU_IN_bready,
    S_AXI_CPU_IN_bresp,
    S_AXI_CPU_IN_bvalid,
    S_AXI_CPU_IN_rdata,
    S_AXI_CPU_IN_rready,
    S_AXI_CPU_IN_rresp,
    S_AXI_CPU_IN_rvalid,
    S_AXI_CPU_IN_wdata,
    S_AXI_CPU_IN_wready,
    S_AXI_CPU_IN_wstrb,
    S_AXI_CPU_IN_wvalid,
    acr_cts,
    acr_n,
    acr_valid,
    hpd,
    irq,
    link_clk,
    s_axi_cpu_aclk,
    s_axi_cpu_aresetn,
    s_axis_audio_aclk,
    s_axis_audio_aresetn,
    video_clk,
    video_rst);
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 AUDIO_IN TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME AUDIO_IN, CLK_DOMAIN bd_5fd0_s_axis_audio_aclk, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 8, TUSER_WIDTH 0" *) input [31:0]AUDIO_IN_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 AUDIO_IN TID" *) input [7:0]AUDIO_IN_tid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 AUDIO_IN TREADY" *) output AUDIO_IN_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 AUDIO_IN TVALID" *) input AUDIO_IN_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 DDC_OUT SCL_I" *) input DDC_OUT_scl_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 DDC_OUT SCL_O" *) output DDC_OUT_scl_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 DDC_OUT SCL_T" *) output DDC_OUT_scl_t;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 DDC_OUT SDA_I" *) input DDC_OUT_sda_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 DDC_OUT SDA_O" *) output DDC_OUT_sda_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 DDC_OUT SDA_T" *) output DDC_OUT_sda_t;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 LINK_DATA0_OUT TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME LINK_DATA0_OUT, CLK_DOMAIN bd_5fd0_link_clk, FREQ_HZ 74250000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 0, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 2, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) output [19:0]LINK_DATA0_OUT_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 LINK_DATA0_OUT TVALID" *) output LINK_DATA0_OUT_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 LINK_DATA1_OUT TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME LINK_DATA1_OUT, CLK_DOMAIN bd_5fd0_link_clk, FREQ_HZ 74250000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 0, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 2, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) output [19:0]LINK_DATA1_OUT_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 LINK_DATA1_OUT TVALID" *) output LINK_DATA1_OUT_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 LINK_DATA2_OUT TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME LINK_DATA2_OUT, CLK_DOMAIN bd_5fd0_link_clk, FREQ_HZ 74250000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 0, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 2, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) output [19:0]LINK_DATA2_OUT_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 LINK_DATA2_OUT TVALID" *) output LINK_DATA2_OUT_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 NATIVE_VID_IN ACTIVE_VIDEO" *) input NATIVE_VID_IN_active_video;
  (* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 NATIVE_VID_IN DATA" *) input [47:0]NATIVE_VID_IN_data;
  (* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 NATIVE_VID_IN HSYNC" *) input NATIVE_VID_IN_hsync;
  (* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 NATIVE_VID_IN VSYNC" *) input NATIVE_VID_IN_vsync;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SB_STATUS_IN TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME SB_STATUS_IN, CLK_DOMAIN bd_5fd0_s_axi_cpu_aclk, FREQ_HZ 200000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 0, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 0, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) input [1:0]SB_STATUS_IN_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SB_STATUS_IN TVALID" *) input SB_STATUS_IN_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN ARADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXI_CPU_IN, ADDR_WIDTH 16, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN bd_5fd0_s_axi_cpu_aclk, DATA_WIDTH 32, FREQ_HZ 200000000, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 1, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 1, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 1, NUM_WRITE_THREADS 1, PHASE 0.0, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) input [8:0]S_AXI_CPU_IN_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN ARPROT" *) input [2:0]S_AXI_CPU_IN_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN ARREADY" *) output S_AXI_CPU_IN_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN ARVALID" *) input S_AXI_CPU_IN_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN AWADDR" *) input [8:0]S_AXI_CPU_IN_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN AWPROT" *) input [2:0]S_AXI_CPU_IN_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN AWREADY" *) output S_AXI_CPU_IN_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN AWVALID" *) input S_AXI_CPU_IN_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN BREADY" *) input S_AXI_CPU_IN_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN BRESP" *) output [1:0]S_AXI_CPU_IN_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN BVALID" *) output S_AXI_CPU_IN_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN RDATA" *) output [31:0]S_AXI_CPU_IN_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN RREADY" *) input S_AXI_CPU_IN_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN RRESP" *) output [1:0]S_AXI_CPU_IN_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN RVALID" *) output S_AXI_CPU_IN_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN WDATA" *) input [31:0]S_AXI_CPU_IN_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN WREADY" *) output S_AXI_CPU_IN_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN WSTRB" *) input [3:0]S_AXI_CPU_IN_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN WVALID" *) input S_AXI_CPU_IN_wvalid;
  input [19:0]acr_cts;
  input [19:0]acr_n;
  input acr_valid;
  input hpd;
  (* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 INTR.IRQ INTERRUPT" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME INTR.IRQ, PortWidth 1, SENSITIVITY LEVEL_HIGH" *) output irq;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.LINK_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.LINK_CLK, ASSOCIATED_BUSIF LINK_DATA0_OUT:LINK_DATA1_OUT:LINK_DATA2_OUT, CLK_DOMAIN bd_5fd0_link_clk, FREQ_HZ 74250000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input link_clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.S_AXI_CPU_ACLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.S_AXI_CPU_ACLK, ASSOCIATED_BUSIF SB_STATUS_IN:S_AXI_CPU_IN, ASSOCIATED_RESET s_axi_cpu_aresetn, CLK_DOMAIN bd_5fd0_s_axi_cpu_aclk, FREQ_HZ 200000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input s_axi_cpu_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.S_AXI_CPU_ARESETN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.S_AXI_CPU_ARESETN, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input s_axi_cpu_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.S_AXIS_AUDIO_ACLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.S_AXIS_AUDIO_ACLK, ASSOCIATED_BUSIF AUDIO_IN, ASSOCIATED_RESET s_axis_audio_aresetn, CLK_DOMAIN bd_5fd0_s_axis_audio_aclk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input s_axis_audio_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.S_AXIS_AUDIO_ARESETN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.S_AXIS_AUDIO_ARESETN, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input s_axis_audio_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.VIDEO_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.VIDEO_CLK, ASSOCIATED_BUSIF NATIVE_VID_IN, CLK_DOMAIN bd_5fd0_video_clk, FREQ_HZ 148500000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input video_clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.VIDEO_RST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.VIDEO_RST, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) output video_rst;

  wire [31:0]AUDIO_IN_tdata;
  wire [7:0]AUDIO_IN_tid;
  wire AUDIO_IN_tready;
  wire AUDIO_IN_tvalid;
  wire DDC_OUT_scl_i;
  wire DDC_OUT_scl_o;
  wire DDC_OUT_scl_t;
  wire DDC_OUT_sda_i;
  wire DDC_OUT_sda_o;
  wire DDC_OUT_sda_t;
  wire [19:0]LINK_DATA0_OUT_tdata;
  wire LINK_DATA0_OUT_tvalid;
  wire [19:0]LINK_DATA1_OUT_tdata;
  wire LINK_DATA1_OUT_tvalid;
  wire [19:0]LINK_DATA2_OUT_tdata;
  wire LINK_DATA2_OUT_tvalid;
  wire NATIVE_VID_IN_active_video;
  wire [47:0]NATIVE_VID_IN_data;
  wire NATIVE_VID_IN_hsync;
  wire NATIVE_VID_IN_vsync;
  wire [1:0]SB_STATUS_IN_tdata;
  wire SB_STATUS_IN_tvalid;
  wire [8:0]S_AXI_CPU_IN_araddr;
  wire [2:0]S_AXI_CPU_IN_arprot;
  wire S_AXI_CPU_IN_arready;
  wire S_AXI_CPU_IN_arvalid;
  wire [8:0]S_AXI_CPU_IN_awaddr;
  wire [2:0]S_AXI_CPU_IN_awprot;
  wire S_AXI_CPU_IN_awready;
  wire S_AXI_CPU_IN_awvalid;
  wire S_AXI_CPU_IN_bready;
  wire [1:0]S_AXI_CPU_IN_bresp;
  wire S_AXI_CPU_IN_bvalid;
  wire [31:0]S_AXI_CPU_IN_rdata;
  wire S_AXI_CPU_IN_rready;
  wire [1:0]S_AXI_CPU_IN_rresp;
  wire S_AXI_CPU_IN_rvalid;
  wire [31:0]S_AXI_CPU_IN_wdata;
  wire S_AXI_CPU_IN_wready;
  wire [3:0]S_AXI_CPU_IN_wstrb;
  wire S_AXI_CPU_IN_wvalid;
  wire [19:0]acr_cts;
  wire [19:0]acr_n;
  wire acr_valid;
  wire hpd;
  wire [95:0]intf_net_v_hdmi_tx_hdcp_out_TDATA;
  wire intf_net_v_hdmi_tx_hdcp_out_TID;
  wire intf_net_v_hdmi_tx_hdcp_out_TLAST;
  wire intf_net_v_hdmi_tx_hdcp_out_TREADY;
  wire [3:0]intf_net_v_hdmi_tx_hdcp_out_TSTRB;
  wire [31:0]intf_net_v_hdmi_tx_hdcp_out_TUSER;
  wire intf_net_v_hdmi_tx_hdcp_out_TVALID;
  wire irq;
  wire link_clk;
  wire s_axi_cpu_aclk;
  wire s_axi_cpu_aresetn;
  wire s_axis_audio_aclk;
  wire s_axis_audio_aresetn;
  wire video_clk;
  wire video_rst;
  wire NLW_v_hdmi_tx_bridge_pixel_repeat_UNCONNECTED;
  wire NLW_v_hdmi_tx_bridge_yuv420_UNCONNECTED;
  wire NLW_v_hdmi_tx_m_axis_hdcp_aclk_UNCONNECTED;
  wire NLW_v_hdmi_tx_m_axis_hdcp_aclken_UNCONNECTED;
  wire NLW_v_hdmi_tx_m_axis_hdcp_aresetn_UNCONNECTED;
  wire NLW_v_hdmi_tx_s_axis_video_aresetn_out_UNCONNECTED;

  (* X_CORE_INFO = "v_hdmi_tx_v3_0_0,Vivado 2021.2" *) 
  HDMI_transmitter_bd_5fd0_v_hdmi_tx_0 v_hdmi_tx
       (.acr_cts(acr_cts),
        .acr_n(acr_n),
        .acr_valid(acr_valid),
        .bridge_locked(1'b0),
        .bridge_overflow(1'b0),
        .bridge_pixel_repeat(NLW_v_hdmi_tx_bridge_pixel_repeat_UNCONNECTED),
        .bridge_underflow(1'b0),
        .bridge_yuv420(NLW_v_hdmi_tx_bridge_yuv420_UNCONNECTED),
        .ddc_scl_i(DDC_OUT_scl_i),
        .ddc_scl_o(DDC_OUT_scl_o),
        .ddc_scl_t(DDC_OUT_scl_t),
        .ddc_sda_i(DDC_OUT_sda_i),
        .ddc_sda_o(DDC_OUT_sda_o),
        .ddc_sda_t(DDC_OUT_sda_t),
        .hpd(hpd),
        .irq(irq),
        .link_clk(link_clk),
        .link_data0(LINK_DATA0_OUT_tdata),
        .link_data1(LINK_DATA1_OUT_tdata),
        .link_data2(LINK_DATA2_OUT_tdata),
        .link_valid0(LINK_DATA0_OUT_tvalid),
        .link_valid1(LINK_DATA1_OUT_tvalid),
        .link_valid2(LINK_DATA2_OUT_tvalid),
        .m_axis_hdcp_aclk(NLW_v_hdmi_tx_m_axis_hdcp_aclk_UNCONNECTED),
        .m_axis_hdcp_aclken(NLW_v_hdmi_tx_m_axis_hdcp_aclken_UNCONNECTED),
        .m_axis_hdcp_aresetn(NLW_v_hdmi_tx_m_axis_hdcp_aresetn_UNCONNECTED),
        .m_axis_hdcp_tdata(intf_net_v_hdmi_tx_hdcp_out_TDATA),
        .m_axis_hdcp_tid(intf_net_v_hdmi_tx_hdcp_out_TID),
        .m_axis_hdcp_tlast(intf_net_v_hdmi_tx_hdcp_out_TLAST),
        .m_axis_hdcp_tready(intf_net_v_hdmi_tx_hdcp_out_TREADY),
        .m_axis_hdcp_tstrb(intf_net_v_hdmi_tx_hdcp_out_TSTRB),
        .m_axis_hdcp_tuser(intf_net_v_hdmi_tx_hdcp_out_TUSER),
        .m_axis_hdcp_tvalid(intf_net_v_hdmi_tx_hdcp_out_TVALID),
        .s_axi_aclk(s_axi_cpu_aclk),
        .s_axi_araddr(S_AXI_CPU_IN_araddr),
        .s_axi_aresetn(s_axi_cpu_aresetn),
        .s_axi_arprot(S_AXI_CPU_IN_arprot),
        .s_axi_arready(S_AXI_CPU_IN_arready),
        .s_axi_arvalid(S_AXI_CPU_IN_arvalid),
        .s_axi_awaddr(S_AXI_CPU_IN_awaddr),
        .s_axi_awprot(S_AXI_CPU_IN_awprot),
        .s_axi_awready(S_AXI_CPU_IN_awready),
        .s_axi_awvalid(S_AXI_CPU_IN_awvalid),
        .s_axi_bready(S_AXI_CPU_IN_bready),
        .s_axi_bresp(S_AXI_CPU_IN_bresp),
        .s_axi_bvalid(S_AXI_CPU_IN_bvalid),
        .s_axi_rdata(S_AXI_CPU_IN_rdata),
        .s_axi_rready(S_AXI_CPU_IN_rready),
        .s_axi_rresp(S_AXI_CPU_IN_rresp),
        .s_axi_rvalid(S_AXI_CPU_IN_rvalid),
        .s_axi_wdata(S_AXI_CPU_IN_wdata),
        .s_axi_wready(S_AXI_CPU_IN_wready),
        .s_axi_wstrb(S_AXI_CPU_IN_wstrb),
        .s_axi_wvalid(S_AXI_CPU_IN_wvalid),
        .s_axis_audio_aclk(s_axis_audio_aclk),
        .s_axis_audio_aresetn(s_axis_audio_aresetn),
        .s_axis_audio_tdata(AUDIO_IN_tdata),
        .s_axis_audio_tid(AUDIO_IN_tid),
        .s_axis_audio_tready(AUDIO_IN_tready),
        .s_axis_audio_tvalid(AUDIO_IN_tvalid),
        .s_axis_hdcp_tdata(intf_net_v_hdmi_tx_hdcp_out_TDATA),
        .s_axis_hdcp_tid(intf_net_v_hdmi_tx_hdcp_out_TID),
        .s_axis_hdcp_tlast(intf_net_v_hdmi_tx_hdcp_out_TLAST),
        .s_axis_hdcp_tready(intf_net_v_hdmi_tx_hdcp_out_TREADY),
        .s_axis_hdcp_tstrb(intf_net_v_hdmi_tx_hdcp_out_TSTRB),
        .s_axis_hdcp_tuser(intf_net_v_hdmi_tx_hdcp_out_TUSER),
        .s_axis_hdcp_tvalid(intf_net_v_hdmi_tx_hdcp_out_TVALID),
        .s_axis_video_aclk(1'b0),
        .s_axis_video_aresetn_in(1'b0),
        .s_axis_video_aresetn_out(NLW_v_hdmi_tx_s_axis_video_aresetn_out_UNCONNECTED),
        .sb_status_data(SB_STATUS_IN_tdata),
        .sb_status_valid(SB_STATUS_IN_tvalid),
        .video_clk(video_clk),
        .video_data(NATIVE_VID_IN_data),
        .video_data_arb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .video_de(NATIVE_VID_IN_active_video),
        .video_de_arb({1'b0,1'b0}),
        .video_hs(NATIVE_VID_IN_hsync),
        .video_hs_arb({1'b0,1'b0}),
        .video_reset(video_rst),
        .video_vs(NATIVE_VID_IN_vsync),
        .video_vs_arb({1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "bd_5fd0_v_hdmi_tx_0" *) (* X_CORE_INFO = "v_hdmi_tx_v3_0_0,Vivado 2021.2" *) 
module HDMI_transmitter_bd_5fd0_v_hdmi_tx_0
   (s_axi_aclk,
    s_axi_aresetn,
    s_axis_video_aclk,
    s_axis_video_aresetn_in,
    s_axi_awaddr,
    s_axi_awprot,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_araddr,
    s_axi_arprot,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rvalid,
    s_axi_rready,
    video_clk,
    link_clk,
    video_vs,
    video_hs,
    video_data,
    video_de,
    video_vs_arb,
    video_hs_arb,
    video_de_arb,
    video_data_arb,
    s_axis_audio_aresetn,
    s_axis_audio_aclk,
    s_axis_audio_tready,
    s_axis_audio_tid,
    s_axis_audio_tdata,
    s_axis_audio_tvalid,
    acr_cts,
    acr_n,
    acr_valid,
    link_data0,
    link_data1,
    link_data2,
    link_valid0,
    link_valid1,
    link_valid2,
    hpd,
    bridge_locked,
    bridge_overflow,
    bridge_underflow,
    s_axis_video_aresetn_out,
    video_reset,
    sb_status_data,
    sb_status_valid,
    m_axis_hdcp_aresetn,
    m_axis_hdcp_aclk,
    m_axis_hdcp_aclken,
    m_axis_hdcp_tid,
    m_axis_hdcp_tuser,
    m_axis_hdcp_tdata,
    m_axis_hdcp_tstrb,
    m_axis_hdcp_tvalid,
    m_axis_hdcp_tlast,
    m_axis_hdcp_tready,
    s_axis_hdcp_tid,
    s_axis_hdcp_tuser,
    s_axis_hdcp_tdata,
    s_axis_hdcp_tstrb,
    s_axis_hdcp_tvalid,
    s_axis_hdcp_tlast,
    s_axis_hdcp_tready,
    ddc_scl_i,
    ddc_scl_o,
    ddc_scl_t,
    ddc_sda_i,
    ddc_sda_o,
    ddc_sda_t,
    irq,
    bridge_yuv420,
    bridge_pixel_repeat);
  input s_axi_aclk;
  input s_axi_aresetn;
  input s_axis_video_aclk;
  input s_axis_video_aresetn_in;
  input [8:0]s_axi_awaddr;
  input [2:0]s_axi_awprot;
  input s_axi_awvalid;
  output s_axi_awready;
  input [31:0]s_axi_wdata;
  input [3:0]s_axi_wstrb;
  input s_axi_wvalid;
  output s_axi_wready;
  output [1:0]s_axi_bresp;
  output s_axi_bvalid;
  input s_axi_bready;
  input [8:0]s_axi_araddr;
  input [2:0]s_axi_arprot;
  input s_axi_arvalid;
  output s_axi_arready;
  output [31:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rvalid;
  input s_axi_rready;
  input video_clk;
  input link_clk;
  input video_vs;
  input video_hs;
  input [47:0]video_data;
  input video_de;
  input [1:0]video_vs_arb;
  input [1:0]video_hs_arb;
  input [1:0]video_de_arb;
  input [47:0]video_data_arb;
  input s_axis_audio_aresetn;
  input s_axis_audio_aclk;
  output s_axis_audio_tready;
  input [7:0]s_axis_audio_tid;
  input [31:0]s_axis_audio_tdata;
  input s_axis_audio_tvalid;
  input [19:0]acr_cts;
  input [19:0]acr_n;
  input acr_valid;
  output [19:0]link_data0;
  output [19:0]link_data1;
  output [19:0]link_data2;
  output link_valid0;
  output link_valid1;
  output link_valid2;
  input hpd;
  input bridge_locked;
  input bridge_overflow;
  input bridge_underflow;
  output s_axis_video_aresetn_out;
  output video_reset;
  input [1:0]sb_status_data;
  input sb_status_valid;
  output m_axis_hdcp_aresetn;
  output m_axis_hdcp_aclk;
  output m_axis_hdcp_aclken;
  output m_axis_hdcp_tid;
  output [31:0]m_axis_hdcp_tuser;
  output [95:0]m_axis_hdcp_tdata;
  output [3:0]m_axis_hdcp_tstrb;
  output m_axis_hdcp_tvalid;
  output m_axis_hdcp_tlast;
  input m_axis_hdcp_tready;
  input s_axis_hdcp_tid;
  input [31:0]s_axis_hdcp_tuser;
  input [95:0]s_axis_hdcp_tdata;
  input [3:0]s_axis_hdcp_tstrb;
  input s_axis_hdcp_tvalid;
  input s_axis_hdcp_tlast;
  output s_axis_hdcp_tready;
  input ddc_scl_i;
  output ddc_scl_o;
  output ddc_scl_t;
  input ddc_sda_i;
  output ddc_sda_o;
  output ddc_sda_t;
  output irq;
  output bridge_yuv420;
  output bridge_pixel_repeat;


endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif

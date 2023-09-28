//Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Command: generate_target bd_5fd0.bd
//Design : bd_5fd0
//Purpose: IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "bd_5fd0,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=bd_5fd0,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=2,numReposBlks=2,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=SBD,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "HDMI_transmitter.hwdef" *) 
module bd_5fd0
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

  wire [31:0]intf_net_bdry_in_AUDIO_IN_TDATA;
  wire [7:0]intf_net_bdry_in_AUDIO_IN_TID;
  wire intf_net_bdry_in_AUDIO_IN_TREADY;
  wire intf_net_bdry_in_AUDIO_IN_TVALID;
  wire intf_net_bdry_in_NATIVE_VID_IN_ACTIVE_VIDEO;
  wire [47:0]intf_net_bdry_in_NATIVE_VID_IN_DATA;
  wire intf_net_bdry_in_NATIVE_VID_IN_HSYNC;
  wire intf_net_bdry_in_NATIVE_VID_IN_VSYNC;
  wire [1:0]intf_net_bdry_in_SB_STATUS_IN_TDATA;
  wire intf_net_bdry_in_SB_STATUS_IN_TVALID;
  wire [8:0]intf_net_bdry_in_S_AXI_CPU_IN_ARADDR;
  wire [2:0]intf_net_bdry_in_S_AXI_CPU_IN_ARPROT;
  wire intf_net_bdry_in_S_AXI_CPU_IN_ARREADY;
  wire intf_net_bdry_in_S_AXI_CPU_IN_ARVALID;
  wire [8:0]intf_net_bdry_in_S_AXI_CPU_IN_AWADDR;
  wire [2:0]intf_net_bdry_in_S_AXI_CPU_IN_AWPROT;
  wire intf_net_bdry_in_S_AXI_CPU_IN_AWREADY;
  wire intf_net_bdry_in_S_AXI_CPU_IN_AWVALID;
  wire intf_net_bdry_in_S_AXI_CPU_IN_BREADY;
  wire [1:0]intf_net_bdry_in_S_AXI_CPU_IN_BRESP;
  wire intf_net_bdry_in_S_AXI_CPU_IN_BVALID;
  wire [31:0]intf_net_bdry_in_S_AXI_CPU_IN_RDATA;
  wire intf_net_bdry_in_S_AXI_CPU_IN_RREADY;
  wire [1:0]intf_net_bdry_in_S_AXI_CPU_IN_RRESP;
  wire intf_net_bdry_in_S_AXI_CPU_IN_RVALID;
  wire [31:0]intf_net_bdry_in_S_AXI_CPU_IN_WDATA;
  wire intf_net_bdry_in_S_AXI_CPU_IN_WREADY;
  wire [3:0]intf_net_bdry_in_S_AXI_CPU_IN_WSTRB;
  wire intf_net_bdry_in_S_AXI_CPU_IN_WVALID;
  wire intf_net_v_hdmi_tx_DDC_OUT_SCL_I;
  wire intf_net_v_hdmi_tx_DDC_OUT_SCL_O;
  wire intf_net_v_hdmi_tx_DDC_OUT_SCL_T;
  wire intf_net_v_hdmi_tx_DDC_OUT_SDA_I;
  wire intf_net_v_hdmi_tx_DDC_OUT_SDA_O;
  wire intf_net_v_hdmi_tx_DDC_OUT_SDA_T;
  wire [19:0]intf_net_v_hdmi_tx_LINK_DATA0_OUT_TDATA;
  wire intf_net_v_hdmi_tx_LINK_DATA0_OUT_TVALID;
  wire [19:0]intf_net_v_hdmi_tx_LINK_DATA1_OUT_TDATA;
  wire intf_net_v_hdmi_tx_LINK_DATA1_OUT_TVALID;
  wire [19:0]intf_net_v_hdmi_tx_LINK_DATA2_OUT_TDATA;
  wire intf_net_v_hdmi_tx_LINK_DATA2_OUT_TVALID;
  wire [95:0]intf_net_v_hdmi_tx_hdcp_out_TDATA;
  wire intf_net_v_hdmi_tx_hdcp_out_TID;
  wire intf_net_v_hdmi_tx_hdcp_out_TLAST;
  wire intf_net_v_hdmi_tx_hdcp_out_TREADY;
  wire [3:0]intf_net_v_hdmi_tx_hdcp_out_TSTRB;
  wire [31:0]intf_net_v_hdmi_tx_hdcp_out_TUSER;
  wire intf_net_v_hdmi_tx_hdcp_out_TVALID;
  wire [19:0]net_bdry_in_acr_cts;
  wire [19:0]net_bdry_in_acr_n;
  wire net_bdry_in_acr_valid;
  wire net_bdry_in_hpd;
  wire net_bdry_in_link_clk;
  wire net_bdry_in_s_axi_cpu_aclk;
  wire net_bdry_in_s_axi_cpu_aresetn;
  wire net_bdry_in_s_axis_audio_aclk;
  wire net_bdry_in_s_axis_audio_aresetn;
  wire net_bdry_in_video_clk;
  wire [0:0]net_const_0_1bit_dout;
  wire net_v_hdmi_tx_irq;
  wire net_v_hdmi_tx_video_reset;

  assign AUDIO_IN_tready = intf_net_bdry_in_AUDIO_IN_TREADY;
  assign DDC_OUT_scl_o = intf_net_v_hdmi_tx_DDC_OUT_SCL_O;
  assign DDC_OUT_scl_t = intf_net_v_hdmi_tx_DDC_OUT_SCL_T;
  assign DDC_OUT_sda_o = intf_net_v_hdmi_tx_DDC_OUT_SDA_O;
  assign DDC_OUT_sda_t = intf_net_v_hdmi_tx_DDC_OUT_SDA_T;
  assign LINK_DATA0_OUT_tdata[19:0] = intf_net_v_hdmi_tx_LINK_DATA0_OUT_TDATA;
  assign LINK_DATA0_OUT_tvalid = intf_net_v_hdmi_tx_LINK_DATA0_OUT_TVALID;
  assign LINK_DATA1_OUT_tdata[19:0] = intf_net_v_hdmi_tx_LINK_DATA1_OUT_TDATA;
  assign LINK_DATA1_OUT_tvalid = intf_net_v_hdmi_tx_LINK_DATA1_OUT_TVALID;
  assign LINK_DATA2_OUT_tdata[19:0] = intf_net_v_hdmi_tx_LINK_DATA2_OUT_TDATA;
  assign LINK_DATA2_OUT_tvalid = intf_net_v_hdmi_tx_LINK_DATA2_OUT_TVALID;
  assign S_AXI_CPU_IN_arready = intf_net_bdry_in_S_AXI_CPU_IN_ARREADY;
  assign S_AXI_CPU_IN_awready = intf_net_bdry_in_S_AXI_CPU_IN_AWREADY;
  assign S_AXI_CPU_IN_bresp[1:0] = intf_net_bdry_in_S_AXI_CPU_IN_BRESP;
  assign S_AXI_CPU_IN_bvalid = intf_net_bdry_in_S_AXI_CPU_IN_BVALID;
  assign S_AXI_CPU_IN_rdata[31:0] = intf_net_bdry_in_S_AXI_CPU_IN_RDATA;
  assign S_AXI_CPU_IN_rresp[1:0] = intf_net_bdry_in_S_AXI_CPU_IN_RRESP;
  assign S_AXI_CPU_IN_rvalid = intf_net_bdry_in_S_AXI_CPU_IN_RVALID;
  assign S_AXI_CPU_IN_wready = intf_net_bdry_in_S_AXI_CPU_IN_WREADY;
  assign intf_net_bdry_in_AUDIO_IN_TDATA = AUDIO_IN_tdata[31:0];
  assign intf_net_bdry_in_AUDIO_IN_TID = AUDIO_IN_tid[7:0];
  assign intf_net_bdry_in_AUDIO_IN_TVALID = AUDIO_IN_tvalid;
  assign intf_net_bdry_in_NATIVE_VID_IN_ACTIVE_VIDEO = NATIVE_VID_IN_active_video;
  assign intf_net_bdry_in_NATIVE_VID_IN_DATA = NATIVE_VID_IN_data[47:0];
  assign intf_net_bdry_in_NATIVE_VID_IN_HSYNC = NATIVE_VID_IN_hsync;
  assign intf_net_bdry_in_NATIVE_VID_IN_VSYNC = NATIVE_VID_IN_vsync;
  assign intf_net_bdry_in_SB_STATUS_IN_TDATA = SB_STATUS_IN_tdata[1:0];
  assign intf_net_bdry_in_SB_STATUS_IN_TVALID = SB_STATUS_IN_tvalid;
  assign intf_net_bdry_in_S_AXI_CPU_IN_ARADDR = S_AXI_CPU_IN_araddr[8:0];
  assign intf_net_bdry_in_S_AXI_CPU_IN_ARPROT = S_AXI_CPU_IN_arprot[2:0];
  assign intf_net_bdry_in_S_AXI_CPU_IN_ARVALID = S_AXI_CPU_IN_arvalid;
  assign intf_net_bdry_in_S_AXI_CPU_IN_AWADDR = S_AXI_CPU_IN_awaddr[8:0];
  assign intf_net_bdry_in_S_AXI_CPU_IN_AWPROT = S_AXI_CPU_IN_awprot[2:0];
  assign intf_net_bdry_in_S_AXI_CPU_IN_AWVALID = S_AXI_CPU_IN_awvalid;
  assign intf_net_bdry_in_S_AXI_CPU_IN_BREADY = S_AXI_CPU_IN_bready;
  assign intf_net_bdry_in_S_AXI_CPU_IN_RREADY = S_AXI_CPU_IN_rready;
  assign intf_net_bdry_in_S_AXI_CPU_IN_WDATA = S_AXI_CPU_IN_wdata[31:0];
  assign intf_net_bdry_in_S_AXI_CPU_IN_WSTRB = S_AXI_CPU_IN_wstrb[3:0];
  assign intf_net_bdry_in_S_AXI_CPU_IN_WVALID = S_AXI_CPU_IN_wvalid;
  assign intf_net_v_hdmi_tx_DDC_OUT_SCL_I = DDC_OUT_scl_i;
  assign intf_net_v_hdmi_tx_DDC_OUT_SDA_I = DDC_OUT_sda_i;
  assign irq = net_v_hdmi_tx_irq;
  assign net_bdry_in_acr_cts = acr_cts[19:0];
  assign net_bdry_in_acr_n = acr_n[19:0];
  assign net_bdry_in_acr_valid = acr_valid;
  assign net_bdry_in_hpd = hpd;
  assign net_bdry_in_link_clk = link_clk;
  assign net_bdry_in_s_axi_cpu_aclk = s_axi_cpu_aclk;
  assign net_bdry_in_s_axi_cpu_aresetn = s_axi_cpu_aresetn;
  assign net_bdry_in_s_axis_audio_aclk = s_axis_audio_aclk;
  assign net_bdry_in_s_axis_audio_aresetn = s_axis_audio_aresetn;
  assign net_bdry_in_video_clk = video_clk;
  assign video_rst = net_v_hdmi_tx_video_reset;
  bd_5fd0_const_0_1bit_0 const_0_1bit
       (.dout(net_const_0_1bit_dout));
  bd_5fd0_v_hdmi_tx_0 v_hdmi_tx
       (.acr_cts(net_bdry_in_acr_cts),
        .acr_n(net_bdry_in_acr_n),
        .acr_valid(net_bdry_in_acr_valid),
        .bridge_locked(1'b0),
        .bridge_overflow(1'b0),
        .bridge_underflow(1'b0),
        .ddc_scl_i(intf_net_v_hdmi_tx_DDC_OUT_SCL_I),
        .ddc_scl_o(intf_net_v_hdmi_tx_DDC_OUT_SCL_O),
        .ddc_scl_t(intf_net_v_hdmi_tx_DDC_OUT_SCL_T),
        .ddc_sda_i(intf_net_v_hdmi_tx_DDC_OUT_SDA_I),
        .ddc_sda_o(intf_net_v_hdmi_tx_DDC_OUT_SDA_O),
        .ddc_sda_t(intf_net_v_hdmi_tx_DDC_OUT_SDA_T),
        .hpd(net_bdry_in_hpd),
        .irq(net_v_hdmi_tx_irq),
        .link_clk(net_bdry_in_link_clk),
        .link_data0(intf_net_v_hdmi_tx_LINK_DATA0_OUT_TDATA),
        .link_data1(intf_net_v_hdmi_tx_LINK_DATA1_OUT_TDATA),
        .link_data2(intf_net_v_hdmi_tx_LINK_DATA2_OUT_TDATA),
        .link_valid0(intf_net_v_hdmi_tx_LINK_DATA0_OUT_TVALID),
        .link_valid1(intf_net_v_hdmi_tx_LINK_DATA1_OUT_TVALID),
        .link_valid2(intf_net_v_hdmi_tx_LINK_DATA2_OUT_TVALID),
        .m_axis_hdcp_tdata(intf_net_v_hdmi_tx_hdcp_out_TDATA),
        .m_axis_hdcp_tid(intf_net_v_hdmi_tx_hdcp_out_TID),
        .m_axis_hdcp_tlast(intf_net_v_hdmi_tx_hdcp_out_TLAST),
        .m_axis_hdcp_tready(intf_net_v_hdmi_tx_hdcp_out_TREADY),
        .m_axis_hdcp_tstrb(intf_net_v_hdmi_tx_hdcp_out_TSTRB),
        .m_axis_hdcp_tuser(intf_net_v_hdmi_tx_hdcp_out_TUSER),
        .m_axis_hdcp_tvalid(intf_net_v_hdmi_tx_hdcp_out_TVALID),
        .s_axi_aclk(net_bdry_in_s_axi_cpu_aclk),
        .s_axi_araddr(intf_net_bdry_in_S_AXI_CPU_IN_ARADDR),
        .s_axi_aresetn(net_bdry_in_s_axi_cpu_aresetn),
        .s_axi_arprot(intf_net_bdry_in_S_AXI_CPU_IN_ARPROT),
        .s_axi_arready(intf_net_bdry_in_S_AXI_CPU_IN_ARREADY),
        .s_axi_arvalid(intf_net_bdry_in_S_AXI_CPU_IN_ARVALID),
        .s_axi_awaddr(intf_net_bdry_in_S_AXI_CPU_IN_AWADDR),
        .s_axi_awprot(intf_net_bdry_in_S_AXI_CPU_IN_AWPROT),
        .s_axi_awready(intf_net_bdry_in_S_AXI_CPU_IN_AWREADY),
        .s_axi_awvalid(intf_net_bdry_in_S_AXI_CPU_IN_AWVALID),
        .s_axi_bready(intf_net_bdry_in_S_AXI_CPU_IN_BREADY),
        .s_axi_bresp(intf_net_bdry_in_S_AXI_CPU_IN_BRESP),
        .s_axi_bvalid(intf_net_bdry_in_S_AXI_CPU_IN_BVALID),
        .s_axi_rdata(intf_net_bdry_in_S_AXI_CPU_IN_RDATA),
        .s_axi_rready(intf_net_bdry_in_S_AXI_CPU_IN_RREADY),
        .s_axi_rresp(intf_net_bdry_in_S_AXI_CPU_IN_RRESP),
        .s_axi_rvalid(intf_net_bdry_in_S_AXI_CPU_IN_RVALID),
        .s_axi_wdata(intf_net_bdry_in_S_AXI_CPU_IN_WDATA),
        .s_axi_wready(intf_net_bdry_in_S_AXI_CPU_IN_WREADY),
        .s_axi_wstrb(intf_net_bdry_in_S_AXI_CPU_IN_WSTRB),
        .s_axi_wvalid(intf_net_bdry_in_S_AXI_CPU_IN_WVALID),
        .s_axis_audio_aclk(net_bdry_in_s_axis_audio_aclk),
        .s_axis_audio_aresetn(net_bdry_in_s_axis_audio_aresetn),
        .s_axis_audio_tdata(intf_net_bdry_in_AUDIO_IN_TDATA),
        .s_axis_audio_tid(intf_net_bdry_in_AUDIO_IN_TID),
        .s_axis_audio_tready(intf_net_bdry_in_AUDIO_IN_TREADY),
        .s_axis_audio_tvalid(intf_net_bdry_in_AUDIO_IN_TVALID),
        .s_axis_hdcp_tdata(intf_net_v_hdmi_tx_hdcp_out_TDATA),
        .s_axis_hdcp_tid(intf_net_v_hdmi_tx_hdcp_out_TID),
        .s_axis_hdcp_tlast(intf_net_v_hdmi_tx_hdcp_out_TLAST),
        .s_axis_hdcp_tready(intf_net_v_hdmi_tx_hdcp_out_TREADY),
        .s_axis_hdcp_tstrb(intf_net_v_hdmi_tx_hdcp_out_TSTRB),
        .s_axis_hdcp_tuser(intf_net_v_hdmi_tx_hdcp_out_TUSER),
        .s_axis_hdcp_tvalid(intf_net_v_hdmi_tx_hdcp_out_TVALID),
        .s_axis_video_aclk(net_const_0_1bit_dout),
        .s_axis_video_aresetn_in(net_const_0_1bit_dout),
        .sb_status_data(intf_net_bdry_in_SB_STATUS_IN_TDATA),
        .sb_status_valid(intf_net_bdry_in_SB_STATUS_IN_TVALID),
        .video_clk(net_bdry_in_video_clk),
        .video_data(intf_net_bdry_in_NATIVE_VID_IN_DATA),
        .video_data_arb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .video_de(intf_net_bdry_in_NATIVE_VID_IN_ACTIVE_VIDEO),
        .video_de_arb({1'b0,1'b0}),
        .video_hs(intf_net_bdry_in_NATIVE_VID_IN_HSYNC),
        .video_hs_arb({1'b0,1'b0}),
        .video_reset(net_v_hdmi_tx_video_reset),
        .video_vs(intf_net_bdry_in_NATIVE_VID_IN_VSYNC),
        .video_vs_arb({1'b0,1'b0}));
endmodule

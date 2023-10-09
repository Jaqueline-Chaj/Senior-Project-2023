-- Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
-- Date        : Mon Oct  9 15:57:49 2023
-- Host        : ARM144-11 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ HDMI_transmitter_sim_netlist.vhdl
-- Design      : HDMI_transmitter
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tfgg484-2L
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_bd_5fd0 is
  port (
    AUDIO_IN_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    AUDIO_IN_tid : in STD_LOGIC_VECTOR ( 7 downto 0 );
    AUDIO_IN_tready : out STD_LOGIC;
    AUDIO_IN_tvalid : in STD_LOGIC;
    DDC_OUT_scl_i : in STD_LOGIC;
    DDC_OUT_scl_o : out STD_LOGIC;
    DDC_OUT_scl_t : out STD_LOGIC;
    DDC_OUT_sda_i : in STD_LOGIC;
    DDC_OUT_sda_o : out STD_LOGIC;
    DDC_OUT_sda_t : out STD_LOGIC;
    LINK_DATA0_OUT_tdata : out STD_LOGIC_VECTOR ( 19 downto 0 );
    LINK_DATA0_OUT_tvalid : out STD_LOGIC;
    LINK_DATA1_OUT_tdata : out STD_LOGIC_VECTOR ( 19 downto 0 );
    LINK_DATA1_OUT_tvalid : out STD_LOGIC;
    LINK_DATA2_OUT_tdata : out STD_LOGIC_VECTOR ( 19 downto 0 );
    LINK_DATA2_OUT_tvalid : out STD_LOGIC;
    NATIVE_VID_IN_active_video : in STD_LOGIC;
    NATIVE_VID_IN_data : in STD_LOGIC_VECTOR ( 47 downto 0 );
    NATIVE_VID_IN_hsync : in STD_LOGIC;
    NATIVE_VID_IN_vsync : in STD_LOGIC;
    SB_STATUS_IN_tdata : in STD_LOGIC_VECTOR ( 1 downto 0 );
    SB_STATUS_IN_tvalid : in STD_LOGIC;
    S_AXI_CPU_IN_araddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    S_AXI_CPU_IN_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_CPU_IN_arready : out STD_LOGIC;
    S_AXI_CPU_IN_arvalid : in STD_LOGIC;
    S_AXI_CPU_IN_awaddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    S_AXI_CPU_IN_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_CPU_IN_awready : out STD_LOGIC;
    S_AXI_CPU_IN_awvalid : in STD_LOGIC;
    S_AXI_CPU_IN_bready : in STD_LOGIC;
    S_AXI_CPU_IN_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_CPU_IN_bvalid : out STD_LOGIC;
    S_AXI_CPU_IN_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_CPU_IN_rready : in STD_LOGIC;
    S_AXI_CPU_IN_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_CPU_IN_rvalid : out STD_LOGIC;
    S_AXI_CPU_IN_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_CPU_IN_wready : out STD_LOGIC;
    S_AXI_CPU_IN_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_CPU_IN_wvalid : in STD_LOGIC;
    acr_cts : in STD_LOGIC_VECTOR ( 19 downto 0 );
    acr_n : in STD_LOGIC_VECTOR ( 19 downto 0 );
    acr_valid : in STD_LOGIC;
    hpd : in STD_LOGIC;
    irq : out STD_LOGIC;
    link_clk : in STD_LOGIC;
    s_axi_cpu_aclk : in STD_LOGIC;
    s_axi_cpu_aresetn : in STD_LOGIC;
    s_axis_audio_aclk : in STD_LOGIC;
    s_axis_audio_aresetn : in STD_LOGIC;
    video_clk : in STD_LOGIC;
    video_rst : out STD_LOGIC
  );
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_bd_5fd0 : entity is "HDMI_transmitter.hwdef";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_bd_5fd0;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_bd_5fd0 is
  component decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_bd_5fd0_v_hdmi_tx_0 is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axis_video_aclk : in STD_LOGIC;
    s_axis_video_aresetn_in : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    video_clk : in STD_LOGIC;
    link_clk : in STD_LOGIC;
    video_vs : in STD_LOGIC;
    video_hs : in STD_LOGIC;
    video_data : in STD_LOGIC_VECTOR ( 47 downto 0 );
    video_de : in STD_LOGIC;
    video_vs_arb : in STD_LOGIC_VECTOR ( 1 downto 0 );
    video_hs_arb : in STD_LOGIC_VECTOR ( 1 downto 0 );
    video_de_arb : in STD_LOGIC_VECTOR ( 1 downto 0 );
    video_data_arb : in STD_LOGIC_VECTOR ( 47 downto 0 );
    s_axis_audio_aresetn : in STD_LOGIC;
    s_axis_audio_aclk : in STD_LOGIC;
    s_axis_audio_tready : out STD_LOGIC;
    s_axis_audio_tid : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axis_audio_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_audio_tvalid : in STD_LOGIC;
    acr_cts : in STD_LOGIC_VECTOR ( 19 downto 0 );
    acr_n : in STD_LOGIC_VECTOR ( 19 downto 0 );
    acr_valid : in STD_LOGIC;
    link_data0 : out STD_LOGIC_VECTOR ( 19 downto 0 );
    link_data1 : out STD_LOGIC_VECTOR ( 19 downto 0 );
    link_data2 : out STD_LOGIC_VECTOR ( 19 downto 0 );
    link_valid0 : out STD_LOGIC;
    link_valid1 : out STD_LOGIC;
    link_valid2 : out STD_LOGIC;
    hpd : in STD_LOGIC;
    bridge_locked : in STD_LOGIC;
    bridge_overflow : in STD_LOGIC;
    bridge_underflow : in STD_LOGIC;
    s_axis_video_aresetn_out : out STD_LOGIC;
    video_reset : out STD_LOGIC;
    sb_status_data : in STD_LOGIC_VECTOR ( 1 downto 0 );
    sb_status_valid : in STD_LOGIC;
    m_axis_hdcp_aresetn : out STD_LOGIC;
    m_axis_hdcp_aclk : out STD_LOGIC;
    m_axis_hdcp_aclken : out STD_LOGIC;
    m_axis_hdcp_tid : out STD_LOGIC;
    m_axis_hdcp_tuser : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_hdcp_tdata : out STD_LOGIC_VECTOR ( 95 downto 0 );
    m_axis_hdcp_tstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_hdcp_tvalid : out STD_LOGIC;
    m_axis_hdcp_tlast : out STD_LOGIC;
    m_axis_hdcp_tready : in STD_LOGIC;
    s_axis_hdcp_tid : in STD_LOGIC;
    s_axis_hdcp_tuser : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_hdcp_tdata : in STD_LOGIC_VECTOR ( 95 downto 0 );
    s_axis_hdcp_tstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axis_hdcp_tvalid : in STD_LOGIC;
    s_axis_hdcp_tlast : in STD_LOGIC;
    s_axis_hdcp_tready : out STD_LOGIC;
    ddc_scl_i : in STD_LOGIC;
    ddc_scl_o : out STD_LOGIC;
    ddc_scl_t : out STD_LOGIC;
    ddc_sda_i : in STD_LOGIC;
    ddc_sda_o : out STD_LOGIC;
    ddc_sda_t : out STD_LOGIC;
    irq : out STD_LOGIC;
    bridge_yuv420 : out STD_LOGIC;
    bridge_pixel_repeat : out STD_LOGIC
  );
  end component decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_bd_5fd0_v_hdmi_tx_0;
  signal intf_net_v_hdmi_tx_hdcp_out_TDATA : STD_LOGIC_VECTOR ( 95 downto 0 );
  signal intf_net_v_hdmi_tx_hdcp_out_TID : STD_LOGIC;
  signal intf_net_v_hdmi_tx_hdcp_out_TLAST : STD_LOGIC;
  signal intf_net_v_hdmi_tx_hdcp_out_TREADY : STD_LOGIC;
  signal intf_net_v_hdmi_tx_hdcp_out_TSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal intf_net_v_hdmi_tx_hdcp_out_TUSER : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal intf_net_v_hdmi_tx_hdcp_out_TVALID : STD_LOGIC;
  signal NLW_v_hdmi_tx_bridge_pixel_repeat_UNCONNECTED : STD_LOGIC;
  signal NLW_v_hdmi_tx_bridge_yuv420_UNCONNECTED : STD_LOGIC;
  signal NLW_v_hdmi_tx_m_axis_hdcp_aclk_UNCONNECTED : STD_LOGIC;
  signal NLW_v_hdmi_tx_m_axis_hdcp_aclken_UNCONNECTED : STD_LOGIC;
  signal NLW_v_hdmi_tx_m_axis_hdcp_aresetn_UNCONNECTED : STD_LOGIC;
  signal NLW_v_hdmi_tx_s_axis_video_aresetn_out_UNCONNECTED : STD_LOGIC;
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of v_hdmi_tx : label is "v_hdmi_tx_v3_0_0,Vivado 2021.2";
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of AUDIO_IN_tready : signal is "xilinx.com:interface:axis:1.0 AUDIO_IN TREADY";
  attribute X_INTERFACE_INFO of AUDIO_IN_tvalid : signal is "xilinx.com:interface:axis:1.0 AUDIO_IN TVALID";
  attribute X_INTERFACE_INFO of DDC_OUT_scl_i : signal is "xilinx.com:interface:iic:1.0 DDC_OUT SCL_I";
  attribute X_INTERFACE_INFO of DDC_OUT_scl_o : signal is "xilinx.com:interface:iic:1.0 DDC_OUT SCL_O";
  attribute X_INTERFACE_INFO of DDC_OUT_scl_t : signal is "xilinx.com:interface:iic:1.0 DDC_OUT SCL_T";
  attribute X_INTERFACE_INFO of DDC_OUT_sda_i : signal is "xilinx.com:interface:iic:1.0 DDC_OUT SDA_I";
  attribute X_INTERFACE_INFO of DDC_OUT_sda_o : signal is "xilinx.com:interface:iic:1.0 DDC_OUT SDA_O";
  attribute X_INTERFACE_INFO of DDC_OUT_sda_t : signal is "xilinx.com:interface:iic:1.0 DDC_OUT SDA_T";
  attribute X_INTERFACE_INFO of LINK_DATA0_OUT_tvalid : signal is "xilinx.com:interface:axis:1.0 LINK_DATA0_OUT TVALID";
  attribute X_INTERFACE_INFO of LINK_DATA1_OUT_tvalid : signal is "xilinx.com:interface:axis:1.0 LINK_DATA1_OUT TVALID";
  attribute X_INTERFACE_INFO of LINK_DATA2_OUT_tvalid : signal is "xilinx.com:interface:axis:1.0 LINK_DATA2_OUT TVALID";
  attribute X_INTERFACE_INFO of NATIVE_VID_IN_active_video : signal is "xilinx.com:interface:vid_io:1.0 NATIVE_VID_IN ACTIVE_VIDEO";
  attribute X_INTERFACE_INFO of NATIVE_VID_IN_hsync : signal is "xilinx.com:interface:vid_io:1.0 NATIVE_VID_IN HSYNC";
  attribute X_INTERFACE_INFO of NATIVE_VID_IN_vsync : signal is "xilinx.com:interface:vid_io:1.0 NATIVE_VID_IN VSYNC";
  attribute X_INTERFACE_INFO of SB_STATUS_IN_tvalid : signal is "xilinx.com:interface:axis:1.0 SB_STATUS_IN TVALID";
  attribute X_INTERFACE_INFO of S_AXI_CPU_IN_arready : signal is "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN ARREADY";
  attribute X_INTERFACE_INFO of S_AXI_CPU_IN_arvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN ARVALID";
  attribute X_INTERFACE_INFO of S_AXI_CPU_IN_awready : signal is "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN AWREADY";
  attribute X_INTERFACE_INFO of S_AXI_CPU_IN_awvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN AWVALID";
  attribute X_INTERFACE_INFO of S_AXI_CPU_IN_bready : signal is "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN BREADY";
  attribute X_INTERFACE_INFO of S_AXI_CPU_IN_bvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN BVALID";
  attribute X_INTERFACE_INFO of S_AXI_CPU_IN_rready : signal is "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN RREADY";
  attribute X_INTERFACE_INFO of S_AXI_CPU_IN_rvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN RVALID";
  attribute X_INTERFACE_INFO of S_AXI_CPU_IN_wready : signal is "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN WREADY";
  attribute X_INTERFACE_INFO of S_AXI_CPU_IN_wvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN WVALID";
  attribute X_INTERFACE_INFO of irq : signal is "xilinx.com:signal:interrupt:1.0 INTR.IRQ INTERRUPT";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of irq : signal is "XIL_INTERFACENAME INTR.IRQ, PortWidth 1, SENSITIVITY LEVEL_HIGH";
  attribute X_INTERFACE_INFO of link_clk : signal is "xilinx.com:signal:clock:1.0 CLK.LINK_CLK CLK";
  attribute X_INTERFACE_PARAMETER of link_clk : signal is "XIL_INTERFACENAME CLK.LINK_CLK, ASSOCIATED_BUSIF LINK_DATA0_OUT:LINK_DATA1_OUT:LINK_DATA2_OUT, CLK_DOMAIN bd_5fd0_link_clk, FREQ_HZ 74250000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
  attribute X_INTERFACE_INFO of s_axi_cpu_aclk : signal is "xilinx.com:signal:clock:1.0 CLK.S_AXI_CPU_ACLK CLK";
  attribute X_INTERFACE_PARAMETER of s_axi_cpu_aclk : signal is "XIL_INTERFACENAME CLK.S_AXI_CPU_ACLK, ASSOCIATED_BUSIF SB_STATUS_IN:S_AXI_CPU_IN, ASSOCIATED_RESET s_axi_cpu_aresetn, CLK_DOMAIN bd_5fd0_s_axi_cpu_aclk, FREQ_HZ 200000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
  attribute X_INTERFACE_INFO of s_axi_cpu_aresetn : signal is "xilinx.com:signal:reset:1.0 RST.S_AXI_CPU_ARESETN RST";
  attribute X_INTERFACE_PARAMETER of s_axi_cpu_aresetn : signal is "XIL_INTERFACENAME RST.S_AXI_CPU_ARESETN, INSERT_VIP 0, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of s_axis_audio_aclk : signal is "xilinx.com:signal:clock:1.0 CLK.S_AXIS_AUDIO_ACLK CLK";
  attribute X_INTERFACE_PARAMETER of s_axis_audio_aclk : signal is "XIL_INTERFACENAME CLK.S_AXIS_AUDIO_ACLK, ASSOCIATED_BUSIF AUDIO_IN, ASSOCIATED_RESET s_axis_audio_aresetn, CLK_DOMAIN bd_5fd0_s_axis_audio_aclk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
  attribute X_INTERFACE_INFO of s_axis_audio_aresetn : signal is "xilinx.com:signal:reset:1.0 RST.S_AXIS_AUDIO_ARESETN RST";
  attribute X_INTERFACE_PARAMETER of s_axis_audio_aresetn : signal is "XIL_INTERFACENAME RST.S_AXIS_AUDIO_ARESETN, INSERT_VIP 0, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of video_clk : signal is "xilinx.com:signal:clock:1.0 CLK.VIDEO_CLK CLK";
  attribute X_INTERFACE_PARAMETER of video_clk : signal is "XIL_INTERFACENAME CLK.VIDEO_CLK, ASSOCIATED_BUSIF NATIVE_VID_IN, CLK_DOMAIN bd_5fd0_video_clk, FREQ_HZ 148500000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
  attribute X_INTERFACE_INFO of video_rst : signal is "xilinx.com:signal:reset:1.0 RST.VIDEO_RST RST";
  attribute X_INTERFACE_PARAMETER of video_rst : signal is "XIL_INTERFACENAME RST.VIDEO_RST, INSERT_VIP 0, POLARITY ACTIVE_HIGH";
  attribute X_INTERFACE_INFO of AUDIO_IN_tdata : signal is "xilinx.com:interface:axis:1.0 AUDIO_IN TDATA";
  attribute X_INTERFACE_PARAMETER of AUDIO_IN_tdata : signal is "XIL_INTERFACENAME AUDIO_IN, CLK_DOMAIN bd_5fd0_s_axis_audio_aclk, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 8, TUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of AUDIO_IN_tid : signal is "xilinx.com:interface:axis:1.0 AUDIO_IN TID";
  attribute X_INTERFACE_INFO of LINK_DATA0_OUT_tdata : signal is "xilinx.com:interface:axis:1.0 LINK_DATA0_OUT TDATA";
  attribute X_INTERFACE_PARAMETER of LINK_DATA0_OUT_tdata : signal is "XIL_INTERFACENAME LINK_DATA0_OUT, CLK_DOMAIN bd_5fd0_link_clk, FREQ_HZ 74250000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 0, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 2, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of LINK_DATA1_OUT_tdata : signal is "xilinx.com:interface:axis:1.0 LINK_DATA1_OUT TDATA";
  attribute X_INTERFACE_PARAMETER of LINK_DATA1_OUT_tdata : signal is "XIL_INTERFACENAME LINK_DATA1_OUT, CLK_DOMAIN bd_5fd0_link_clk, FREQ_HZ 74250000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 0, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 2, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of LINK_DATA2_OUT_tdata : signal is "xilinx.com:interface:axis:1.0 LINK_DATA2_OUT TDATA";
  attribute X_INTERFACE_PARAMETER of LINK_DATA2_OUT_tdata : signal is "XIL_INTERFACENAME LINK_DATA2_OUT, CLK_DOMAIN bd_5fd0_link_clk, FREQ_HZ 74250000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 0, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 2, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of NATIVE_VID_IN_data : signal is "xilinx.com:interface:vid_io:1.0 NATIVE_VID_IN DATA";
  attribute X_INTERFACE_INFO of SB_STATUS_IN_tdata : signal is "xilinx.com:interface:axis:1.0 SB_STATUS_IN TDATA";
  attribute X_INTERFACE_PARAMETER of SB_STATUS_IN_tdata : signal is "XIL_INTERFACENAME SB_STATUS_IN, CLK_DOMAIN bd_5fd0_s_axi_cpu_aclk, FREQ_HZ 200000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 0, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 0, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of S_AXI_CPU_IN_araddr : signal is "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN ARADDR";
  attribute X_INTERFACE_PARAMETER of S_AXI_CPU_IN_araddr : signal is "XIL_INTERFACENAME S_AXI_CPU_IN, ADDR_WIDTH 16, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN bd_5fd0_s_axi_cpu_aclk, DATA_WIDTH 32, FREQ_HZ 200000000, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 1, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 1, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 1, NUM_WRITE_THREADS 1, PHASE 0.0, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of S_AXI_CPU_IN_arprot : signal is "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN ARPROT";
  attribute X_INTERFACE_INFO of S_AXI_CPU_IN_awaddr : signal is "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN AWADDR";
  attribute X_INTERFACE_INFO of S_AXI_CPU_IN_awprot : signal is "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN AWPROT";
  attribute X_INTERFACE_INFO of S_AXI_CPU_IN_bresp : signal is "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN BRESP";
  attribute X_INTERFACE_INFO of S_AXI_CPU_IN_rdata : signal is "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN RDATA";
  attribute X_INTERFACE_INFO of S_AXI_CPU_IN_rresp : signal is "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN RRESP";
  attribute X_INTERFACE_INFO of S_AXI_CPU_IN_wdata : signal is "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN WDATA";
  attribute X_INTERFACE_INFO of S_AXI_CPU_IN_wstrb : signal is "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN WSTRB";
begin
v_hdmi_tx: component decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_bd_5fd0_v_hdmi_tx_0
     port map (
      acr_cts(19 downto 0) => acr_cts(19 downto 0),
      acr_n(19 downto 0) => acr_n(19 downto 0),
      acr_valid => acr_valid,
      bridge_locked => '0',
      bridge_overflow => '0',
      bridge_pixel_repeat => NLW_v_hdmi_tx_bridge_pixel_repeat_UNCONNECTED,
      bridge_underflow => '0',
      bridge_yuv420 => NLW_v_hdmi_tx_bridge_yuv420_UNCONNECTED,
      ddc_scl_i => DDC_OUT_scl_i,
      ddc_scl_o => DDC_OUT_scl_o,
      ddc_scl_t => DDC_OUT_scl_t,
      ddc_sda_i => DDC_OUT_sda_i,
      ddc_sda_o => DDC_OUT_sda_o,
      ddc_sda_t => DDC_OUT_sda_t,
      hpd => hpd,
      irq => irq,
      link_clk => link_clk,
      link_data0(19 downto 0) => LINK_DATA0_OUT_tdata(19 downto 0),
      link_data1(19 downto 0) => LINK_DATA1_OUT_tdata(19 downto 0),
      link_data2(19 downto 0) => LINK_DATA2_OUT_tdata(19 downto 0),
      link_valid0 => LINK_DATA0_OUT_tvalid,
      link_valid1 => LINK_DATA1_OUT_tvalid,
      link_valid2 => LINK_DATA2_OUT_tvalid,
      m_axis_hdcp_aclk => NLW_v_hdmi_tx_m_axis_hdcp_aclk_UNCONNECTED,
      m_axis_hdcp_aclken => NLW_v_hdmi_tx_m_axis_hdcp_aclken_UNCONNECTED,
      m_axis_hdcp_aresetn => NLW_v_hdmi_tx_m_axis_hdcp_aresetn_UNCONNECTED,
      m_axis_hdcp_tdata(95 downto 0) => intf_net_v_hdmi_tx_hdcp_out_TDATA(95 downto 0),
      m_axis_hdcp_tid => intf_net_v_hdmi_tx_hdcp_out_TID,
      m_axis_hdcp_tlast => intf_net_v_hdmi_tx_hdcp_out_TLAST,
      m_axis_hdcp_tready => intf_net_v_hdmi_tx_hdcp_out_TREADY,
      m_axis_hdcp_tstrb(3 downto 0) => intf_net_v_hdmi_tx_hdcp_out_TSTRB(3 downto 0),
      m_axis_hdcp_tuser(31 downto 0) => intf_net_v_hdmi_tx_hdcp_out_TUSER(31 downto 0),
      m_axis_hdcp_tvalid => intf_net_v_hdmi_tx_hdcp_out_TVALID,
      s_axi_aclk => s_axi_cpu_aclk,
      s_axi_araddr(8 downto 0) => S_AXI_CPU_IN_araddr(8 downto 0),
      s_axi_aresetn => s_axi_cpu_aresetn,
      s_axi_arprot(2 downto 0) => S_AXI_CPU_IN_arprot(2 downto 0),
      s_axi_arready => S_AXI_CPU_IN_arready,
      s_axi_arvalid => S_AXI_CPU_IN_arvalid,
      s_axi_awaddr(8 downto 0) => S_AXI_CPU_IN_awaddr(8 downto 0),
      s_axi_awprot(2 downto 0) => S_AXI_CPU_IN_awprot(2 downto 0),
      s_axi_awready => S_AXI_CPU_IN_awready,
      s_axi_awvalid => S_AXI_CPU_IN_awvalid,
      s_axi_bready => S_AXI_CPU_IN_bready,
      s_axi_bresp(1 downto 0) => S_AXI_CPU_IN_bresp(1 downto 0),
      s_axi_bvalid => S_AXI_CPU_IN_bvalid,
      s_axi_rdata(31 downto 0) => S_AXI_CPU_IN_rdata(31 downto 0),
      s_axi_rready => S_AXI_CPU_IN_rready,
      s_axi_rresp(1 downto 0) => S_AXI_CPU_IN_rresp(1 downto 0),
      s_axi_rvalid => S_AXI_CPU_IN_rvalid,
      s_axi_wdata(31 downto 0) => S_AXI_CPU_IN_wdata(31 downto 0),
      s_axi_wready => S_AXI_CPU_IN_wready,
      s_axi_wstrb(3 downto 0) => S_AXI_CPU_IN_wstrb(3 downto 0),
      s_axi_wvalid => S_AXI_CPU_IN_wvalid,
      s_axis_audio_aclk => s_axis_audio_aclk,
      s_axis_audio_aresetn => s_axis_audio_aresetn,
      s_axis_audio_tdata(31 downto 0) => AUDIO_IN_tdata(31 downto 0),
      s_axis_audio_tid(7 downto 0) => AUDIO_IN_tid(7 downto 0),
      s_axis_audio_tready => AUDIO_IN_tready,
      s_axis_audio_tvalid => AUDIO_IN_tvalid,
      s_axis_hdcp_tdata(95 downto 0) => intf_net_v_hdmi_tx_hdcp_out_TDATA(95 downto 0),
      s_axis_hdcp_tid => intf_net_v_hdmi_tx_hdcp_out_TID,
      s_axis_hdcp_tlast => intf_net_v_hdmi_tx_hdcp_out_TLAST,
      s_axis_hdcp_tready => intf_net_v_hdmi_tx_hdcp_out_TREADY,
      s_axis_hdcp_tstrb(3 downto 0) => intf_net_v_hdmi_tx_hdcp_out_TSTRB(3 downto 0),
      s_axis_hdcp_tuser(31 downto 0) => intf_net_v_hdmi_tx_hdcp_out_TUSER(31 downto 0),
      s_axis_hdcp_tvalid => intf_net_v_hdmi_tx_hdcp_out_TVALID,
      s_axis_video_aclk => '0',
      s_axis_video_aresetn_in => '0',
      s_axis_video_aresetn_out => NLW_v_hdmi_tx_s_axis_video_aresetn_out_UNCONNECTED,
      sb_status_data(1 downto 0) => SB_STATUS_IN_tdata(1 downto 0),
      sb_status_valid => SB_STATUS_IN_tvalid,
      video_clk => video_clk,
      video_data(47 downto 0) => NATIVE_VID_IN_data(47 downto 0),
      video_data_arb(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      video_de => NATIVE_VID_IN_active_video,
      video_de_arb(1 downto 0) => B"00",
      video_hs => NATIVE_VID_IN_hsync,
      video_hs_arb(1 downto 0) => B"00",
      video_reset => video_rst,
      video_vs => NATIVE_VID_IN_vsync,
      video_vs_arb(1 downto 0) => B"00"
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
    s_axi_cpu_aclk : in STD_LOGIC;
    s_axi_cpu_aresetn : in STD_LOGIC;
    link_clk : in STD_LOGIC;
    s_axis_audio_aclk : in STD_LOGIC;
    s_axis_audio_aresetn : in STD_LOGIC;
    acr_cts : in STD_LOGIC_VECTOR ( 19 downto 0 );
    acr_n : in STD_LOGIC_VECTOR ( 19 downto 0 );
    acr_valid : in STD_LOGIC;
    hpd : in STD_LOGIC;
    irq : out STD_LOGIC;
    video_clk : in STD_LOGIC;
    video_rst : out STD_LOGIC;
    NATIVE_VID_IN_active_video : in STD_LOGIC;
    NATIVE_VID_IN_data : in STD_LOGIC_VECTOR ( 47 downto 0 );
    NATIVE_VID_IN_hsync : in STD_LOGIC;
    NATIVE_VID_IN_vsync : in STD_LOGIC;
    SB_STATUS_IN_tdata : in STD_LOGIC_VECTOR ( 1 downto 0 );
    SB_STATUS_IN_tvalid : in STD_LOGIC;
    AUDIO_IN_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    AUDIO_IN_tid : in STD_LOGIC_VECTOR ( 7 downto 0 );
    AUDIO_IN_tready : out STD_LOGIC;
    AUDIO_IN_tvalid : in STD_LOGIC;
    S_AXI_CPU_IN_araddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    S_AXI_CPU_IN_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_CPU_IN_arready : out STD_LOGIC;
    S_AXI_CPU_IN_arvalid : in STD_LOGIC;
    S_AXI_CPU_IN_awaddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    S_AXI_CPU_IN_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_CPU_IN_awready : out STD_LOGIC;
    S_AXI_CPU_IN_awvalid : in STD_LOGIC;
    S_AXI_CPU_IN_bready : in STD_LOGIC;
    S_AXI_CPU_IN_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_CPU_IN_bvalid : out STD_LOGIC;
    S_AXI_CPU_IN_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_CPU_IN_rready : in STD_LOGIC;
    S_AXI_CPU_IN_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_CPU_IN_rvalid : out STD_LOGIC;
    S_AXI_CPU_IN_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_CPU_IN_wready : out STD_LOGIC;
    S_AXI_CPU_IN_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_CPU_IN_wvalid : in STD_LOGIC;
    DDC_OUT_scl_i : in STD_LOGIC;
    DDC_OUT_scl_o : out STD_LOGIC;
    DDC_OUT_scl_t : out STD_LOGIC;
    DDC_OUT_sda_i : in STD_LOGIC;
    DDC_OUT_sda_o : out STD_LOGIC;
    DDC_OUT_sda_t : out STD_LOGIC;
    LINK_DATA0_OUT_tdata : out STD_LOGIC_VECTOR ( 19 downto 0 );
    LINK_DATA0_OUT_tvalid : out STD_LOGIC;
    LINK_DATA1_OUT_tdata : out STD_LOGIC_VECTOR ( 19 downto 0 );
    LINK_DATA1_OUT_tvalid : out STD_LOGIC;
    LINK_DATA2_OUT_tdata : out STD_LOGIC_VECTOR ( 19 downto 0 );
    LINK_DATA2_OUT_tvalid : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "HDMI_transmitter,bd_5fd0,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "bd_5fd0,Vivado 2021.2";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of inst : label is "HDMI_transmitter.hwdef";
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of AUDIO_IN_tready : signal is "xilinx.com:interface:axis:1.0 AUDIO_IN TREADY";
  attribute X_INTERFACE_INFO of AUDIO_IN_tvalid : signal is "xilinx.com:interface:axis:1.0 AUDIO_IN TVALID";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of AUDIO_IN_tvalid : signal is "XIL_INTERFACENAME AUDIO_IN, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 8, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN bd_5fd0_s_axis_audio_aclk, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of DDC_OUT_scl_i : signal is "xilinx.com:interface:iic:1.0 DDC_OUT SCL_I";
  attribute X_INTERFACE_INFO of DDC_OUT_scl_o : signal is "xilinx.com:interface:iic:1.0 DDC_OUT SCL_O";
  attribute X_INTERFACE_INFO of DDC_OUT_scl_t : signal is "xilinx.com:interface:iic:1.0 DDC_OUT SCL_T";
  attribute X_INTERFACE_INFO of DDC_OUT_sda_i : signal is "xilinx.com:interface:iic:1.0 DDC_OUT SDA_I";
  attribute X_INTERFACE_INFO of DDC_OUT_sda_o : signal is "xilinx.com:interface:iic:1.0 DDC_OUT SDA_O";
  attribute X_INTERFACE_INFO of DDC_OUT_sda_t : signal is "xilinx.com:interface:iic:1.0 DDC_OUT SDA_T";
  attribute X_INTERFACE_INFO of LINK_DATA0_OUT_tvalid : signal is "xilinx.com:interface:axis:1.0 LINK_DATA0_OUT TVALID";
  attribute X_INTERFACE_PARAMETER of LINK_DATA0_OUT_tvalid : signal is "XIL_INTERFACENAME LINK_DATA0_OUT, TDATA_NUM_BYTES 2, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 0, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 74250000, PHASE 0.0, CLK_DOMAIN bd_5fd0_link_clk, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of LINK_DATA1_OUT_tvalid : signal is "xilinx.com:interface:axis:1.0 LINK_DATA1_OUT TVALID";
  attribute X_INTERFACE_PARAMETER of LINK_DATA1_OUT_tvalid : signal is "XIL_INTERFACENAME LINK_DATA1_OUT, TDATA_NUM_BYTES 2, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 0, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 74250000, PHASE 0.0, CLK_DOMAIN bd_5fd0_link_clk, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of LINK_DATA2_OUT_tvalid : signal is "xilinx.com:interface:axis:1.0 LINK_DATA2_OUT TVALID";
  attribute X_INTERFACE_PARAMETER of LINK_DATA2_OUT_tvalid : signal is "XIL_INTERFACENAME LINK_DATA2_OUT, TDATA_NUM_BYTES 2, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 0, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 74250000, PHASE 0.0, CLK_DOMAIN bd_5fd0_link_clk, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of NATIVE_VID_IN_active_video : signal is "xilinx.com:interface:vid_io:1.0 NATIVE_VID_IN ACTIVE_VIDEO";
  attribute X_INTERFACE_INFO of NATIVE_VID_IN_hsync : signal is "xilinx.com:interface:vid_io:1.0 NATIVE_VID_IN HSYNC";
  attribute X_INTERFACE_INFO of NATIVE_VID_IN_vsync : signal is "xilinx.com:interface:vid_io:1.0 NATIVE_VID_IN VSYNC";
  attribute X_INTERFACE_INFO of SB_STATUS_IN_tvalid : signal is "xilinx.com:interface:axis:1.0 SB_STATUS_IN TVALID";
  attribute X_INTERFACE_PARAMETER of SB_STATUS_IN_tvalid : signal is "XIL_INTERFACENAME SB_STATUS_IN, TDATA_NUM_BYTES 0, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 0, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 200000000, PHASE 0.0, CLK_DOMAIN bd_5fd0_s_axi_cpu_aclk, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of S_AXI_CPU_IN_arready : signal is "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN ARREADY";
  attribute X_INTERFACE_INFO of S_AXI_CPU_IN_arvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN ARVALID";
  attribute X_INTERFACE_INFO of S_AXI_CPU_IN_awready : signal is "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN AWREADY";
  attribute X_INTERFACE_INFO of S_AXI_CPU_IN_awvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN AWVALID";
  attribute X_INTERFACE_INFO of S_AXI_CPU_IN_bready : signal is "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN BREADY";
  attribute X_INTERFACE_INFO of S_AXI_CPU_IN_bvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN BVALID";
  attribute X_INTERFACE_INFO of S_AXI_CPU_IN_rready : signal is "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN RREADY";
  attribute X_INTERFACE_INFO of S_AXI_CPU_IN_rvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN RVALID";
  attribute X_INTERFACE_INFO of S_AXI_CPU_IN_wready : signal is "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN WREADY";
  attribute X_INTERFACE_INFO of S_AXI_CPU_IN_wvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN WVALID";
  attribute X_INTERFACE_PARAMETER of S_AXI_CPU_IN_wvalid : signal is "XIL_INTERFACENAME S_AXI_CPU_IN, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 200000000, ID_WIDTH 0, ADDR_WIDTH 9, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN bd_5fd0_s_axi_cpu_aclk, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of irq : signal is "xilinx.com:signal:interrupt:1.0 INTR.irq INTERRUPT";
  attribute X_INTERFACE_PARAMETER of irq : signal is "XIL_INTERFACENAME INTR.irq, SENSITIVITY LEVEL_HIGH, PortWidth 1";
  attribute X_INTERFACE_INFO of link_clk : signal is "xilinx.com:signal:clock:1.0 CLK.link_clk CLK";
  attribute X_INTERFACE_PARAMETER of link_clk : signal is "XIL_INTERFACENAME CLK.link_clk, FREQ_HZ 74250000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN bd_5fd0_link_clk, ASSOCIATED_BUSIF LINK_DATA0_OUT:LINK_DATA1_OUT:LINK_DATA2_OUT, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_axi_cpu_aclk : signal is "xilinx.com:signal:clock:1.0 CLK.s_axi_cpu_aclk CLK";
  attribute X_INTERFACE_PARAMETER of s_axi_cpu_aclk : signal is "XIL_INTERFACENAME CLK.s_axi_cpu_aclk, FREQ_HZ 200000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN bd_5fd0_s_axi_cpu_aclk, ASSOCIATED_BUSIF SB_STATUS_IN:S_AXI_CPU_IN, ASSOCIATED_RESET s_axi_cpu_aresetn, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_axi_cpu_aresetn : signal is "xilinx.com:signal:reset:1.0 RST.s_axi_cpu_aresetn RST";
  attribute X_INTERFACE_PARAMETER of s_axi_cpu_aresetn : signal is "XIL_INTERFACENAME RST.s_axi_cpu_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_axis_audio_aclk : signal is "xilinx.com:signal:clock:1.0 CLK.s_axis_audio_aclk CLK";
  attribute X_INTERFACE_PARAMETER of s_axis_audio_aclk : signal is "XIL_INTERFACENAME CLK.s_axis_audio_aclk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN bd_5fd0_s_axis_audio_aclk, ASSOCIATED_BUSIF AUDIO_IN, ASSOCIATED_RESET s_axis_audio_aresetn, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_axis_audio_aresetn : signal is "xilinx.com:signal:reset:1.0 RST.s_axis_audio_aresetn RST";
  attribute X_INTERFACE_PARAMETER of s_axis_audio_aresetn : signal is "XIL_INTERFACENAME RST.s_axis_audio_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of video_clk : signal is "xilinx.com:signal:clock:1.0 CLK.video_clk CLK";
  attribute X_INTERFACE_PARAMETER of video_clk : signal is "XIL_INTERFACENAME CLK.video_clk, FREQ_HZ 148500000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN bd_5fd0_video_clk, ASSOCIATED_BUSIF NATIVE_VID_IN, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of video_rst : signal is "xilinx.com:signal:reset:1.0 RST.video_rst RST";
  attribute X_INTERFACE_PARAMETER of video_rst : signal is "XIL_INTERFACENAME RST.video_rst, POLARITY ACTIVE_HIGH, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of AUDIO_IN_tdata : signal is "xilinx.com:interface:axis:1.0 AUDIO_IN TDATA";
  attribute X_INTERFACE_INFO of AUDIO_IN_tid : signal is "xilinx.com:interface:axis:1.0 AUDIO_IN TID";
  attribute X_INTERFACE_INFO of LINK_DATA0_OUT_tdata : signal is "xilinx.com:interface:axis:1.0 LINK_DATA0_OUT TDATA";
  attribute X_INTERFACE_INFO of LINK_DATA1_OUT_tdata : signal is "xilinx.com:interface:axis:1.0 LINK_DATA1_OUT TDATA";
  attribute X_INTERFACE_INFO of LINK_DATA2_OUT_tdata : signal is "xilinx.com:interface:axis:1.0 LINK_DATA2_OUT TDATA";
  attribute X_INTERFACE_INFO of NATIVE_VID_IN_data : signal is "xilinx.com:interface:vid_io:1.0 NATIVE_VID_IN DATA";
  attribute X_INTERFACE_INFO of SB_STATUS_IN_tdata : signal is "xilinx.com:interface:axis:1.0 SB_STATUS_IN TDATA";
  attribute X_INTERFACE_INFO of S_AXI_CPU_IN_araddr : signal is "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN ARADDR";
  attribute X_INTERFACE_INFO of S_AXI_CPU_IN_arprot : signal is "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN ARPROT";
  attribute X_INTERFACE_INFO of S_AXI_CPU_IN_awaddr : signal is "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN AWADDR";
  attribute X_INTERFACE_INFO of S_AXI_CPU_IN_awprot : signal is "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN AWPROT";
  attribute X_INTERFACE_INFO of S_AXI_CPU_IN_bresp : signal is "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN BRESP";
  attribute X_INTERFACE_INFO of S_AXI_CPU_IN_rdata : signal is "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN RDATA";
  attribute X_INTERFACE_INFO of S_AXI_CPU_IN_rresp : signal is "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN RRESP";
  attribute X_INTERFACE_INFO of S_AXI_CPU_IN_wdata : signal is "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN WDATA";
  attribute X_INTERFACE_INFO of S_AXI_CPU_IN_wstrb : signal is "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN WSTRB";
begin
inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_bd_5fd0
     port map (
      AUDIO_IN_tdata(31 downto 0) => AUDIO_IN_tdata(31 downto 0),
      AUDIO_IN_tid(7 downto 0) => AUDIO_IN_tid(7 downto 0),
      AUDIO_IN_tready => AUDIO_IN_tready,
      AUDIO_IN_tvalid => AUDIO_IN_tvalid,
      DDC_OUT_scl_i => DDC_OUT_scl_i,
      DDC_OUT_scl_o => DDC_OUT_scl_o,
      DDC_OUT_scl_t => DDC_OUT_scl_t,
      DDC_OUT_sda_i => DDC_OUT_sda_i,
      DDC_OUT_sda_o => DDC_OUT_sda_o,
      DDC_OUT_sda_t => DDC_OUT_sda_t,
      LINK_DATA0_OUT_tdata(19 downto 0) => LINK_DATA0_OUT_tdata(19 downto 0),
      LINK_DATA0_OUT_tvalid => LINK_DATA0_OUT_tvalid,
      LINK_DATA1_OUT_tdata(19 downto 0) => LINK_DATA1_OUT_tdata(19 downto 0),
      LINK_DATA1_OUT_tvalid => LINK_DATA1_OUT_tvalid,
      LINK_DATA2_OUT_tdata(19 downto 0) => LINK_DATA2_OUT_tdata(19 downto 0),
      LINK_DATA2_OUT_tvalid => LINK_DATA2_OUT_tvalid,
      NATIVE_VID_IN_active_video => NATIVE_VID_IN_active_video,
      NATIVE_VID_IN_data(47 downto 0) => NATIVE_VID_IN_data(47 downto 0),
      NATIVE_VID_IN_hsync => NATIVE_VID_IN_hsync,
      NATIVE_VID_IN_vsync => NATIVE_VID_IN_vsync,
      SB_STATUS_IN_tdata(1 downto 0) => SB_STATUS_IN_tdata(1 downto 0),
      SB_STATUS_IN_tvalid => SB_STATUS_IN_tvalid,
      S_AXI_CPU_IN_araddr(8 downto 0) => S_AXI_CPU_IN_araddr(8 downto 0),
      S_AXI_CPU_IN_arprot(2 downto 0) => S_AXI_CPU_IN_arprot(2 downto 0),
      S_AXI_CPU_IN_arready => S_AXI_CPU_IN_arready,
      S_AXI_CPU_IN_arvalid => S_AXI_CPU_IN_arvalid,
      S_AXI_CPU_IN_awaddr(8 downto 0) => S_AXI_CPU_IN_awaddr(8 downto 0),
      S_AXI_CPU_IN_awprot(2 downto 0) => S_AXI_CPU_IN_awprot(2 downto 0),
      S_AXI_CPU_IN_awready => S_AXI_CPU_IN_awready,
      S_AXI_CPU_IN_awvalid => S_AXI_CPU_IN_awvalid,
      S_AXI_CPU_IN_bready => S_AXI_CPU_IN_bready,
      S_AXI_CPU_IN_bresp(1 downto 0) => S_AXI_CPU_IN_bresp(1 downto 0),
      S_AXI_CPU_IN_bvalid => S_AXI_CPU_IN_bvalid,
      S_AXI_CPU_IN_rdata(31 downto 0) => S_AXI_CPU_IN_rdata(31 downto 0),
      S_AXI_CPU_IN_rready => S_AXI_CPU_IN_rready,
      S_AXI_CPU_IN_rresp(1 downto 0) => S_AXI_CPU_IN_rresp(1 downto 0),
      S_AXI_CPU_IN_rvalid => S_AXI_CPU_IN_rvalid,
      S_AXI_CPU_IN_wdata(31 downto 0) => S_AXI_CPU_IN_wdata(31 downto 0),
      S_AXI_CPU_IN_wready => S_AXI_CPU_IN_wready,
      S_AXI_CPU_IN_wstrb(3 downto 0) => S_AXI_CPU_IN_wstrb(3 downto 0),
      S_AXI_CPU_IN_wvalid => S_AXI_CPU_IN_wvalid,
      acr_cts(19 downto 0) => acr_cts(19 downto 0),
      acr_n(19 downto 0) => acr_n(19 downto 0),
      acr_valid => acr_valid,
      hpd => hpd,
      irq => irq,
      link_clk => link_clk,
      s_axi_cpu_aclk => s_axi_cpu_aclk,
      s_axi_cpu_aresetn => s_axi_cpu_aresetn,
      s_axis_audio_aclk => s_axis_audio_aclk,
      s_axis_audio_aresetn => s_axis_audio_aresetn,
      video_clk => video_clk,
      video_rst => video_rst
    );
end STRUCTURE;

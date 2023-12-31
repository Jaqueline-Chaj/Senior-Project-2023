-- Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
-- Date        : Mon Oct  9 15:57:51 2023
-- Host        : ARM144-11 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               h:/Senior-Project-2023/SENIOR_PROJECT/HDMI_Block/HDMI_Block.gen/sources_1/ip/HDMI_transmitter/HDMI_transmitter_stub.vhdl
-- Design      : HDMI_transmitter
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tfgg484-2L
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity HDMI_transmitter is
  Port ( 
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

end HDMI_transmitter;

architecture stub of HDMI_transmitter is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "s_axi_cpu_aclk,s_axi_cpu_aresetn,link_clk,s_axis_audio_aclk,s_axis_audio_aresetn,acr_cts[19:0],acr_n[19:0],acr_valid,hpd,irq,video_clk,video_rst,NATIVE_VID_IN_active_video,NATIVE_VID_IN_data[47:0],NATIVE_VID_IN_hsync,NATIVE_VID_IN_vsync,SB_STATUS_IN_tdata[1:0],SB_STATUS_IN_tvalid,AUDIO_IN_tdata[31:0],AUDIO_IN_tid[7:0],AUDIO_IN_tready,AUDIO_IN_tvalid,S_AXI_CPU_IN_araddr[8:0],S_AXI_CPU_IN_arprot[2:0],S_AXI_CPU_IN_arready,S_AXI_CPU_IN_arvalid,S_AXI_CPU_IN_awaddr[8:0],S_AXI_CPU_IN_awprot[2:0],S_AXI_CPU_IN_awready,S_AXI_CPU_IN_awvalid,S_AXI_CPU_IN_bready,S_AXI_CPU_IN_bresp[1:0],S_AXI_CPU_IN_bvalid,S_AXI_CPU_IN_rdata[31:0],S_AXI_CPU_IN_rready,S_AXI_CPU_IN_rresp[1:0],S_AXI_CPU_IN_rvalid,S_AXI_CPU_IN_wdata[31:0],S_AXI_CPU_IN_wready,S_AXI_CPU_IN_wstrb[3:0],S_AXI_CPU_IN_wvalid,DDC_OUT_scl_i,DDC_OUT_scl_o,DDC_OUT_scl_t,DDC_OUT_sda_i,DDC_OUT_sda_o,DDC_OUT_sda_t,LINK_DATA0_OUT_tdata[19:0],LINK_DATA0_OUT_tvalid,LINK_DATA1_OUT_tdata[19:0],LINK_DATA1_OUT_tvalid,LINK_DATA2_OUT_tdata[19:0],LINK_DATA2_OUT_tvalid";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "bd_5fd0,Vivado 2021.2";
begin
end;

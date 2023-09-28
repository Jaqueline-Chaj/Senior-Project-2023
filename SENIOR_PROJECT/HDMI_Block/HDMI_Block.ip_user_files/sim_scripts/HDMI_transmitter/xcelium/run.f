-makelib xcelium_lib/xilinx_vip -sv \
  "C:/Xilinx/Vivado/2021.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
  "C:/Xilinx/Vivado/2021.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
  "C:/Xilinx/Vivado/2021.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
  "C:/Xilinx/Vivado/2021.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
  "C:/Xilinx/Vivado/2021.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
  "C:/Xilinx/Vivado/2021.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
  "C:/Xilinx/Vivado/2021.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
  "C:/Xilinx/Vivado/2021.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
  "C:/Xilinx/Vivado/2021.2/data/xilinx_vip/hdl/rst_vip_if.sv" \
-endlib
-makelib xcelium_lib/xpm -sv \
  "C:/Xilinx/Vivado/2021.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "C:/Xilinx/Vivado/2021.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
  "C:/Xilinx/Vivado/2021.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "C:/Xilinx/Vivado/2021.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/v_hdmi_tx_v3_0_0 -sv \
  "../../../ipstatic/hdl/v_hdmi_tx_v3_0_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
  "../../../../HDMI IP TEST.gen/sources_1/ip/HDMI_transmitter/bd_0/ip/ip_0/sim/bd_5fd0_v_hdmi_tx_0.sv" \
-endlib
-makelib xcelium_lib/xlconstant_v1_1_7 \
  "../../../ipstatic/hdl/xlconstant_v1_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../../HDMI IP TEST.gen/sources_1/ip/HDMI_transmitter/bd_0/ip/ip_1/sim/bd_5fd0_const_0_1bit_0.v" \
  "../../../../HDMI IP TEST.gen/sources_1/ip/HDMI_transmitter/bd_0/sim/bd_5fd0.v" \
  "../../../../HDMI IP TEST.gen/sources_1/ip/HDMI_transmitter/sim/HDMI_transmitter.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib


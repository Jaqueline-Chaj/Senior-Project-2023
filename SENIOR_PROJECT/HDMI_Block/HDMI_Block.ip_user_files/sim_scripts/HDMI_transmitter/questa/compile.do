vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xilinx_vip
vlib questa_lib/msim/xpm
vlib questa_lib/msim/v_hdmi_tx_v3_0_0
vlib questa_lib/msim/xil_defaultlib
vlib questa_lib/msim/xlconstant_v1_1_7

vmap xilinx_vip questa_lib/msim/xilinx_vip
vmap xpm questa_lib/msim/xpm
vmap v_hdmi_tx_v3_0_0 questa_lib/msim/v_hdmi_tx_v3_0_0
vmap xil_defaultlib questa_lib/msim/xil_defaultlib
vmap xlconstant_v1_1_7 questa_lib/msim/xlconstant_v1_1_7

vlog -work xilinx_vip  -incr -mfcu -sv -L v_hdmi_tx_v3_0_0 "+incdir+C:/Xilinx/Vivado/2021.2/data/xilinx_vip/include" \
"C:/Xilinx/Vivado/2021.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"C:/Xilinx/Vivado/2021.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"C:/Xilinx/Vivado/2021.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"C:/Xilinx/Vivado/2021.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"C:/Xilinx/Vivado/2021.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"C:/Xilinx/Vivado/2021.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"C:/Xilinx/Vivado/2021.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
"C:/Xilinx/Vivado/2021.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
"C:/Xilinx/Vivado/2021.2/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm  -incr -mfcu -sv -L v_hdmi_tx_v3_0_0 "+incdir+C:/Xilinx/Vivado/2021.2/data/xilinx_vip/include" \
"C:/Xilinx/Vivado/2021.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2021.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"C:/Xilinx/Vivado/2021.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm  -93 \
"C:/Xilinx/Vivado/2021.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work v_hdmi_tx_v3_0_0  -incr -mfcu -sv -L v_hdmi_tx_v3_0_0 "+incdir+C:/Xilinx/Vivado/2021.2/data/xilinx_vip/include" \
"../../../ipstatic/hdl/v_hdmi_tx_v3_0_rfs.sv" \

vlog -work xil_defaultlib  -incr -mfcu -sv -L v_hdmi_tx_v3_0_0 "+incdir+C:/Xilinx/Vivado/2021.2/data/xilinx_vip/include" \
"../../../../HDMI IP TEST.gen/sources_1/ip/HDMI_transmitter/bd_0/ip/ip_0/sim/bd_5fd0_v_hdmi_tx_0.sv" \

vlog -work xlconstant_v1_1_7  -incr -mfcu "+incdir+C:/Xilinx/Vivado/2021.2/data/xilinx_vip/include" \
"../../../ipstatic/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -mfcu "+incdir+C:/Xilinx/Vivado/2021.2/data/xilinx_vip/include" \
"../../../../HDMI IP TEST.gen/sources_1/ip/HDMI_transmitter/bd_0/ip/ip_1/sim/bd_5fd0_const_0_1bit_0.v" \
"../../../../HDMI IP TEST.gen/sources_1/ip/HDMI_transmitter/bd_0/sim/bd_5fd0.v" \
"../../../../HDMI IP TEST.gen/sources_1/ip/HDMI_transmitter/sim/HDMI_transmitter.v" \

vlog -work xil_defaultlib \
"glbl.v"


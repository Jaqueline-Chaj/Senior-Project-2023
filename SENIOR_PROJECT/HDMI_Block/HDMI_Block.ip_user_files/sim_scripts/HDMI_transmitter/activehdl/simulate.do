onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+HDMI_transmitter -L xilinx_vip -L xpm -L v_hdmi_tx_v3_0_0 -L xil_defaultlib -L xlconstant_v1_1_7 -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.HDMI_transmitter xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure

do {HDMI_transmitter.udo}

run -all

endsim

quit -force

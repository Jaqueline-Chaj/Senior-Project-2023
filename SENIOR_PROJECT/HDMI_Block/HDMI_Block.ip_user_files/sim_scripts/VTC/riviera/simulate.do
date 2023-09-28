onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+VTC -L xilinx_vip -L xpm -L axi_lite_ipif_v3_0_4 -L v_tc_v6_2_3 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.VTC xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure

do {VTC.udo}

run -all

endsim

quit -force

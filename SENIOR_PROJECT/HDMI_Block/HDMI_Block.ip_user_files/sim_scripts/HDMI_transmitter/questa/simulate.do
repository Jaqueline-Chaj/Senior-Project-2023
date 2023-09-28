onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib HDMI_transmitter_opt

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {HDMI_transmitter.udo}

run -all

quit -force

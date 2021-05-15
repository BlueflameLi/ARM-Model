onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib Inst_ROM_opt

do {wave.do}

view wave
view structure
view signals

do {Inst_ROM.udo}

run -all

quit -force

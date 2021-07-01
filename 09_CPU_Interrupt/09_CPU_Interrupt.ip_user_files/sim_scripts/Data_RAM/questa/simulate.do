onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib Data_RAM_opt

do {wave.do}

view wave
view structure
view signals

do {Data_RAM.udo}

run -all

quit -force

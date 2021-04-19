vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib

vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xil_defaultlib -64 \
"../../../../03_ALU.srcs/sources_1/ip/ALU_Shift_0/src/ALU.v" \
"../../../../03_ALU.srcs/sources_1/ip/ALU_Shift_0/src/Shift.v" \
"../../../../03_ALU.srcs/sources_1/ip/ALU_Shift_0/src/ALU_Shift.v" \
"../../../../03_ALU.srcs/sources_1/ip/ALU_Shift_0/sim/ALU_Shift_0.v" \


vlog -work xil_defaultlib \
"glbl.v"


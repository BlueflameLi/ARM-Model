
i
Command: %s
53*	vivadotcl28
$write_bitstream -force board_cpu.bit2default:defaultZ4-113h px? 
?
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7a100t2default:defaultZ17-347h px? 
?
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7a100t2default:defaultZ17-349h px? 
x
,Running DRC as a precondition to command %s
1349*	planAhead2#
write_bitstream2default:defaultZ12-1349h px? 
>
IP Catalog is up to date.1232*coregenZ19-1839h px? 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px? 
?
?Missing CFGBVS and CONFIG_VOLTAGE Design Properties: Neither the CFGBVS nor CONFIG_VOLTAGE voltage property is set in the current_design.  Configuration bank voltage select (CFGBVS) must be set to VCCO or GND, and CONFIG_VOLTAGE must be set to the correct configuration voltage, in order to determine the I/O voltage support for the pins in bank 0.  It is suggested to specify these either using the 'Edit Device Properties' function in the GUI or directly in the XDC file using the following syntax:

 set_property CFGBVS value1 [current_design]
 #where value1 is either VCCO or GND

 set_property CONFIG_VOLTAGE value2 [current_design]
 #where value2 is the voltage provided to configuration bank 0

Refer to the device configuration user guide for more information.%s*DRC2(
 DRC|Pin Planning2default:default8ZCFGBVS-1h px? 
?
YReport rule limit reached: REQP-1840 rule limit reached: 20 violations have been found.%s*DRC29
 !DRC|DRC System|Rule limit reached2default:default8ZCHECK-3h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2t
 "^
#cpu/CPSR_Instance/D_CPSR_31_28/clk0#cpu/CPSR_Instance/D_CPSR_31_28/clk02default:default2default:default2?
 "j
)cpu/CPSR_Instance/D_CPSR_31_28/q[3]_i_2/O)cpu/CPSR_Instance/D_CPSR_31_28/q[3]_i_2/O2default:default2default:default2|
 "f
'cpu/CPSR_Instance/D_CPSR_31_28/q[3]_i_2	'cpu/CPSR_Instance/D_CPSR_31_28/q[3]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2m
 "W
!cpu/CPSR_Instance/D_CPSR_7_0/E[0]cpu/CPSR_Instance/D_CPSR_7_0/E2default:default2default:default2?
 "?
4cpu/CPSR_Instance/D_CPSR_7_0/Curr_SPSR_reg[31]_i_2/O4cpu/CPSR_Instance/D_CPSR_7_0/Curr_SPSR_reg[31]_i_2/O2default:default2default:default2?
 "|
2cpu/CPSR_Instance/D_CPSR_7_0/Curr_SPSR_reg[31]_i_2	2cpu/CPSR_Instance/D_CPSR_7_0/Curr_SPSR_reg[31]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2|
 "f
'cpu/CPSR_Instance/D_CPSR_7_0/clk022_out'cpu/CPSR_Instance/D_CPSR_7_0/clk022_out2default:default2default:default2|
 "f
'cpu/CPSR_Instance/D_CPSR_7_0/q[7]_i_2/O'cpu/CPSR_Instance/D_CPSR_7_0/q[7]_i_2/O2default:default2default:default2x
 "b
%cpu/CPSR_Instance/D_CPSR_7_0/q[7]_i_2	%cpu/CPSR_Instance/D_CPSR_7_0/q[7]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2|
 "f
'cpu/CPSR_Instance/D_SPSR_fiq/clk018_out'cpu/CPSR_Instance/D_SPSR_fiq/clk018_out2default:default2default:default2~
 "h
(cpu/CPSR_Instance/D_SPSR_fiq/q[31]_i_2/O(cpu/CPSR_Instance/D_SPSR_fiq/q[31]_i_2/O2default:default2default:default2z
 "d
&cpu/CPSR_Instance/D_SPSR_fiq/q[31]_i_2	&cpu/CPSR_Instance/D_SPSR_fiq/q[31]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2|
 "f
'cpu/CPSR_Instance/D_SPSR_irq/clk016_out'cpu/CPSR_Instance/D_SPSR_irq/clk016_out2default:default2default:default2?
 "n
+cpu/CPSR_Instance/D_SPSR_irq/q[31]_i_1__0/O+cpu/CPSR_Instance/D_SPSR_irq/q[31]_i_1__0/O2default:default2default:default2?
 "j
)cpu/CPSR_Instance/D_SPSR_irq/q[31]_i_1__0	)cpu/CPSR_Instance/D_SPSR_irq/q[31]_i_1__02default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2|
 "f
'cpu/CPSR_Instance/D_SPSR_svc/clk010_out'cpu/CPSR_Instance/D_SPSR_svc/clk010_out2default:default2default:default2~
 "h
(cpu/CPSR_Instance/D_SPSR_svc/q[31]_i_1/O(cpu/CPSR_Instance/D_SPSR_svc/q[31]_i_1/O2default:default2default:default2z
 "d
&cpu/CPSR_Instance/D_SPSR_svc/q[31]_i_1	&cpu/CPSR_Instance/D_SPSR_svc/q[31]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2D
 ".
cpu/clk_tmpcpu/clk_tmp2default:default2default:default2P
 ":
cpu/Dataram_i_1/Ocpu/Dataram_i_1/O2default:default2default:default2L
 "6
cpu/Dataram_i_1	cpu/Dataram_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Non-Optimal connections which could lead to hold violations: A LUT %s is driving clock pin of 4 cells. This could lead to large hold time violations. Involved cells are:
%s%s*DRC2|
 "f
'cpu/CPSR_Instance/D_CPSR_31_28/q[3]_i_2	'cpu/CPSR_Instance/D_CPSR_31_28/q[3]_i_22default:default2default:default2?
 "f
'cpu/CPSR_Instance/D_CPSR_31_28/q_reg[0]	'cpu/CPSR_Instance/D_CPSR_31_28/q_reg[0]2default:default"f
'cpu/CPSR_Instance/D_CPSR_31_28/q_reg[1]	'cpu/CPSR_Instance/D_CPSR_31_28/q_reg[1]2default:default"f
'cpu/CPSR_Instance/D_CPSR_31_28/q_reg[2]	'cpu/CPSR_Instance/D_CPSR_31_28/q_reg[2]2default:default"f
'cpu/CPSR_Instance/D_CPSR_31_28/q_reg[3]	'cpu/CPSR_Instance/D_CPSR_31_28/q_reg[3]2default:default2default:default2A
 )DRC|Implementation|Placement|DesignChecks2default:default8ZPLHOLDVIO-2h px? 
?
?Non-Optimal connections which could lead to hold violations: A LUT %s is driving clock pin of 5 cells. This could lead to large hold time violations. Involved cells are:
%s%s*DRC2x
 "b
%cpu/CPSR_Instance/D_CPSR_7_0/q[7]_i_2	%cpu/CPSR_Instance/D_CPSR_7_0/q[7]_i_22default:default2default:default2?
 "b
%cpu/CPSR_Instance/D_CPSR_7_0/q_reg[0]	%cpu/CPSR_Instance/D_CPSR_7_0/q_reg[0]2default:default"b
%cpu/CPSR_Instance/D_CPSR_7_0/q_reg[1]	%cpu/CPSR_Instance/D_CPSR_7_0/q_reg[1]2default:default"b
%cpu/CPSR_Instance/D_CPSR_7_0/q_reg[4]	%cpu/CPSR_Instance/D_CPSR_7_0/q_reg[4]2default:default"b
%cpu/CPSR_Instance/D_CPSR_7_0/q_reg[6]	%cpu/CPSR_Instance/D_CPSR_7_0/q_reg[6]2default:default"b
%cpu/CPSR_Instance/D_CPSR_7_0/q_reg[7]	%cpu/CPSR_Instance/D_CPSR_7_0/q_reg[7]2default:default2default:default2A
 )DRC|Implementation|Placement|DesignChecks2default:default8ZPLHOLDVIO-2h px? 
?

?Non-Optimal connections which could lead to hold violations: A LUT %s is driving clock pin of 9 cells. This could lead to large hold time violations. Involved cells are:
%s%s*DRC2z
 "d
&cpu/CPSR_Instance/D_SPSR_fiq/q[31]_i_2	&cpu/CPSR_Instance/D_SPSR_fiq/q[31]_i_22default:default2default:default2?
 "b
%cpu/CPSR_Instance/D_SPSR_fiq/q_reg[0]	%cpu/CPSR_Instance/D_SPSR_fiq/q_reg[0]2default:default"b
%cpu/CPSR_Instance/D_SPSR_fiq/q_reg[1]	%cpu/CPSR_Instance/D_SPSR_fiq/q_reg[1]2default:default"d
&cpu/CPSR_Instance/D_SPSR_fiq/q_reg[28]	&cpu/CPSR_Instance/D_SPSR_fiq/q_reg[28]2default:default"d
&cpu/CPSR_Instance/D_SPSR_fiq/q_reg[29]	&cpu/CPSR_Instance/D_SPSR_fiq/q_reg[29]2default:default"d
&cpu/CPSR_Instance/D_SPSR_fiq/q_reg[30]	&cpu/CPSR_Instance/D_SPSR_fiq/q_reg[30]2default:default"d
&cpu/CPSR_Instance/D_SPSR_fiq/q_reg[31]	&cpu/CPSR_Instance/D_SPSR_fiq/q_reg[31]2default:default"b
%cpu/CPSR_Instance/D_SPSR_fiq/q_reg[4]	%cpu/CPSR_Instance/D_SPSR_fiq/q_reg[4]2default:default"b
%cpu/CPSR_Instance/D_SPSR_fiq/q_reg[6]	%cpu/CPSR_Instance/D_SPSR_fiq/q_reg[6]2default:default"b
%cpu/CPSR_Instance/D_SPSR_fiq/q_reg[7]	%cpu/CPSR_Instance/D_SPSR_fiq/q_reg[7]2default:default2default:default2A
 )DRC|Implementation|Placement|DesignChecks2default:default8ZPLHOLDVIO-2h px? 
?

?Non-Optimal connections which could lead to hold violations: A LUT %s is driving clock pin of 9 cells. This could lead to large hold time violations. Involved cells are:
%s%s*DRC2?
 "j
)cpu/CPSR_Instance/D_SPSR_irq/q[31]_i_1__0	)cpu/CPSR_Instance/D_SPSR_irq/q[31]_i_1__02default:default2default:default2?
 "b
%cpu/CPSR_Instance/D_SPSR_irq/q_reg[0]	%cpu/CPSR_Instance/D_SPSR_irq/q_reg[0]2default:default"b
%cpu/CPSR_Instance/D_SPSR_irq/q_reg[1]	%cpu/CPSR_Instance/D_SPSR_irq/q_reg[1]2default:default"d
&cpu/CPSR_Instance/D_SPSR_irq/q_reg[28]	&cpu/CPSR_Instance/D_SPSR_irq/q_reg[28]2default:default"d
&cpu/CPSR_Instance/D_SPSR_irq/q_reg[29]	&cpu/CPSR_Instance/D_SPSR_irq/q_reg[29]2default:default"d
&cpu/CPSR_Instance/D_SPSR_irq/q_reg[30]	&cpu/CPSR_Instance/D_SPSR_irq/q_reg[30]2default:default"d
&cpu/CPSR_Instance/D_SPSR_irq/q_reg[31]	&cpu/CPSR_Instance/D_SPSR_irq/q_reg[31]2default:default"b
%cpu/CPSR_Instance/D_SPSR_irq/q_reg[4]	%cpu/CPSR_Instance/D_SPSR_irq/q_reg[4]2default:default"b
%cpu/CPSR_Instance/D_SPSR_irq/q_reg[6]	%cpu/CPSR_Instance/D_SPSR_irq/q_reg[6]2default:default"b
%cpu/CPSR_Instance/D_SPSR_irq/q_reg[7]	%cpu/CPSR_Instance/D_SPSR_irq/q_reg[7]2default:default2default:default2A
 )DRC|Implementation|Placement|DesignChecks2default:default8ZPLHOLDVIO-2h px? 
?

?Non-Optimal connections which could lead to hold violations: A LUT %s is driving clock pin of 9 cells. This could lead to large hold time violations. Involved cells are:
%s%s*DRC2z
 "d
&cpu/CPSR_Instance/D_SPSR_svc/q[31]_i_1	&cpu/CPSR_Instance/D_SPSR_svc/q[31]_i_12default:default2default:default2?
 "b
%cpu/CPSR_Instance/D_SPSR_svc/q_reg[0]	%cpu/CPSR_Instance/D_SPSR_svc/q_reg[0]2default:default"b
%cpu/CPSR_Instance/D_SPSR_svc/q_reg[1]	%cpu/CPSR_Instance/D_SPSR_svc/q_reg[1]2default:default"d
&cpu/CPSR_Instance/D_SPSR_svc/q_reg[28]	&cpu/CPSR_Instance/D_SPSR_svc/q_reg[28]2default:default"d
&cpu/CPSR_Instance/D_SPSR_svc/q_reg[29]	&cpu/CPSR_Instance/D_SPSR_svc/q_reg[29]2default:default"d
&cpu/CPSR_Instance/D_SPSR_svc/q_reg[30]	&cpu/CPSR_Instance/D_SPSR_svc/q_reg[30]2default:default"d
&cpu/CPSR_Instance/D_SPSR_svc/q_reg[31]	&cpu/CPSR_Instance/D_SPSR_svc/q_reg[31]2default:default"b
%cpu/CPSR_Instance/D_SPSR_svc/q_reg[4]	%cpu/CPSR_Instance/D_SPSR_svc/q_reg[4]2default:default"b
%cpu/CPSR_Instance/D_SPSR_svc/q_reg[6]	%cpu/CPSR_Instance/D_SPSR_svc/q_reg[6]2default:default"b
%cpu/CPSR_Instance/D_SPSR_svc/q_reg[7]	%cpu/CPSR_Instance/D_SPSR_svc/q_reg[7]2default:default2default:default2A
 )DRC|Implementation|Placement|DesignChecks2default:default8ZPLHOLDVIO-2h px? 
?
?Non-Optimal connections which could lead to hold violations: A LUT %s is driving clock pin of 2 cells. This could lead to large hold time violations. Involved cells are:
%s%s*DRC2L
 "6
cpu/Dataram_i_1	cpu/Dataram_i_12default:default2default:default2?
 "?
?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram	?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram2default:default"2
cpu/d_out_reg	cpu/d_out_reg2default:default2default:default2A
 )DRC|Implementation|Placement|DesignChecks2default:default8ZPLHOLDVIO-2h px? 
?
?RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram	?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram2default:default2default:default2?
 "?
?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram/ADDRARDADDR[10]?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram/ADDRARDADDR[10]2default:default2default:default2?
 "?
wcpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/addra[5]wcpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/addra[5]2default:default2default:default2l
 "V
cpu/ALU_Shift_Instance/F_reg[5]	cpu/ALU_Shift_Instance/F_reg[5]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px? 
?
?RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram	?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram2default:default2default:default2?
 "?
?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram/ADDRARDADDR[11]?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram/ADDRARDADDR[11]2default:default2default:default2?
 "?
wcpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/addra[6]wcpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/addra[6]2default:default2default:default2l
 "V
cpu/ALU_Shift_Instance/F_reg[6]	cpu/ALU_Shift_Instance/F_reg[6]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px? 
?
?RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram	?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram2default:default2default:default2?
 "?
?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram/ADDRARDADDR[5]?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram/ADDRARDADDR[5]2default:default2default:default2?
 "?
wcpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/addra[0]wcpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/addra[0]2default:default2default:default2l
 "V
cpu/ALU_Shift_Instance/F_reg[0]	cpu/ALU_Shift_Instance/F_reg[0]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px? 
?
?RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram	?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram2default:default2default:default2?
 "?
?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram/ADDRARDADDR[6]?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram/ADDRARDADDR[6]2default:default2default:default2?
 "?
wcpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/addra[1]wcpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/addra[1]2default:default2default:default2l
 "V
cpu/ALU_Shift_Instance/F_reg[1]	cpu/ALU_Shift_Instance/F_reg[1]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px? 
?
?RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram	?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram2default:default2default:default2?
 "?
?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram/ADDRARDADDR[7]?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram/ADDRARDADDR[7]2default:default2default:default2?
 "?
wcpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/addra[2]wcpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/addra[2]2default:default2default:default2l
 "V
cpu/ALU_Shift_Instance/F_reg[2]	cpu/ALU_Shift_Instance/F_reg[2]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px? 
?
?RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram	?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram2default:default2default:default2?
 "?
?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram/ADDRARDADDR[8]?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram/ADDRARDADDR[8]2default:default2default:default2?
 "?
wcpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/addra[3]wcpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/addra[3]2default:default2default:default2l
 "V
cpu/ALU_Shift_Instance/F_reg[3]	cpu/ALU_Shift_Instance/F_reg[3]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px? 
?
?RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram	?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram2default:default2default:default2?
 "?
?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram/ADDRARDADDR[9]?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram/ADDRARDADDR[9]2default:default2default:default2?
 "?
wcpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/addra[4]wcpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/addra[4]2default:default2default:default2l
 "V
cpu/ALU_Shift_Instance/F_reg[4]	cpu/ALU_Shift_Instance/F_reg[4]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px? 
?
?RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram	?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram2default:default2default:default2?
 "?
?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram/ADDRBWRADDR[10]?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram/ADDRBWRADDR[10]2default:default2default:default2?
 "?
wcpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/addra[5]wcpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/addra[5]2default:default2default:default2l
 "V
cpu/ALU_Shift_Instance/F_reg[5]	cpu/ALU_Shift_Instance/F_reg[5]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px? 
?
?RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram	?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram2default:default2default:default2?
 "?
?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram/ADDRBWRADDR[11]?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram/ADDRBWRADDR[11]2default:default2default:default2?
 "?
wcpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/addra[6]wcpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/addra[6]2default:default2default:default2l
 "V
cpu/ALU_Shift_Instance/F_reg[6]	cpu/ALU_Shift_Instance/F_reg[6]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px? 
?
?RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram	?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram2default:default2default:default2?
 "?
?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram/ADDRBWRADDR[5]?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram/ADDRBWRADDR[5]2default:default2default:default2?
 "?
wcpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/addra[0]wcpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/addra[0]2default:default2default:default2l
 "V
cpu/ALU_Shift_Instance/F_reg[0]	cpu/ALU_Shift_Instance/F_reg[0]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px? 
?
?RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram	?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram2default:default2default:default2?
 "?
?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram/ADDRBWRADDR[6]?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram/ADDRBWRADDR[6]2default:default2default:default2?
 "?
wcpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/addra[1]wcpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/addra[1]2default:default2default:default2l
 "V
cpu/ALU_Shift_Instance/F_reg[1]	cpu/ALU_Shift_Instance/F_reg[1]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px? 
?
?RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram	?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram2default:default2default:default2?
 "?
?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram/ADDRBWRADDR[7]?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram/ADDRBWRADDR[7]2default:default2default:default2?
 "?
wcpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/addra[2]wcpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/addra[2]2default:default2default:default2l
 "V
cpu/ALU_Shift_Instance/F_reg[2]	cpu/ALU_Shift_Instance/F_reg[2]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px? 
?
?RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram	?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram2default:default2default:default2?
 "?
?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram/ADDRBWRADDR[8]?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram/ADDRBWRADDR[8]2default:default2default:default2?
 "?
wcpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/addra[3]wcpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/addra[3]2default:default2default:default2l
 "V
cpu/ALU_Shift_Instance/F_reg[3]	cpu/ALU_Shift_Instance/F_reg[3]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px? 
?
?RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram	?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram2default:default2default:default2?
 "?
?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram/ADDRBWRADDR[9]?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram/ADDRBWRADDR[9]2default:default2default:default2?
 "?
wcpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/addra[4]wcpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/addra[4]2default:default2default:default2l
 "V
cpu/ALU_Shift_Instance/F_reg[4]	cpu/ALU_Shift_Instance/F_reg[4]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px? 
?
?RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram	?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram2default:default2default:default2?
 "?
?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram/WEA[0]?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram/WEA[0]2default:default2default:default2?
 "?
ucpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/wea[0]rcpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/wea2default:default2default:default2P
 ":
cpu/Mem_Write_reg	cpu/Mem_Write_reg2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px? 
?
?RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram	?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram2default:default2default:default2?
 "?
?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram/WEA[1]?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram/WEA[1]2default:default2default:default2?
 "?
ucpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/wea[0]rcpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/wea2default:default2default:default2P
 ":
cpu/Mem_Write_reg	cpu/Mem_Write_reg2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px? 
?
?RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram	?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram2default:default2default:default2?
 "?
?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram/WEBWE[0]?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram/WEBWE[0]2default:default2default:default2?
 "?
ucpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/wea[0]rcpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/wea2default:default2default:default2P
 ":
cpu/Mem_Write_reg	cpu/Mem_Write_reg2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px? 
?
?RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram	?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram2default:default2default:default2?
 "?
?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram/WEBWE[1]?cpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram/WEBWE[1]2default:default2default:default2?
 "?
ucpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/wea[0]rcpu/Dataram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/wea2default:default2default:default2P
 ":
cpu/Mem_Write_reg	cpu/Mem_Write_reg2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px? 
?
?RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
?cpu/Inst_Instance/Inst_ROM_Instance/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram	?cpu/Inst_Instance/Inst_ROM_Instance/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram2default:default2default:default2?
 "?
?cpu/Inst_Instance/Inst_ROM_Instance/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram/ADDRARDADDR[10]?cpu/Inst_Instance/Inst_ROM_Instance/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram/ADDRARDADDR[10]2default:default2default:default2?
 "?
?cpu/Inst_Instance/Inst_ROM_Instance/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/addra[5]?cpu/Inst_Instance/Inst_ROM_Instance/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/addra[5]2default:default2default:default2d
 "N
cpu/Inst_Instance/PC_reg[7]	cpu/Inst_Instance/PC_reg[7]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px? 
?
?RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2?
 "?
?cpu/Inst_Instance/Inst_ROM_Instance/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram	?cpu/Inst_Instance/Inst_ROM_Instance/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram2default:default2default:default2?
 "?
?cpu/Inst_Instance/Inst_ROM_Instance/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram/ADDRARDADDR[9]?cpu/Inst_Instance/Inst_ROM_Instance/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram/ADDRARDADDR[9]2default:default2default:default2?
 "?
?cpu/Inst_Instance/Inst_ROM_Instance/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/addra[4]?cpu/Inst_Instance/Inst_ROM_Instance/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/addra[4]2default:default2default:default2d
 "N
cpu/Inst_Instance/PC_reg[6]	cpu/Inst_Instance/PC_reg[6]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px? 
g
DRC finished with %s
1905*	planAhead2)
0 Errors, 35 Warnings2default:defaultZ12-3199h px? 
i
BPlease refer to the DRC report (report_drc) for more information.
1906*	planAheadZ12-3200h px? 
i
)Running write_bitstream with %s threads.
1750*designutils2
22default:defaultZ20-2272h px? 
?
Loading data files...
1271*designutilsZ12-1165h px? 
>
Loading site data...
1273*designutilsZ12-1167h px? 
?
Loading route data...
1272*designutilsZ12-1166h px? 
?
Processing options...
1362*designutilsZ12-1514h px? 
<
Creating bitmap...
1249*designutilsZ12-1141h px? 
7
Creating bitstream...
7*	bitstreamZ40-7h px? 
f
%Bitstream compression saved %s bits.
26*	bitstream2
253853442default:defaultZ40-26h px? 
`
Writing bitstream %s...
11*	bitstream2#
./board_cpu.bit2default:defaultZ40-11h px? 
F
Bitgen Completed Successfully.
1606*	planAheadZ12-1842h px? 
?
?WebTalk data collection is mandatory when using a WebPACK part without a full Vivado license. To see the specific WebTalk data collected for your design, open the usage_statistics_webtalk.html or usage_statistics_webtalk.xml file in the implementation directory.
120*projectZ1-120h px? 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
912default:default2
712default:default2
12default:default2
02default:defaultZ4-41h px? 
a
%s completed successfully
29*	vivadotcl2#
write_bitstream2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2%
write_bitstream: 2default:default2
00:00:132default:default2
00:00:122default:default2
1945.8162default:default2
426.1292default:defaultZ17-268h px? 


End Record
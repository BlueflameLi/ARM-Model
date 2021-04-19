// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Mon Apr 19 01:06:33 2021
// Host        : Blueflame running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ ALU_Shift_0_stub.v
// Design      : ALU_Shift_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tfgg484-2L
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "ALU_Shift,Vivado 2018.3" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(SHIFT_OP, Shift_Data, Shift_Num, ALU_OP, A, CF, VF, 
  NZCV, F)
/* synthesis syn_black_box black_box_pad_pin="SHIFT_OP[3:1],Shift_Data[32:1],Shift_Num[8:1],ALU_OP[4:1],A[32:1],CF,VF,NZCV[4:1],F[32:1]" */;
  input [3:1]SHIFT_OP;
  input [32:1]Shift_Data;
  input [8:1]Shift_Num;
  input [4:1]ALU_OP;
  input [32:1]A;
  input CF;
  input VF;
  output [4:1]NZCV;
  output [32:1]F;
endmodule

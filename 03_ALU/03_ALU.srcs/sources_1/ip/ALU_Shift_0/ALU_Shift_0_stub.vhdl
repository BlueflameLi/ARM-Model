-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
-- Date        : Mon Apr 19 01:06:34 2021
-- Host        : Blueflame running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               d:/vivado/03_ALU/03_ALU.srcs/sources_1/ip/ALU_Shift_0/ALU_Shift_0_stub.vhdl
-- Design      : ALU_Shift_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tfgg484-2L
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU_Shift_0 is
  Port ( 
    SHIFT_OP : in STD_LOGIC_VECTOR ( 3 downto 1 );
    Shift_Data : in STD_LOGIC_VECTOR ( 32 downto 1 );
    Shift_Num : in STD_LOGIC_VECTOR ( 8 downto 1 );
    ALU_OP : in STD_LOGIC_VECTOR ( 4 downto 1 );
    A : in STD_LOGIC_VECTOR ( 32 downto 1 );
    CF : in STD_LOGIC;
    VF : in STD_LOGIC;
    NZCV : out STD_LOGIC_VECTOR ( 4 downto 1 );
    F : out STD_LOGIC_VECTOR ( 32 downto 1 )
  );

end ALU_Shift_0;

architecture stub of ALU_Shift_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "SHIFT_OP[3:1],Shift_Data[32:1],Shift_Num[8:1],ALU_OP[4:1],A[32:1],CF,VF,NZCV[4:1],F[32:1]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "ALU_Shift,Vivado 2018.3";
begin
end;

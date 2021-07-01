`timescale 1ns / 1ps
module testcpu();
    wire [31:0] I,A,B,C,F,shift_Out,M_R_Data,M_W_Data;
    wire [3:0] NZCV;
    wire [5:0] Inst_addr;
    wire LA,LB,LC,LF,W_Rdata_s,Mem_W_s,Mem_Write,Reg_C_s,rd_s,ALU_A_s,ALU_B_s;
    wire Write_PC,Write_IR,Write_Reg,S;
    wire rm_imm_s;
    wire [1:0] rs_imm_s,PC_s;
    wire [3:0] ALU_OP;
    wire [2:0] SHIFT_OP;
    wire [31:0] PC;
    reg clk;
    reg Rst;

    wire [3:0] DP;
    CPU cpu(clk,
           Rst,
           I,
           A,
           B,
           C,
           F,
           NZCV,
           Inst_addr,
           Write_PC,
           Write_IR,
           Write_Reg,
           LA,
           LB,
           LC,
           LF,
           rm_imm_s,
           rs_imm_s,
           ALU_OP,
           SHIFT_OP,
           S,
           shift_Out,
           PC_s,
           rd_s,
           ALU_A_s,
           ALU_B_s,
           PC,
           W_Rdata_s,
           Mem_Write,
           Mem_W_s,
           Reg_C_s,
           M_R_Data,
           M_W_Data,
           DP
           );
    initial
    begin
        clk=0; 
        Rst=1;   #20; 
        Rst=0; 
    end
    always
    begin
        #8 clk=~clk;
    end
endmodule

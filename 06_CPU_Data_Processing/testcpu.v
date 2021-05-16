`timescale 1ns / 1ps
module testcpu();
    wire [31:0] I,A,B,C,F;
    wire [3:0] NZCV;
    wire [5:0] Inst_addr;
    wire LA,LB,LC,LF;
    wire Write_PC,Write_IR,Write_Reg,S;
    wire rm_imm_s;
    wire [1:0] rs_imm_s;
    wire [3:0] ALU_OP;
    wire [2:0] SHIFT_OP;
    reg clk;
    reg Rst;
    CPU cpu(clk,Rst,
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
           S);
    initial
    begin
        clk=0; 
        Rst=1;   #100; 
        Rst=0; 
    end
    always
    begin
        #100 clk=~clk;
    end
endmodule

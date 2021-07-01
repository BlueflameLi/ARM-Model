`timescale 1ns / 1ps
module testcpu();
    reg clk, Rst, EX_irq;
    wire [31:0] INT_Vector;
    wire [31:0] I;
    wire [31:0] A,F,M_R_Data,M_W_Data;
    wire Write_PC,Write_IR,Write_Reg,S;
    wire rm_imm_s;
    wire [1:0] rs_imm_s,PC_s;
    wire [3:0] ALU_OP;
    wire ALU_A_s,W_Rdata_s,Mem_W_s,Reg_C_s,Mem_Write;
    wire [1:0] rd_s,ALU_B_s;
    wire [2:0] Change_M;
    wire [31:0] CPSR;
    wire [7:2] Inst_addr;
    wire [3:0] DP;
    wire [2:0] W_CPSR_s;

    CPU cpu(
           .clk(clk),
           .Rst(Rst),       
           .EX_irq(EX_irq),
           .INT_Vector(INT_Vector),
           .I(I),
           .A(A),
           .F(F),
           .CPSR(CPSR),
           .Write_PC(Write_PC),
           .Write_IR(Write_IR),
           .Write_Reg(Write_Reg),
           .rm_imm_s(rm_imm_s),
           .rs_imm_s(rs_imm_s),
           .ALU_OP(ALU_OP),
           .S(S),
           .PC_s(PC_s),
           .rd_s(rd_s),
           .ALU_A_s(ALU_A_s),
           .ALU_B_s(ALU_B_s),
           .Inst_addr(Inst_addr),
           .W_Rdata_s(W_Rdata_s),
           .Mem_Write(Mem_Write),
           .Mem_W_s(Mem_W_s),
           .Reg_C_s(Reg_C_s),
           .M_R_Data(M_R_Data),
           .M_W_Data(M_W_Data),
           .DP(DP),
           .Change_M(Change_M),
           .W_CPSR_s(W_CPSR_s)
           );
    initial
    begin
        clk=0; 
        #5 Rst=1;   #25; 
        Rst=0; 
    end
    always
    begin
        #20 clk=~clk;
    end
endmodule

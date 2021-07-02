`timescale 1ns / 1ps
module testcpu();
    reg clk, Rst, EX_irq,EX_fiq;
    reg [31:0] INT_Vector;
    wire [31:0] I;
    wire [31:0] A,B,C,F;
    wire Write_PC,Write_IR,Write_Reg,S,Write_CPSR,Write_SPSR,SP_in,SP_out;
    wire rm_imm_s;
    wire [1:0] rs_imm_s,PC_s;
    wire [3:0] ALU_OP;
    wire ALU_A_s,W_Rdata_s,Reg_C_s,W_SPSR_s;
    wire [1:0] rd_s,ALU_B_s;
    wire [2:0] Change_M,W_CPSR_s;
    wire [31:0] CPSR,SPSR;
    wire [7:2] Inst_addr;
    wire [3:0] DP;
    wire INT_irq,INT_fiq;
    CPU cpu(
    .clk(clk),
    .Rst(Rst),
    .EX_irq(EX_irq),
    .EX_fiq(EX_fiq),
    .INT_Vector(INT_Vector),
    .I(I),
    .A(A),
    .B(B),
    .C(C),
    .F(F),
    .CPSR(CPSR),
    .SPSR(SPSR),
    .Write_PC(Write_PC),
    .Write_IR(Write_IR),
    .Write_Reg(Write_Reg),
    .Write_CPSR(Write_CPSR),
    .Write_SPSR(Write_SPSR),
    .SP_in(SP_in),
    .SP_out(SP_out),
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
    .W_CPSR_s(W_CPSR_s),
    .W_SPSR_s(W_SPSR_s),
    .Reg_C_s(Reg_C_s),
    .INT_irq(INT_irq),
    .INT_fiq(INT_fiq),
    .DP(DP),
    .Change_M(Change_M));
    initial
    begin
        INT_Vector = 8'h00000020;
        clk    = 0;
        EX_irq = 0;
        EX_fiq = 0;
        #5 
        Rst = 1;   
        #45
        Rst = 0;

        #400
        EX_irq = 1;
        #50
        EX_irq = 0;


        #500
        INT_Vector = 8'h00000020;
        EX_irq = 1;
        #50
        EX_irq = 0;

        #300
        INT_Vector = 8'h00000020;
        EX_irq = 1;
        #50
        EX_irq = 0;


        #800
        INT_Vector = 8'h00000020;
        EX_irq = 1;
        #50
        EX_irq = 0;


        #1000
        INT_Vector = 8'h00000020;
        EX_irq = 1;
        #50
        EX_irq = 0;


        #400
        INT_Vector = 8'h00000020;
        EX_irq = 1;
        #50
        EX_irq = 0;


        #700
        INT_Vector = 8'h00000020;
        EX_irq = 1;
        #50
        EX_irq = 0;
    end

    initial
    begin
        #800
        INT_Vector = 8'h00000040;
        EX_fiq = 1;
        #50
        EX_fiq = 0;

        #900
        INT_Vector = 8'h00000040;
        EX_fiq = 1;
        #50
        EX_fiq = 0;

    end

    initial
        forever #20 clk = ~clk;
endmodule

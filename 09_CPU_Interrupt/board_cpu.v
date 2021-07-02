`timescale 1ns / 1ps
module board_cpu(sw,
                 swb,
                 led,
                 clk,
                 which,
                 seg,
                 enable);
    
    input [1:32] sw;
    input [1:6] swb;
    output [1:32] led;
    input clk;
    output [2:0] which;
    output [7:0] seg;
    output reg enable = 1;
    
    
    reg [32:0] data;
    reg [2:0]cnt = 0;
    wire [31:0] I,A,B,C,F,PC,M_R_Data,M_W_Data;
    wire Write_PC,Write_IR,Write_Reg,S;
    wire [31:0] CPSR,SPSR;
    wire  W_SPSR_s,Write_SPSR,Write_CPSR,SP_in,SP_out;
    
    wire rm_imm_s,S;
    wire [1:0] rs_imm_s,PC_s,W_Rdata_s;
    wire [3:0] ALU_OP;
    wire rd_s,ALU_A_s;
    wire [1:0] ALU_B_s;
    
    wire [7:2] Inst_addr;
    
    
    wire Reg_C_s;
    
    wire [2:0] W_CPSR_s;
    wire INT_irq,INT_fiq;
    wire [3:0] DP;
    wire [2:0] Change_M;
    wire EX_irq;
    assign EX_irq=swb[3];
    CPU cpu(.clk(swb[1]),       //时钟信号
            .Rst(swb[2]),       //复位信号
            .EX_irq(swb[3]),    //中断
            .EX_fiq(swb[4]),
            .INT_Vector(sw),    //中断向量
            .I(I),              //指令机器码
            .A(A),
            .B(B),
            .C(C),
            .F(F),
            .CPSR(CPSR),        //程序状态寄存器
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
            .Inst_addr(Inst_addr),//PC地址
            .W_Rdata_s(W_Rdata_s),
            .W_CPSR_s(W_CPSR_s),
            .W_SPSR_s(W_SPSR_s),
            .Reg_C_s(Reg_C_s),
            .INT_irq(INT_irq),
            .INT_fiq(INT_fiq),
            .DP(DP),
            .Change_M(Change_M)
            );
    
    always @(posedge swb[6])
    begin
        case(cnt)
        0:begin data <= {I,1'b1}; end
        1:begin data <= {A,1'b1}; end
        2:begin data <= {B,1'b1}; end
        3:begin data <= {C,1'b1}; end
        4:begin data <= {F,1'b1}; end
        default:begin data <= {32'h88888888,1'b0}; end
        endcase
        cnt <= (cnt+1)%6;
    end
    
    assign led[27:32] = Inst_addr;

    assign led[23]    = Write_PC;
    assign led[22]    = Write_IR;
    assign led[21]    = Write_Reg;
    assign led[19:20] = W_Rdata_s;
    
    assign led[17:18] = PC_s;
    
    assign led[13:16] = DP;
    assign led[1]    = INT_irq;
    assign led[9]     = Reg_C_s;
    
    assign led[5:8] = ALU_OP;
    assign led[2:4] = Change_M;
    
    Display Display_Instance(.clk(clk), .data(data),
    .which(which), .seg(seg));
    
endmodule

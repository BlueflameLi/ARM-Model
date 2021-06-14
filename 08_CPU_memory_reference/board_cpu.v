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
    wire [31:0] I,A,B,C,F,Shift_Out,PC,M_R_Data,M_W_Data;
    reg [32:0] data;
    reg [2:0]cnt = 0;
    wire [3:0] NZCV;
    wire [5:0] Inst_addr;
    wire LA,LB,LC,LF;
    wire Write_PC,Write_IR,Write_Reg,S;
    wire rm_imm_s;
    wire [1:0] rs_imm_s,PC_s,W_Rdata_s;
    wire [3:0] ALU_OP;
    wire [2:0] SHIFT_OP;
    wire rd_s,ALU_A_s,ALU_B_s;
    wire Mem_Write,Mem_W_s,Reg_C_s;
    wire [1:0] test;
    wire [3:0] NZCV_New;

    CPU cpu(.clk(swb[1]),     //时钟信号
           .Rst(swb[2]),      //复位信号
           .I(I),         //指令机器码
           .A(A),
           .B(B),
           .C(C),
           .F(F),
           .NZCV(NZCV),
           .Write_PC(Write_PC),
           .Write_IR(Write_IR),
           .Write_Reg(Write_Reg),
           .ALU_OP(ALU_OP),
           .PC_s(PC_s),
           .rd_s(rd_s),
           .ALU_A_s(ALU_A_s),
           .ALU_B_s(ALU_B_s),
           .PC(PC),
           .W_Rdata_s(W_Rdata_s),
           .Mem_Write(Mem_Write),
           .Mem_W_s(Mem_W_s),
           .Reg_C_s(Reg_C_s),
           .M_R_Data(M_R_Data),
           .M_W_Data(M_W_Data)
           );

    always @(posedge swb[6])
    begin
        case(cnt)
        0:begin data <= {I,1'b1}; end
        1:begin data <= {A,1'b1}; end
        2:begin data <= {B,1'b1}; end
        3:begin data <= {C,1'b1}; end
        4:begin data <= {F,1'b1}; end
        5:begin data <= {M_R_Data,1'b1}; end
        6:begin data <= {M_W_Data,1'b1}; end
        default:begin data <= {32'h88888888,1'b0}; end
        endcase
        cnt <= (cnt+1)%8;
    end

    assign led[25:32] = PC[7:0];
    assign led[23] = Write_PC;
    assign led[22] = Write_IR;
    assign led[21] = Write_Reg;
    assign led[19:20] = W_Rdata_s;

    assign led[17:18] = PC_s;
    
    
    assign led[13] = Mem_Write;
    assign led[12] = Mem_W_s;
    assign led[11] = Reg_C_s;

    assign led[5:8] = ALU_OP;
    assign led[4] = rd_s;
    assign led[2] = ALU_A_s;
    assign led[1] = ALU_B_s;

    Display Display_Instance(.clk(clk), .data(data),
    .which(which), .seg(seg));

endmodule

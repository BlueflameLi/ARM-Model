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
    wire [31:0] I,A,B,C,F,Shift_Out,PC;
    reg [32:0] data;
    reg [2:0]cnt = 0;
    wire [3:0] NZCV;
    wire [5:0] Inst_addr;
    wire LA,LB,LC,LF;
    wire Write_PC,Write_IR,Write_Reg,S;
    wire rm_imm_s;
    wire [1:0] rs_imm_s,PC_s;
    wire [3:0] ALU_OP;
    wire [2:0] SHIFT_OP;
    wire rd_s,ALU_A_s,ALU_B_s;
    wire [1:0] test;
    wire [3:0] NZCV_New;
    
    CPU cpu(swb[1],       //时钟信号
            swb[2],      //复位信号
            I,         //指令机器码?
            A,
            B,
            C,
            F,
            NZCV,
            Inst_addr, //PC取指令地址?
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
            Shift_Out,
            PC_s,
            rd_s,
            ALU_A_s,
            ALU_B_s,
            PC);
    
    always @(posedge swb[6])
    begin
        case(cnt)
            0:begin data <= {I,1'b1}; end
            1:begin data <= {A,1'b1}; end
            2:begin data <= {B,1'b1}; end
            3:begin data <= {C,1'b1}; end
            4:begin data <= {F,1'b1}; end
            5:begin data <= {Shift_Out,1'b1}; end
            default:begin data <= {32'h88888888,1'b0}; end
        endcase
        cnt <= (cnt+1)%7;
    end
    
    assign led[25:32] = PC[7:0];
    assign led[23]    = Write_PC;
    assign led[22]    = Write_IR;
    assign led[21]    = Write_Reg;
    assign led[20]    = S;
    
    assign led[17:18] = PC_s;
    
    assign led[12:15] = NZCV;
    
    assign led[11]   = rm_imm_s;
    assign led[9:10] = rs_imm_s;
    assign led[5:8]  = ALU_OP;
    assign led[4]    = rd_s;
    assign led[2]    = ALU_A_s;
    assign led[1]    = ALU_B_s;
    
    Display Display_Instance(.clk(clk), .data(data),
    .which(which), .seg(seg));
    
endmodule

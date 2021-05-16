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
    wire [31:0] I,A,B,C,F;
    reg [32:0] data;
    reg [2:1]cnt = 0;
    wire [3:0] NZCV;
    wire [5:0] Inst_addr;
    wire LA,LB,LC,LF;
    wire Write_PC,Write_IR,Write_Reg,S;
    wire rm_imm_s;
    wire [1:0] rs_imm_s;
    wire [3:0] ALU_OP;
    wire [2:0] SHIFT_OP;
    CPU cpu(swb[1],swb[2],
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
    assign led[29:32] = NZCV;
    assign led[22:27] = Inst_addr;
    assign led[20] = Write_PC;
    assign led[19] = Write_IR;
    assign led[18] = Write_Reg;
    
    assign led[17] = LA;
    assign led[16] = LB;
    assign led[15] = LC;
    assign led[14] = LF;
    
    assign led[12:13] = rm_imm_s;
    assign led[9:11] = rs_imm_s;
    assign led[5:8] = ALU_OP;
    assign led[2:4] = SHIFT_OP;
    assign led[1] = S;

    Display Display_Instance(.clk(clk), .data(data),
    .which(which), .seg(seg));

endmodule

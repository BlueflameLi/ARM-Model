`timescale 1ns / 1ps

module CPU(clk,       //时钟信号
           Rst,       //复位信号
           I,         //指令机器码
           A,
           B,
           C,
           F,
           NZCV,
           Inst_addr, //PC取指令地址
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
    
    input clk,Rst;
    output [31:0] I;
    output [31:0] A,B,C,F;
    output  [3:0] NZCV;
    output [5:0] Inst_addr;
    output reg Write_PC,Write_IR,Write_Reg,S;
    output reg rm_imm_s;
    output reg [1:0] rs_imm_s;
    output reg [3:0] ALU_OP;
    output [2:0] SHIFT_OP;
    output reg LA,LB,LC,LF;
    
    //取指令
    wire flag;//条件判断结果
    wire[31:28] cond;//条件码
    wire [27:0] IR;
    Inst Inst_Instance(.clk(clk),.Rst(Rst),.Write_IR(Write_IR),.Write_PC(Write_PC),.NZCV(NZCV),.flag(flag),.Inst_addr(Inst_addr),.condition_code(cond),.IR(IR));
    
    assign I = {cond,IR};
    
    //指令译码
    parameter DP0 = 2'd0;
    parameter DP1 = 2'd1;
    parameter DP2 = 2'd2;
    parameter Und = 2'd3;//未定义指令
    reg [1:0] DP;//三种指令格式
    wire [3:0] OP,rn,rd,rs,rm;
    wire [4:0] imm5;
    wire [1:0] type;
    wire [11:0] imm12;
    
    assign OP    = IR[24:21];
    assign rn    = IR[19:16];
    assign rd    = IR[15:12];
    assign imm5  = IR[11:7];
    assign rs    = IR[11:8];
    assign type  = IR[6:5];
    assign rm    = IR[3:0];
    assign imm12 = IR[11:0];
    
    always@(*)
    begin
        if (&rd)
            DP = Und;
        else
        begin
            if (~|IR[27:25])
            begin
                if (!IR[4])
                    DP = DP0;
                else if (!IR[7])
                    DP = DP1;
                else
                    DP = Und;
            end
            else if (IR[27:25] ^~ 3'b001)
                DP = DP2;
            else
                DP = Und;
        end
    end
    
    wire Und_Ins;
    assign Und_Ins = DP == Und;
    

    RegFile RegFile_Instance(.clk(clk),.Rst(Rst),.Write_Reg(Write_Reg),.LA(LA),.LB(LB),.LC(LC),.R_Addr_A(rn),.R_Addr_B(rm),.R_Addr_C(rs),.W_Addr(rd),.W_Data(F),.R_Data_A(A),.R_Data_B(B),.R_Data_C(C));
    
    
    
    wire [7:0] Shift_Num;
    wire [31:0] Shift_Data;

    assign Shift_Data = rm_imm_s?{{24{1'b0}},imm12[7:0]}:B;
    assign Shift_Num  = rs_imm_s[1]?{{3{1'b0}},imm12[11:8],1'b0}:(rs_imm_s[0]?C[7:0]:{{3{1'b0}},imm5});
    assign SHIFT_OP   = DP[1]?3'b111:{type,DP[0]};
    
    always@(*)
    begin
        if (OP[3] & !OP[2])
            ALU_OP = 4'b1000>>(4-OP[1:0]);
        else
            ALU_OP = OP;
    end
    
    ALU_Shift ALU_Shift_Instance(.clk(clk),.Rst(Rst),.SHIFT_OP(SHIFT_OP),.Shift_Data(Shift_Data),.Shift_Num(Shift_Num),.ALU_OP(ALU_OP),.A(A),.CF(NZCV[1]),.VF(NZCV[0]),.NZCV(NZCV),.F(F),.S(S),.LF(LF));
    
    
    localparam Idle = 3'd0;
    localparam S0   = 3'd1;
    localparam S1   = 3'd2;
    localparam S2   = 3'd3;
    localparam S3   = 3'd4;
    reg [2:0] ST,Next_ST;
    
    always@(posedge clk or posedge Rst)//状态转移
    begin
        if (Rst)
            ST <= Idle;
        else
            ST <= Next_ST;
    end
    
    always@(*)//次态函数
    begin
        Next_ST = Idle;
        case(ST)
            Idle:    Next_ST = S0;
            S0:      Next_ST = (flag & !Und_Ins)?S1: S0;
            S1:      Next_ST = S2;
            S2:      Next_ST = S3;
            S3:      Next_ST = S0;
            default: Next_ST = S0;
        endcase
    end
    
    always@(posedge clk or posedge Rst)//输出函数
    begin
        if (Rst)
        begin
            Write_PC  <= 1'b0;
            Write_IR  <= 1'b0;
            Write_Reg <= 1'b0;
            LA        <= 1'b0;
            LB        <= 1'b0;
            LC        <= 1'b0;
            LF        <= 1'b0;
            S         <= 1'b0;
            rm_imm_s  <= 1'b0;
            rs_imm_s  <= 2'b00;
        end
        else
        begin
            case(Next_ST)
                S0:begin
                    Write_PC  <= 1'b1;
                    Write_IR  <= 1'b1;
                    Write_Reg <= 1'b0;
                    LA        <= 1'b0;
                    LB        <= 1'b0;
                    LC        <= 1'b0;
                    LF        <= 1'b0;
                    S         <= 1'b0;
                end
                S1:begin
                    Write_PC  <= 1'b0;
                    Write_IR  <= 1'b0;
                    Write_Reg <= 1'b0;
                    LA        <= 1'b1;
                    LB        <= 1'b1;
                    LC        <= 1'b1;
                    LF        <= 1'b0;
                    S         <= 1'b0;
                end
                S2:begin
                    Write_PC  <= 1'b0;
                    Write_IR  <= 1'b0;
                    Write_Reg <= 1'b0;
                    LA        <= 1'b0;
                    LB        <= 1'b0;
                    LC        <= 1'b0;
                    LF        <= 1'b1;
                    S         <= 1'b0;
                    rm_imm_s  <= DP[1];
                    rs_imm_s  <= DP;
                    S         <= IR[20];
                end
                S3:begin
                    Write_PC  <= 1'b0;
                    Write_IR  <= 1'b0;
                    Write_Reg <= !OP[3] | OP[2];//1000-1011四个指令不写入rd
                    LA        <= 1'b0;
                    LB        <= 1'b0;
                    LC        <= 1'b0;
                    LF        <= 1'b0;
                    S         <= 1'b0;
                end
            endcase
        end
        
    end
    
endmodule

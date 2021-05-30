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
           S,
           Shift_Out,
           PC_s,
           rd_s,
           ALU_A_s,
           ALU_B_s,
           PC);
    
    input clk,Rst;
    output [31:0] I;
    output [31:0] A,B,C,F,Shift_Out;
    output  [3:0] NZCV;
    output [5:0] Inst_addr;
    output reg Write_PC,Write_IR,Write_Reg,S;
    output reg rm_imm_s;
    output reg [1:0] rs_imm_s,PC_s;
    output reg [3:0] ALU_OP;
    output [2:0] SHIFT_OP;
    output reg LA,LB,LC,LF,rd_s,ALU_A_s,ALU_B_s;
    // output [31:0] test;//调试用
    
    //取指令
    wire flag;//条件判断结果
    wire[31:28] cond;//条件码
    wire [27:0] IR;
    output [31:0] PC;
    Inst Inst_Instance(.clk(clk),.Rst(Rst),.Write_IR(Write_IR),.Write_PC(Write_PC),.NZCV(NZCV),.flag(flag),.PC(PC),.condition_code(cond),.IR(IR),.B(B),.F(F),.PC_s(PC_s));
    
    assign Inst_addr = PC[7:2];
    assign I         = {cond,IR};
    
    //指令译码
    parameter DP0 = 3'd0;
    parameter DP1 = 3'd1;
    parameter DP2 = 3'd2;
    parameter B1  = 3'd3;
    parameter BL  = 3'd4;
    parameter BX  = 3'd5;
    parameter Und = 3'd6;//未定义指令
    
    reg [2:0] DP;//指令格式
    wire [3:0] OP,rn,rd,rs,rm;
    wire [4:0] imm5;
    wire [1:0] type;
    wire [11:0] imm12;
    wire [23:0] imm24;
    
    assign OP    = IR[24:21];
    assign rn    = IR[19:16];
    assign rd    = IR[15:12];
    assign imm5  = IR[11:7];
    assign rs    = IR[11:8];
    assign type  = IR[6:5];
    assign rm    = IR[3:0];
    assign imm12 = IR[11:0];
    assign imm24 = IR[23:0];
    
    
    always@(*)
    begin
        case(IR[27:25])
            3'b000:
            begin
                if (IR[24:4] == 21'b1_0010_1111_1111_1111_0001)
                    DP = BX;
                else if (!IR[4])
                    DP = DP0;
                else if (!IR[7])
                    DP = DP1;
                else
                    DP = Und;
            end
            3'b001:
            begin
                DP = DP2;
            end
            3'b101:
            begin
                DP = IR[24]?BL:B1;
            end
            default: DP = Und;
        endcase
    end
    
    
    wire Und_Ins;
    assign Und_Ins = DP == Und;
    
    wire [3:0] W_Addr;
    assign W_Addr = rd_s?4'b1110:rd;
    
    RegFile RegFile_Instance(.clk(clk),.Rst(Rst),.Write_Reg(Write_Reg),.LA(LA),.LB(LB),.LC(LC),.R_Addr_A(rn),.R_Addr_B(rm),.R_Addr_C(rs),.W_Addr(W_Addr),.W_Data(F),.R_Data_A(A),.R_Data_B(B),.R_Data_C(C));
    
    
    
    wire [7:0] Shift_Num;
    wire [31:0] Shift_Data;
    
    assign Shift_Data = rm_imm_s?{{24{1'b0}},imm12[7:0]}:B;
    assign Shift_Num  = rs_imm_s[1]?{{3{1'b0}},imm12[11:8],1'b0}:(rs_imm_s[0]?C[7:0]:{{3{1'b0}},imm5});
    assign SHIFT_OP   = DP[1]?3'b111:{type,DP[0]};
    
    
    ALU_Shift ALU_Shift_Instance(.clk(clk),.Rst(Rst),.SHIFT_OP(SHIFT_OP),.Shift_Data(Shift_Data),.Shift_Num(Shift_Num),.ALU_OP(ALU_OP),.A_New(A),.CF(NZCV[1]),.VF(NZCV[0]),.NZCV(NZCV),.F(F),.S(S),.LF(LF),.Shift_Out(Shift_Out),.ALU_A_s(ALU_A_s),.ALU_B_s(ALU_B_s),.PC(PC),.imm24(imm24));
    
    
    localparam Idle = 4'd0;
    localparam S0   = 4'd1;
    localparam S1   = 4'd2;
    localparam S2   = 4'd3;
    localparam S3   = 4'd4;
    localparam S7   = 4'd8;
    localparam S8   = 4'd9;
    localparam S9   = 4'd10;
    localparam S10  = 4'd11;
    localparam S11  = 4'd12;
    reg [3:0] ST,Next_ST;
    
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
            S0:
            begin
                if (flag & !Und_Ins)
                    case(DP)
                        B1:Next_ST      = S8;
                        BL:Next_ST      = S10;
                        default:Next_ST = S1;
                    endcase
                else
                    Next_ST = S0;
            end
            S1:      Next_ST  = (DP ^ BX)?S2:S7;
            S2:      Next_ST  = S3;
            S8:      Next_ST  = S9;
            S10:      Next_ST = S11;
            S11:      Next_ST = S9;
            default: Next_ST  = S0;
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
            PC_s      <= 2'b00;
            rd_s      <= 1'b0;
            ALU_A_s   <= 1'b0;
            ALU_B_s   <= 1'b0;
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
                    PC_s      <= 2'b00;
                    rd_s      <= 1'b0;
                    ALU_A_s   <= 1'b0;
                    ALU_B_s   <= 1'b0;
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
                    PC_s      <= 2'b00;
                    rd_s      <= 1'b0;
                    ALU_A_s   <= 1'b0;
                    ALU_B_s   <= 1'b0;
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
                    PC_s      <= 2'b00;
                    rd_s      <= 1'b0;
                    ALU_A_s   <= 1'b0;
                    ALU_B_s   <= 1'b0;
                    if (OP[3] & !OP[2])
                        ALU_OP <= 4'b1000>>(4-OP[1:0]);
                    else
                        ALU_OP <= OP;
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
                    PC_s      <= 2'b00;
                    rd_s      <= 1'b0;
                    ALU_A_s   <= 1'b0;
                    ALU_B_s   <= 1'b0;
                end
                S7:begin
                    Write_PC  <= 1'b1;
                    Write_IR  <= 1'b0;
                    Write_Reg <= 1'b0;
                    LA        <= 1'b0;
                    LB        <= 1'b0;
                    LC        <= 1'b0;
                    LF        <= 1'b0;
                    S         <= 1'b0;
                    PC_s      <= 2'b01;
                    rd_s      <= 1'b0;
                    ALU_A_s   <= 1'b0;
                    ALU_B_s   <= 1'b0;
                end
                S8:begin
                    Write_PC  <= 1'b0;
                    Write_IR  <= 1'b0;
                    Write_Reg <= 1'b0;
                    LA        <= 1'b0;
                    LB        <= 1'b0;
                    LC        <= 1'b0;
                    LF        <= 1'b1;
                    S         <= 1'b0;
                    PC_s      <= 2'b00;
                    rd_s      <= 1'b0;
                    ALU_A_s   <= 1'b1;
                    ALU_B_s   <= 1'b1;
                    ALU_OP    <= 4'b0100;
                end
                S9:begin
                    Write_PC  <= 1'b1;
                    Write_IR  <= 1'b0;
                    Write_Reg <= 1'b0;
                    LA        <= 1'b0;
                    LB        <= 1'b0;
                    LC        <= 1'b0;
                    LF        <= 1'b0;
                    S         <= 1'b0;
                    PC_s      <= 2'b10;
                    rd_s      <= 1'b0;
                    ALU_A_s   <= 1'b0;
                    ALU_B_s   <= 1'b0;
                end
                S10:begin
                    Write_PC  <= 1'b0;
                    Write_IR  <= 1'b0;
                    Write_Reg <= 1'b0;
                    LA        <= 1'b0;
                    LB        <= 1'b0;
                    LC        <= 1'b0;
                    LF        <= 1'b1;
                    S         <= 1'b0;
                    PC_s      <= 2'b00;
                    rd_s      <= 1'b0;
                    ALU_A_s   <= 1'b1;
                    ALU_B_s   <= 1'b0;
                    ALU_OP    <= 4'b1000;
                end
                S11:begin
                    Write_PC  <= 1'b0;
                    Write_IR  <= 1'b0;
                    Write_Reg <= 1'b1;
                    LA        <= 1'b0;
                    LB        <= 1'b0;
                    LC        <= 1'b0;
                    LF        <= 1'b1;
                    S         <= 1'b0;
                    PC_s      <= 2'b10;
                    rd_s      <= 1'b1;
                    ALU_A_s   <= 1'b1;
                    ALU_B_s   <= 1'b1;
                    ALU_OP    <= 4'b0100;
                end
            endcase
        end
        
    end
    
endmodule

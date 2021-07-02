`timescale 1ns / 1ps

module CPU(clk,        //时钟信号
           Rst,        //复位信号
           EX_irq,
           INT_Vector,
           I,          //指令机器码
           A,
           B,
           C,
           F,
           CPSR,
           Write_PC,
           Write_IR,
           Write_Reg,
           Write_CPSR,
           Write_SPSR,
           SP_in,
           SP_out,
           rm_imm_s,
           rs_imm_s,
           ALU_OP,
           S,
           PC_s,
           rd_s,
           ALU_A_s,
           ALU_B_s,
           Inst_addr,
           W_Rdata_s,
           W_CPSR_s,
           W_SPSR_s,
           Reg_C_s,
           INT_irq,
           DP,
           Change_M
           );
    
    input clk, Rst, EX_irq;
    input  [31:0] INT_Vector;
    output [31:0] I;
    output [31:0] A,B,C,F;
    wire [31:0] M_R_Data,M_W_Data;
    wire [31:0] Shift_Out;
    output reg Write_PC,Write_IR,Write_Reg,S;
    output reg rm_imm_s;
    output reg [1:0] rs_imm_s,PC_s;
    output reg [3:0] ALU_OP;
    reg [2:0] SHIFT_OP;
    output reg ALU_A_s,W_Rdata_s,Reg_C_s;
    reg LA,LB,LC,LF,Mem_W_s,Mem_Write;
    output reg [1:0] rd_s,ALU_B_s;
    
    output reg [2:0] Change_M;
    output reg W_SPSR_s,Write_SPSR,Write_CPSR,SP_in,SP_out;
    output reg [2:0] W_CPSR_s;
    reg [3:0] MASK = 0;
    output [31:0] CPSR;
    output INT_irq;
    wire [31:0] W_Data;
    
    wire [3:0] NZCV;
    
    //取指令
    wire flag;//条件判断结果
    wire[31:28] cond;//条件码
    wire [27:0] IR;
    wire [31:0] PC;
    output [7:2] Inst_addr;
    Inst Inst_Instance(.clk(clk),.Rst(Rst),.Write_IR(Write_IR),.Write_PC(Write_PC),.NZCV(CPSR[31:28]),.flag(flag),.PC(PC),.condition_code(cond),.IR(IR),.B(B),.F(W_Data),.PC_s(PC_s),.INT_Vector(INT_Vector));
    
    assign I         = {cond,IR};
    assign Inst_addr = PC[7:2];
    
    //指令译码
    parameter DP0  = 4'd1;
    parameter DP1  = 4'd2;
    parameter DP2  = 4'd3;
    parameter B1   = 4'd4;
    parameter BL   = 4'd5;
    parameter BX   = 4'd6;
    parameter SWP  = 4'd7;
    parameter LDR0 = 4'd8;//1000
    parameter LDR1 = 4'd9;//1001
    parameter STR0 = 4'd10;//1010
    parameter STR1 = 4'd11;//1011
    parameter Und  = 4'd0;//未定义指令
    
    parameter MOVS = 4'd12;//1011
    
    output reg  [3:0] DP;//指令格式
    wire [3:0] OP,rn,rd,rs,rm;
    wire [4:0] imm5;
    wire [1:0] type;
    wire [11:0] imm12;
    wire [23:0] imm24;
    wire P,U,W;
    
    assign OP    = IR[24:21];
    assign rn    = IR[19:16];
    assign rd    = IR[15:12];
    assign imm5  = IR[11:7];
    assign rs    = IR[11:8];
    assign type  = IR[6:5];
    assign rm    = IR[3:0];
    assign imm12 = IR[11:0];
    assign imm24 = IR[23:0];
    assign P     = IR[24];
    assign U     = IR[23];
    assign W     = IR[21];
    wire swp_flag;
    assign swp_flag = (~&rd & ~&rn & ~&rm) && rn != rd && rn != rm;
    
    always@(*)
    begin
        case(IR[27:25])
            3'b000:
            begin
                if (IR[24:4] == 21'b1_0010_1111_1111_1111_0001)
                    DP = BX;
                else if (IR[24:20] == 5'b1_0000 && IR[11:4] == 8'b0000_1001)
                    DP = SWP;
                else if (!IR[4])
                    DP = (&rd)?MOVS:DP0;
                else if (!IR[7])
                    DP = DP1;
                else
                    DP = Und;
            end
            3'b001:
            begin
                DP = DP2;
            end
            3'b010:
            begin
                if (IR[22])
                    DP = Und;
                else if (IR[20])
                    DP = LDR0;
                else
                    DP = STR0;
            end
            3'b011:
            begin
                if (IR[22])
                    DP = Und;
                else if (IR[20])
                    DP = LDR1;
                else
                    DP = STR1;
            end
            3'b101:
            begin
                DP = IR[24]?BL:B1;
            end
            default: DP = Und;
        endcase
    end
    
    wire str_flag;
    assign str_flag = &rm || (W && (&rn || rn == rd));
    
    reg Und_Ins;
    always@(*)
    begin
        if (DP == Und)
            Und_Ins = 1;
        else if (DP == SWP && !swp_flag)
            Und_Ins = 1;
        else if (DP == LDR0 && W && rn == rd)
            Und_Ins = 1;
        else if (DP >= LDR1 && str_flag)
            Und_Ins = 1;
        else
            Und_Ins = 0;
    end
    
    
    //寄存器堆
    wire [3:0] R_Addr_C;
    wire [3:0] W_Addr;
    
    assign W_Addr   = rd_s[1]?rn:(rd_s[0]?4'b1110:rd);
    assign W_Data   = W_Rdata_s?M_R_Data:F;
    assign R_Addr_C = Reg_C_s?rd:rs;
    
    register_pile RegFile_Instance(.clk(clk),.rst(Rst),.Write_Reg(Write_Reg),.LA(LA),.LB(LB),.LC(LC),.R_Addr_A(rn),.R_Addr_B(rm),.R_Addr_C(R_Addr_C),.W_Addr(W_Addr),.W_Data(W_Data),.R_Data_A(A),.R_Data_B(B),.R_Data_C(C),.Change_M(Change_M),.CPSR(CPSR));
    
    
    //ALU和移位器
    wire [7:0] Shift_Num;
    wire [31:0] Shift_Data;
    
    assign Shift_Data = rm_imm_s?{{24{1'b0}},imm12[7:0]}:B;
    assign Shift_Num  = rs_imm_s[1]?{{3{1'b0}},imm12[11:8],1'b0}:(rs_imm_s[0]?C[7:0]:{{3{1'b0}},imm5});
    
    
    
    ALU_Shift ALU_Shift_Instance(.clk(clk),.Rst(Rst),.SHIFT_OP(SHIFT_OP),.Shift_Data(Shift_Data),.Shift_Num(Shift_Num),.ALU_OP(ALU_OP),.A_New(A),.CF(CPSR[29]),.VF(CPSR[28]),.NZCV(NZCV),.F(F),.S(S),.LF(LF),.Shift_Out(Shift_Out),.ALU_A_s(ALU_A_s),.ALU_B_s(ALU_B_s),.PC(PC),.imm24(imm24),.imm12(imm12));
    
    
    
    //数据存储器
    wire clk_tmp;
    wire d_outn;
    reg  d_out     = 0;
    assign clk_tmp = clk ^ d_out ;
    assign d_outn  = ~d_out ;
    
    always@(posedge clk_tmp)
        d_out <= d_outn;
    
    //数据存储器
    Data_RAM Dataram (
    .clka(clk_tmp),
    .wea(Mem_Write),
    .addra(F[6:0]),
    .dina(M_W_Data),
    .douta(M_R_Data)
    );
    assign M_W_Data = Mem_W_s?C:B;
    
    
    //CPSR
    Reg_CPSR CPSR_Instance(
    .clk(clk),
    .rst(Rst),
    .W_SPSR_s(W_SPSR_s),
    .W_CPSR_s(W_CPSR_s),
    .Write_SPSR(Write_SPSR),
    .Write_CPSR(Write_CPSR),
    .SPSR_New(SPSR_New),
    .CPSR_New(CPSR_New),
    .MASK(MASK),
    .NZCV(NZCV),
    .Change_M(Change_M),
    .S(S),
    .CPSR(CPSR)
    );
    
    reg INTA_irq;
    
    //irq_request
    request request_Instance(
    .CPSR_7(CPSR[7]),
    .INTA_irq(INTA_irq),
    .EX_irq(EX_irq),
    .INT_irq(INT_irq));
    
    wire [31:0] SP,MSP,PSP;
    Stack Stack_Instance(
    .clk(clk),
    .rst(Rst),
    .SP_in(SP_in),
    .SP_out(SP_out),
    .M(CPSR[4:0]),
    .SP(SP),
    .PSP(PSP),
    .MSP(MSP)
    );
    
    localparam Idle = 6'd0;
    localparam S0   = 6'd1;
    localparam S1   = 6'd2;
    localparam S2   = 6'd3;
    localparam S3   = 6'd4;
    localparam S7   = 6'd8;
    localparam S8   = 6'd9;
    localparam S9   = 6'd10;
    localparam S10  = 6'd11;
    localparam S11  = 6'd12;
    localparam S12  = 6'd13;
    localparam S13  = 6'd14;
    localparam S14  = 6'd15;
    localparam S15  = 6'd16;
    localparam S16  = 6'd17;
    localparam S17  = 6'd18;
    localparam S18  = 6'd19;
    localparam S19  = 6'd20;
    localparam S20  = 6'd21;
    localparam S21  = 6'd22;
    localparam S22  = 6'd23;
    localparam S23  = 6'd24;
    localparam S24  = 6'd25;
    localparam S25  = 6'd26;
    localparam S26  = 6'd27;
    localparam S27  = 6'd28;
    localparam S28  = 6'd29;
    localparam S29  = 6'd30;
    localparam S30  = 6'd31;
    localparam S31  = 6'd32;
    reg [5:0] ST,Next_ST;
    
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
            S1:
            begin
                if (DP == BX)
                    Next_ST = S7;
                else if (DP == MOVS)
                    Next_ST = S28;
                else if (DP[3])
                    Next_ST = S12;
                else if (DP == SWP)
                    Next_ST = S16;
                else
                    Next_ST = S2;
            end
            S2:      Next_ST = S3;
            S8:      Next_ST = S9;
            S10:     Next_ST = S11;
            S11:     Next_ST = S9;
            S12:     Next_ST = DP[1]?S15:S13;
            S13:     Next_ST = S14;
            S15:     Next_ST = S14;
            S16:     Next_ST = S17;
            S17:     Next_ST = S18;
            S26:     Next_ST = S27;
            S28:     Next_ST = S26;
            S29:     Next_ST = S30;
            S30:     Next_ST = S31;
            S31:     Next_ST = S27;
            default: begin
                if (INT_irq & !CPSR[7])
                    Next_ST = S29;
                else
                    Next_ST = S0;
            end
        endcase
    end
    
    
    always@(posedge clk or posedge Rst)//输出函数
    begin
        if (Rst)
        begin
            Write_PC   <= 1'b0;
            Write_IR   <= 1'b0;
            Write_Reg  <= 1'b0;
            LA         <= 1'b0;
            LB         <= 1'b0;
            LC         <= 1'b0;
            LF         <= 1'b0;
            S          <= 1'b0;
            rm_imm_s   <= 1'b0;
            rs_imm_s   <= 2'b00;
            PC_s       <= 2'b00;
            rd_s       <= 2'b00;
            ALU_A_s    <= 1'b0;
            ALU_B_s    <= 2'b00;
            W_Rdata_s  <= 1'b0;
            Reg_C_s    <= 1'b0;
            Mem_Write  <= 1'b0;
            Mem_W_s    <= 1'b0;
            Write_CPSR <= 1'b0;
            Write_SPSR <= 1'b0;
            ALU_OP     <= 4'b0000;
            W_CPSR_s   <= 3'b000;
            W_SPSR_s   <= 1'b0;
            SP_out     <= 1'b0;
            SP_in      <= 1'b0;
            Change_M   <= 3'b000;
            INTA_irq   <= 1'b0;
        end
        else
        begin
            case(Next_ST)
                S0:begin
                    Write_PC   <= 1'b1;
                    Write_IR   <= 1'b1;
                    Write_Reg  <= 1'b0;
                    LA         <= 1'b0;
                    LB         <= 1'b0;
                    LC         <= 1'b0;
                    LF         <= 1'b0;
                    S          <= 1'b0;
                    rm_imm_s   <= 1'b0;
                    rs_imm_s   <= 2'b00;
                    PC_s       <= 2'b00;
                    rd_s       <= 2'b00;
                    ALU_A_s    <= 1'b0;
                    ALU_B_s    <= 2'b00;
                    W_Rdata_s  <= 1'b0;
                    Reg_C_s    <= 1'b0;
                    Mem_Write  <= 1'b0;
                    Mem_W_s    <= 1'b0;
                    Write_CPSR <= 1'b0;
                    Write_SPSR <= 1'b0;
                    ALU_OP     <= 4'b0000;
                    W_CPSR_s   <= 3'b000;
                    W_SPSR_s   <= 1'b0;
                    SP_out     <= 1'b0;
                    SP_in      <= 1'b0;
                    Change_M   <= 3'b000;
                    INTA_irq   <= 1'b0;
                end
                S1:begin
                    Write_PC    <= 1'b0;
                    Write_IR    <= 1'b0;
                    //Write_Reg <= 1'b0;
                    LA          <= 1'b1;
                    LB          <= 1'b1;
                    LC          <= 1'b1;
                    //LF        <= 1'b0;
                    //S         <= 1'b0;
                    //PC_s      <= 2'b00;
                    // rd_s     <= 2'b00;
                    //ALU_A_s   <= 1'b0;
                    //ALU_B_s   <= 2'b00;
                end
                S2:begin
                    //Write_PC  <= 1'b0;
                    //Write_IR  <= 1'b0;
                    //Write_Reg <= 1'b0;
                    LA          <= 1'b0;
                    LB          <= 1'b0;
                    LC          <= 1'b0;
                    LF          <= 1'b1;
                    rm_imm_s    <= DP == DP2;
                    rs_imm_s   <= DP[1:0]-2'b01;
                    S          <= IR[20];
                    //PC_s     <= 2'b00;
                    //rd_s     <= 2'b00;
                    // ALU_A_s <= 1'b0;
                    // ALU_B_s <= 2'b00;
                    if (OP[3] & !OP[2])
                        ALU_OP <= 4'b1000>>(4-OP[1:0]);
                    else
                        ALU_OP <= OP;
                    
                    if (DP == DP2)
                        SHIFT_OP <= 3'b111;
                    else
                        SHIFT_OP <= {type,!DP[0]};
                end
                S3:begin
                    //Write_PC <= 1'b0;
                    //Write_IR <= 1'b0;
                    Write_Reg  <= !OP[3] | OP[2];//1000-1011四个指令不写入rd
                    //LA       <= 1'b0;
                    //LB       <= 1'b0;
                    //LC       <= 1'b0;
                    LF         <= 1'b0;
                    S          <= 1'b0;
                    //PC_s     <= 2'b00;
                    //rd_s     <= 2'b00;
                    //ALU_A_s  <= 1'b0;
                    //ALU_B_s  <= 2'b00;
                end
                S7:begin
                    Write_PC    <= 1'b1;
                    //Write_IR  <= 1'b0;
                    //Write_Reg <= 1'b0;
                    LA          <= 1'b0;
                    LB          <= 1'b0;
                    LC          <= 1'b0;
                    //LF        <= 1'b0;
                    //S         <= 1'b0;
                    PC_s        <= 2'b01;
                    //rd_s      <= 2'b00;
                    //ALU_A_s   <= 1'b0;
                    //ALU_B_s   <= 2'b00;
                end
                S8:begin
                    Write_PC    <= 1'b0;
                    Write_IR    <= 1'b0;
                    //Write_Reg <= 1'b0;
                    //LA        <= 1'b0;
                    //LB        <= 1'b0;
                    //LC        <= 1'b0;
                    LF          <= 1'b1;
                    //S         <= 1'b0;
                    //PC_s      <= 2'b00;
                    //rd_s      <= 2'b00;
                    ALU_A_s     <= 1'b1;
                    ALU_B_s     <= 2'b01;
                    ALU_OP      <= 4'b0100;
                end
                S9:begin
                    Write_PC   <= 1'b1;
                    //Write_IR <= 1'b0;
                    Write_Reg  <= 1'b0;
                    //LA       <= 1'b0;
                    //LB       <= 1'b0;
                    //LC       <= 1'b0;
                    LF         <= 1'b0;
                    //S        <= 1'b0;
                    PC_s       <= 2'b10;
                    rd_s       <= 2'b00;
                    ALU_A_s    <= 1'b0;
                    ALU_B_s    <= 2'b00;
                end
                S10:begin
                    Write_PC    <= 1'b0;
                    Write_IR    <= 1'b0;
                    //Write_Reg <= 1'b0;
                    //LA        <= 1'b0;
                    //LB        <= 1'b0;
                    //LC        <= 1'b0;
                    LF          <= 1'b1;
                    //S         <= 1'b0;
                    //PC_s      <= 2'b00;
                    //rd_s      <= 2'b00;
                    ALU_A_s     <= 1'b1;
                    // ALU_B_s  <= 2'b00;
                    ALU_OP      <= 4'b1000;
                end
                S11:begin
                    //Write_PC <= 1'b0;
                    //Write_IR <= 1'b0;
                    Write_Reg  <= 1'b1;
                    //LA       <= 1'b0;
                    //LB       <= 1'b0;
                    //LC       <= 1'b0;
                    //LF       <= 1'b1;
                    //S        <= 1'b0;
                    PC_s       <= 2'b10;
                    rd_s       <= 2'b01;
                    //ALU_A_s  <= 1'b1;
                    ALU_B_s    <= 2'b01;
                    ALU_OP     <= 4'b0100;
                end
                S12:begin
                    //Write_PC  <= 1'b0;
                    //Write_IR  <= 1'b0;
                    //Write_Reg <= 1'b0;
                    LA          <= 1'b0;
                    LB          <= 1'b0;
                    LC          <= 1'b0;
                    LF          <= 1'b1;
                    //S         <= 1'b0;
                    //PC_s      <= 2'b00;
                    //rd_s      <= 2'b00;
                    //ALU_A_s   <= 1'b0;
                    ALU_B_s     <= {!DP[0],1'b0};
                    ALU_OP      <= P?(U?4'b0100:4'b0010):4'b1000;
                    SHIFT_OP    <= {type,1'b0};
                    rm_imm_s    <= 1'b0;
                    rs_imm_s    <= 2'b00;
                end
                S13:begin
                    //Write_PC <= 1'b0;
                    //Write_IR <= 1'b0;
                    Write_Reg  <= 1'b1;
                    //LA       <= 1'b0;
                    //LB       <= 1'b0;
                    //LC       <= 1'b0;
                    LF         <= !P;
                    //S        <= 1'b0;
                    //PC_s     <= 2'b00;
                    //rd_s     <= 2'b00;
                    //ALU_A_s  <= 1'b0;
                    ALU_B_s    <= {!DP[0],1'b0};
                    ALU_OP     <= U?4'b0100:4'b0010;
                    //SHIFT_OP <= {type,1'b0};
                    W_Rdata_s  <= 1'b1;
                end
                S14:begin
                    //Write_PC <= 1'b0;
                    //Write_IR <= 1'b0;
                    Write_Reg  <= W | !P;
                    //LA       <= 1'b0;
                    //LB       <= 1'b0;
                    LC         <= 1'b0;
                    LF         <= 0;
                    //S        <= 1'b0;
                    //PC_s     <= 2'b00;
                    rd_s       <= 2'b10;
                    //ALU_A_s  <= 1'b0;
                    // ALU_B_s <= {!DP[0],1'b0};
                    // ALU_OP  <= U?4'b0100:4'b0010;
                    //SHIFT_OP <= {type,1'b0};
                    W_Rdata_s  <= 1'b0;
                    Reg_C_s    <= 1'b0;
                    Mem_Write  <= 1'b0;
                    Mem_W_s    <= 1'b0;
                end
                S15:begin
                    //Write_PC  <= 1'b0;
                    //Write_IR  <= 1'b0;
                    //Write_Reg <= 1'b0;
                    //LA        <= 1'b0;
                    //LB        <= 1'b0;
                    LC          <= 1'b1;
                    LF          <= !P;
                    //S         <= 1'b0;
                    //PC_s      <= 2'b00;
                    //rd_s      <= 2'b00;
                    //ALU_A_s   <= 1'b0;
                    ALU_B_s     <= {!DP[0],1'b0};
                    ALU_OP      <= U?4'b0100:4'b0010;
                    //SHIFT_OP  <= {type,1'b0};
                    W_Rdata_s   <= 1'b1;
                    Reg_C_s     <= 1'b1;
                    Mem_Write   <= 1'b1;
                    Mem_W_s     <= 1'b1;
                end
                S16:begin
                    // Write_PC <= 1'b0;
                    // Write_IR <= 1'b0;
                    //Write_Reg <= 1'b0;
                    LA          <= 1'b0;
                    LB          <= 1'b0;
                    LC          <= 1'b0;
                    LF          <= 1'b1;
                    //S         <= 1'b0;
                    //PC_s      <= 2'b00;
                    // rd_s     <= 2'b00;
                    //ALU_A_s   <= 1'b0;
                    //ALU_B_s   <= 2'b00;
                    ALU_OP      <= 4'b1000;
                end
                S17:begin
                    // Write_PC <= 1'b0;
                    // Write_IR <= 1'b0;
                    Write_Reg   <= 1'b1;
                    // LA       <= 1'b0;
                    // LB       <= 1'b0;
                    // LC       <= 1'b0;
                    LF          <= 1'b0;
                    //S         <= 1'b0;
                    //PC_s      <= 2'b00;
                    // rd_s     <= 2'b00;
                    //ALU_A_s   <= 1'b0;
                    //ALU_B_s   <= 2'b00;
                    // ALU_OP   <= 4'b1000;
                    W_Rdata_s   <= 1'b1;
                end
                S18:begin
                    // Write_PC  <= 1'b0;
                    // Write_IR  <= 1'b0;
                    Write_Reg    <= 1'b0;
                    // LA        <= 1'b0;
                    // LB        <= 1'b0;
                    // LC        <= 1'b0;
                    // LF        <= 1'b0;
                    //S          <= 1'b0;
                    //PC_s       <= 2'b00;
                    // rd_s      <= 2'b00;
                    //ALU_A_s    <= 1'b0;
                    //ALU_B_s    <= 2'b00;
                    // ALU_OP    <= 4'b1000;
                    // W_Rdata_s <= 1'b1;
                    Mem_Write    <= 1'b1;
                    Mem_W_s      <= 1'b0;
                end
                S26:begin
                    Write_PC     <= 1'b1;
                    // Write_IR  <= 1'b0;
                    //Write_Reg  <= 1'b0;
                    //LA         <= 1'b1;
                    //LB         <= 1'b1;
                    //LC         <= 1'b1;
                    LF           <= 1'b0;
                    S            <= 1'b0;
                    PC_s         <= 2'b10;
                    //rd_s       <= 2'b00;
                    //ALU_A_s    <= 1'b0;
                    //ALU_B_s    <= 2'b00;
                    //W_Rdata_s  <= 0;
                    //Reg_C_s    <= 1'b0;
                    //Mem_Write  <= 1'b0;
                    //Mem_W_s    <= 1'b0;
                    Write_CPSR   <= 1'b1;
                    //Write_SPSR <= 1'b0;
                    // ALU_OP    <= 4'b0000;
                    W_CPSR_s     <= 3'b000;
                    //W_SPSR_s   <= 1'b0;
                    SP_out       <= 1'b1;
                    //SP_in      <= 1'b0;
                    //Change_M   <= 3'b000;
                end
                S27:begin
                    Write_PC     <= 1'b0;
                    // Write_IR  <= 1'b0;
                    //Write_Reg  <= 1'b0;
                    //LA         <= 1'b1;
                    //LB         <= 1'b1;
                    //LC         <= 1'b1;
                    // LF        <= 1'b0;
                    // S         <= 1'b0;
                    PC_s         <= 2'b00;
                    //rd_s       <= 2'b00;
                    //ALU_A_s    <= 1'b0;
                    //ALU_B_s    <= 2'b00;
                    //W_Rdata_s  <= 0;
                    //Reg_C_s    <= 1'b0;
                    //Mem_Write  <= 1'b0;
                    //Mem_W_s    <= 1'b0;
                    Write_CPSR   <= 1'b0;
                    //Write_SPSR <= 1'b0;
                    // ALU_OP    <= 4'b0000;
                    W_CPSR_s     <= 3'b000;
                    //W_SPSR_s   <= 1'b0;
                    SP_out       <= 1'b0;
                    SP_in        <= 1'b1;
                    // Change_M  <= 3'b000;
                    INTA_irq     <= 1'b0;
                end
                S28:begin
                    // Write_PC  <= 1'b0;
                    // Write_IR  <= 1'b0;
                    //Write_Reg  <= 1'b0;
                    LA           <= 1'b0;
                    LB           <= 1'b0;
                    LC           <= 1'b0;
                    LF           <= 1'b1;
                    S            <= IR[20];
                    //PC_s       <= 2'b00;
                    //rd_s       <= 2'b00;
                    //ALU_A_s    <= 1'b0;
                    //ALU_B_s    <= 2'b00;
                    //W_Rdata_s  <= 0;
                    //Reg_C_s    <= 1'b0;
                    //Mem_Write  <= 1'b0;
                    //Mem_W_s    <= 1'b0;
                    //Write_CPSR <= 1'b0;
                    //Write_SPSR <= 1'b0;
                    ALU_OP       <= 4'b1101;
                    //W_CPSR_s   <= 3'b000;
                    //W_SPSR_s   <= 1'b0;
                    //SP_out     <= 1'b0;
                    //SP_in      <= 1'b0;
                    //Change_M   <= 3'b000;
                end
                S29:begin
                    Write_PC    <= 1'b0;
                    Write_IR    <= 1'b0;
                    Write_Reg   <= 1'b0;
                    LA          <= 1'b0;
                    LB          <= 1'b0;
                    LC          <= 1'b0;
                    LF          <= 1'b1;
                    S           <= 1'b0;
                    rm_imm_s    <= 1'b0;
                    rs_imm_s    <= 2'b00;
                    PC_s        <= 2'b00;
                    rd_s        <= 2'b00;
                    ALU_A_s     <= 1'b1;
                    ALU_B_s     <= 2'b00;
                    W_Rdata_s   <= 1'b0;
                    Reg_C_s     <= 1'b0;
                    Mem_Write   <= 1'b0;
                    Mem_W_s     <= 1'b0;
                    Write_CPSR  <= 1'b0;
                    Write_SPSR  <= 1'b0;
                    ALU_OP      <= 4'b1000;
                    W_CPSR_s    <= 3'b000;
                    W_SPSR_s    <= 1'b0;
                    SP_out      <= 1'b0;
                    SP_in       <= 1'b0;
                    // Change_M <= 3'b000;
                    INTA_irq    <= 1'b0;
                end
                S30:begin
                    // Write_PC   <= 1'b0;
                    // Write_IR   <= 1'b0;
                    Write_Reg     <= 1'b1;
                    // LA         <= 1'b0;
                    // LB         <= 1'b0;
                    // LC         <= 1'b0;
                    LF            <= 1'b0;
                    // S          <= 1'b0;
                    // rm_imm_s   <= 1'b0;
                    // rs_imm_s   <= 2'b00;
                    // PC_s       <= 2'b00;
                    rd_s          <= 2'b01;
                    ALU_A_s       <= 1'b0;
                    // ALU_B_s    <= 2'b00;
                    // W_Rdata_s  <= 1'b0;
                    // Reg_C_s    <= 1'b0;
                    // Mem_Write  <= 1'b0;
                    // Mem_W_s    <= 1'b0;
                    // Write_CPSR <= 1'b0;
                    Write_SPSR    <= 1'b1;
                    ALU_OP        <= 4'b0000;
                    // W_CPSR_s   <= 3'b000;
                    W_SPSR_s      <= 1'b1;
                    // SP_out     <= 1'b0;
                    // SP_in      <= 1'b0;
                    Change_M      <= 3'b010;
                end
                S31:begin
                    Write_PC     <= 1'b1;
                    // Write_IR  <= 1'b0;
                    Write_Reg    <= 1'b0;
                    // LA        <= 1'b0;
                    // LB        <= 1'b0;
                    // LC        <= 1'b0;
                    // LF        <= 1'b0;
                    // S         <= 1'b0;
                    // rm_imm_s  <= 1'b0;
                    // rs_imm_s  <= 2'b00;
                    PC_s         <= 2'b11;
                    rd_s         <= 2'b00;
                    // ALU_A_s   <= 1'b0;
                    // ALU_B_s   <= 2'b00;
                    // W_Rdata_s <= 1'b0;
                    // Reg_C_s   <= 1'b0;
                    // Mem_Write <= 1'b0;
                    // Mem_W_s   <= 1'b0;
                    Write_CPSR   <= 1'b1;
                    Write_SPSR   <= 1'b0;
                    // ALU_OP    <= 4'b0000;
                    W_CPSR_s     <= 2'b010;
                    W_SPSR_s     <= 1'b0;
                    SP_out       <= 1'b1;
                    // SP_in     <= 1'b0;
                    Change_M     <= 3'b000;
                    INTA_irq     <= 1'b1;
                end
            endcase
        end
        
    end
    
endmodule

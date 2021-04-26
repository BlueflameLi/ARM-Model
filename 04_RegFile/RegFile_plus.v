`timescale 1ns / 1ps

module RegFile_plus(clk,
                    Rst,
                    Write_Reg,
                    Write_PC,
                    M,
                    R_Addr_A,
                    R_Addr_B,
                    R_Addr_C,
                    W_Addr,
                    W_Data,
                    PC_New,
                    R_Data_A,
                    R_Data_B,
                    R_Data_C,
                    PC);
    parameter ADDR = 4;//寄存器编码/地址位宽
    parameter SIZE = 32;//寄存器数据位宽
    
    input clk;//写入时钟信号
    input Rst;//清零信号
    input Write_Reg, Write_PC;//控制信号
    input [5:1] M;//模式选择
    input [ADDR:1] R_Addr_A, R_Addr_B, R_Addr_C;//三个端口读寄存器地址
    input [ADDR:1] W_Addr;//写寄存器地址
    input [SIZE:1] W_Data,PC_New;//写入数据
    
    output reg [SIZE:1] R_Data_A, R_Data_B, R_Data_C;//三个端口读出数据
    output reg [SIZE:1] PC;

    reg [SIZE:1] R[0:14],R_fiq[8:14],R_irq[13:14],R_abt[13:14],R_svc[13:14],R_und[13:14],R_mon[13:14],R13_hyp;
    integer i;//用于遍历寄存器

    reg Error;
    
    initial//初始化寄存器
        begin
            for(i = 0 ; i < 8 ; i = i+1) begin R[i] <= 0; end
            for(i = 8 ; i < 13; i = i+1) begin R[i] <= 0; R_fiq[i] <= 0; end
            for(i = 13; i < 15; i = i+1) begin R[i] <= 0; R_fiq[i] <= 0; R_irq[i] <= 0; R_abt[i] <= 0; R_svc[i] <= 0; R_und[i] <= 0; R_mon[i] <= 0; end
            R13_hyp <= 0;
            PC   <= 0;
        end
    
    always@(negedge clk or posedge Rst)
    begin
        if (Rst)//清零
        begin
            for(i = 0 ; i < 8 ; i = i+1) begin R[i] <= 0; end
            for(i = 8 ; i < 13; i = i+1) begin R[i] <= 0; R_fiq[i] <= 0; end
            for(i = 13; i < 15; i = i+1) begin R[i] <= 0; R_fiq[i] <= 0; R_irq[i] <= 0; R_abt[i] <= 0; R_svc[i] <= 0; R_und[i] <= 0; R_mon[i] <= 0; end
            R13_hyp <= 0;
            PC   <= 0;
        end
        else
        begin
            if(!M[5] || W_Addr == 15)
                Error <= 1; 
            else if (Write_Reg)
            begin
                Error <= 0;
                case(M[4:1])
                    4'b0000://usr
                        R[W_Addr] <= W_Data;
                    4'b0001://fiq
                        if(W_Addr >=8 && W_Addr <= 14)
                            R_fiq[W_Addr] <= W_Data;
                        else
                            R[W_Addr]<= W_Data;
                    4'b0010://irq
                        if(W_Addr ==13 || W_Addr == 14)
                            R_irq[W_Addr] <= W_Data;
                        else
                            R[W_Addr]<= W_Data;
                    4'b0011://svc
                        if(W_Addr ==13 || W_Addr == 14)
                            R_svc[W_Addr] <= W_Data;
                        else
                            R[W_Addr] <= W_Data;
                    4'b0110://mon
                        if(W_Addr ==13 || W_Addr == 14)
                            R_mon[W_Addr] <= W_Data;
                        else
                            R[W_Addr]<= W_Data;
                    4'b0111://abt
                        if(W_Addr ==13 || W_Addr == 14)
                            R_abt[W_Addr] <= W_Data;
                        else
                            R[W_Addr] <= W_Data;
                    4'b1010://hyp
                        if(W_Addr == 13)
                            R13_hyp <= W_Data;
                        else if(W_Addr == 14)
                            Error <= 1;
                        else
                            R[W_Addr] <= W_Data;
                    4'b1011://und
                        if(W_Addr ==13 || W_Addr == 14)
                            R_und[W_Addr] <= W_Data;
                        else
                            R[W_Addr] <= W_Data;
                    4'b1111://sys
                        R[W_Addr] <= W_Data;
                    default: Error <= 1;
                endcase
            end
            if(Write_PC)
                PC <= PC_New;
                
        end
    end

    always@(*)
    begin
        Error <= 0;
        if(R_Addr_A == 13)
            case(M[5:1])
                5'b10000:R_Data_A = R[13];//usr
                5'b10001:R_Data_A = R_fiq[13];//fiq
                5'b10010:R_Data_A = R_irq[13];//irq
                5'b10011:R_Data_A = R_svc[13];//svc
                5'b10110:R_Data_A = R_mon[13];//mon
                5'b10111:R_Data_A = R_abt[13];//abt
                5'b11010:R_Data_A = R13_hyp;//hyp
                5'b11011:R_Data_A = R_und[13];//und
                5'b11111:R_Data_A = R[13];//sys
                default:Error <= 1;
            endcase
        else if(R_Addr_A == 14)
            case(M[5:1])
                5'b10000:R_Data_A = R[14];//usr
                5'b10001:R_Data_A = R_fiq[14];//fiq
                5'b10010:R_Data_A = R_irq[14];//irq
                5'b10011:R_Data_A = R_svc[14];//svc
                5'b10110:R_Data_A = R_mon[14];//mon
                5'b10111:R_Data_A = R_abt[14];//abt
                5'b11011:R_Data_A = R_und[14];//und
                5'b11111:R_Data_A = R[14];//sys
                default:Error <= 1;
            endcase
        else if(R_Addr_A == 15)
            R_Data_A = PC;
        else if(R_Addr_A >=8 && R_Addr_A <=12 && M[4:1]==4'b0001)
            R_Data_A = R_fiq[R_Addr_A];
        else 
            R_Data_A = R[R_Addr_A];
    end

    always@(*)
    begin
        Error <= 0;
        if(R_Addr_B == 13)
            case(M[5:1])
                5'b10000:R_Data_B = R[13];//usr
                5'b10001:R_Data_B = R_fiq[13];//fiq
                5'b10010:R_Data_B = R_irq[13];//irq
                5'b10011:R_Data_B = R_svc[13];//svc
                5'b10110:R_Data_B = R_mon[13];//mon
                5'b10111:R_Data_B = R_abt[13];//abt
                5'b11010:R_Data_B = R13_hyp;//hyp
                5'b11011:R_Data_B = R_und[13];//und
                5'b11111:R_Data_B = R[13];//sys
                default:Error <= 1;
            endcase
        else if(R_Addr_B == 14)
            case(M[5:1])
                5'b10000:R_Data_B = R[14];//usr
                5'b10001:R_Data_B = R_fiq[14];//fiq
                5'b10010:R_Data_B = R_irq[14];//irq
                5'b10011:R_Data_B = R_svc[14];//svc
                5'b10110:R_Data_B = R_mon[14];//mon
                5'b10111:R_Data_B = R_abt[14];//abt
                5'b11011:R_Data_B = R_und[14];//und
                5'b11111:R_Data_B = R[14];//sys
                default:Error <= 1;
            endcase
        else if(R_Addr_B == 15)
            R_Data_B = PC;
        else if(R_Addr_B >=8 && R_Addr_B <=12 && M[4:1]==4'b0001)
            R_Data_B = R_fiq[R_Addr_B];
        else 
            R_Data_B = R[R_Addr_B];
    end

    always@(*)
    begin
        if(R_Addr_C == 13)
            case(M[5:1])
                5'b10000:R_Data_C = R[13];//usr
                5'b10001:R_Data_C = R_fiq[13];//fiq
                5'b10010:R_Data_C = R_irq[13];//irq
                5'b10011:R_Data_C = R_svc[13];//svc
                5'b10110:R_Data_C = R_mon[13];//mon
                5'b10111:R_Data_C = R_abt[13];//abt
                5'b11010:R_Data_C = R13_hyp;//hyp
                5'b11011:R_Data_C = R_und[13];//und
                5'b11111:R_Data_C = R[13];//sys
                default:Error <= 1;
            endcase
        else if(R_Addr_C == 14)
            case(M[5:1])
                5'b10000:R_Data_C = R[14];//usr
                5'b10001:R_Data_C = R_fiq[14];//fiq
                5'b10010:R_Data_C = R_irq[14];//irq
                5'b10011:R_Data_C = R_svc[14];//svc
                5'b10110:R_Data_C = R_mon[14];//mon
                5'b10111:R_Data_C = R_abt[14];//abt
                5'b11011:R_Data_C = R_und[14];//und
                5'b11111:R_Data_C = R[14];//sys
                default:Error <= 1;
            endcase
        else if(R_Addr_C == 15)
            R_Data_C = PC;
        else if(R_Addr_C >=8 && R_Addr_C <=12 && M[4:1]==4'b0001)
            R_Data_C = R_fiq[R_Addr_C];
        else 
            R_Data_C = R[R_Addr_C];
    end

endmodule

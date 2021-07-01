`timescale 1ns / 1ps

module register_pile(input clk,
                     input rst,
                     input Write_PC,
                     input Write_Reg,
                     input LA,
                     input LB,
                     input LC,
                     input [2:0] Change_M,
                     input [3:0] R_Addr_A,
                     input [3:0] R_Addr_B,
                     input [3:0] R_Addr_C,
                     input [3:0] W_Addr,
                     input [31:0] CPSR,
                     input [31:0] W_Data,
                     input [31:0] PC_New,
                     output reg [31:0] R_Data_A,
                     output reg [31:0] R_Data_B,
                     output reg [31:0] R_Data_C,
                     output [31:0] R15);
    
    reg [4:0] M;
    reg [31:0] REG_Pile [0:15];
    reg [31:0] REG_File_user [0:15];
    reg [31:0] REG_File_fiq [8:12];
    reg [31:0] R_fiq[13:14], R_svc[13:14],R_abt[13:14],R_irq[13:14],R_und[13:14],R_mon[13:14],R_hyp;
    
    integer i;
    
    always@(Change_M or CPSR[4:0]) begin
        case(Change_M)
            3'd0: M <= CPSR[4:0];
            3'd1: M <= 5'b10001; //fiq
            3'd2: M <= 5'b10010; //irq
            3'd3: M <= 5'b10011; //svc
            3'd4: M <= 5'b11011; //und
        endcase
    end
    
    always@ (negedge clk)
    begin
        for(i = 0;i<13;i = i+1)
            REG_Pile[i] <= REG_File_user[i];
            if (CPSR[1:0] == 2'b01)
            begin
                REG_Pile[8]  <= REG_File_fiq[8];
                REG_Pile[9]  <= REG_File_fiq[9];
                REG_Pile[10] <= REG_File_fiq[10];
                REG_Pile[11] <= REG_File_fiq[11];
                REG_Pile[12] <= REG_File_fiq[12];
            end
                case(M[3:0])
                    //two ways selecter
                    //user
                    4'b0000:
                    begin
                        REG_Pile[13] <= REG_File_user[13];
                        REG_Pile[14] <= REG_File_user[14];
                    end
                    //sys
                    4'b1111:
                    begin
                        REG_Pile[13] <= REG_File_user[13];
                        REG_Pile[14] <= REG_File_user[14];
                    end
                    //fiq
                    4'b0001:
                    begin
                        REG_Pile[13] <= R_fiq[13];
                        REG_Pile[14] <= R_fiq[14];
                    end
                    //irq
                    4'b0010:
                    begin
                        REG_Pile[13] <= R_irq[13];
                        REG_Pile[14] <= R_irq[14];
                    end
                    //svc
                    4'b0011:
                    begin
                        REG_Pile[13] <= R_svc[13];
                        REG_Pile[14] <= R_svc[14];
                    end
                    //mon
                    4'b0110:
                    begin
                        REG_Pile[13] <= R_mon[13];
                        REG_Pile[14] <= R_mon[14];
                    end
                    //abt
                    4'b0111:
                    begin
                        REG_Pile[13] <= R_abt[13];
                        REG_Pile[14] <= R_abt[14];
                    end
                    //hyp
                    4'b1010:
                    begin
                        REG_Pile[13] <= R_hyp;
                    end
                    //und
                    4'b1011:
                    begin
                        REG_Pile[13] <= R_und[13];
                        REG_Pile[14] <= R_und[14];
                    end
                    default:;
                endcase
    end
    
    always@ (negedge clk or posedge rst)
    begin
        if (rst) begin
            for(i = 0;i < 16;i = i + 1)
            begin
                REG_Pile[i]      <= 0;
                REG_File_user[i] <= 0;
                REG_File_fiq[i]  <= 0;
                R_fiq[i]         <= 0;
                R_svc[i]         <= 0;
                R_abt[i]         <= 0;
                R_irq[i]         <= 0;
                R_und[i]         <= 0;
                R_mon[i]         <= 0;
            end
            R_hyp <= 0;
        end
        else if (Write_Reg) begin
            //·ÖÅäÆ÷
            if (W_Addr<8)
                REG_File_user[W_Addr] <= W_Data;
            else if (W_Addr >= 8 && W_Addr<13)
                case(CPSR[1:0])
                    2'b01:REG_File_fiq[W_Addr] <= W_Data;
                    default:
                    REG_File_user[W_Addr] <= W_Data;
                endcase
            else
                case(M[3:0])
                    4'b0000:REG_File_user[W_Addr] <= W_Data;
                    4'b1111:REG_File_user[W_Addr] <= W_Data;
                    4'b0001:R_fiq[W_Addr]         <= W_Data;
                    4'b0010:R_irq[W_Addr]         <= W_Data;
                    4'b0011:R_svc[W_Addr]         <= W_Data;
                    4'b0110:R_mon[W_Addr]         <= W_Data;
                    4'b0111:R_abt[W_Addr]         <= W_Data;
                    4'b1010:R_hyp                 <= W_Data;
                    4'b1011:R_und[W_Addr]         <= W_Data;
                    default:;
                endcase
                if (Write_PC)
                    REG_Pile[15] <= PC_New;
                    end
                    end
            
            // assign R_Data_A = REG_Pile[R_Addr_A];
            // assign R_Data_B = REG_Pile[R_Addr_B];
            // assign R_Data_C = REG_Pile[R_Addr_C];
            assign R15         = REG_Pile[15];
            
            always@(negedge clk or posedge rst)
                if (rst)
                    R_Data_A <= 0;
                else if (LA)
                    R_Data_A <= REG_Pile[R_Addr_A];
            
            always@(negedge clk or posedge rst)
                if (rst)
                    R_Data_B <= 0;
                else if (LB)
                    R_Data_B <= REG_Pile[R_Addr_B];
            
            always@(negedge clk or posedge rst)
                if (rst)
                    R_Data_C <= 0;
                else if (LC)
                    R_Data_C <= REG_Pile[R_Addr_C];
            
            endmodule

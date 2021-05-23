`timescale 1ns / 1ps
module Shift(SHIFT_OP,
             Shift_Data,
             Shift_Num,
             Carry_flag,
             Shift_Out,
             Shift_Carry_Out);
    input [32:1] Shift_Data;
    input [8:1] Shift_Num;
    input [3:1] SHIFT_OP;
    input Carry_flag;
    output reg [32:1] Shift_Out;
    output reg Shift_Carry_Out;
    
    always@(*)
    begin
        case(SHIFT_OP[3:2])
            2'b00://lsl
            begin
                if (~|Shift_Num)
                begin
                    Shift_Out       = Shift_Data;
                    Shift_Carry_Out = 1'bx;
                end
                else if (Shift_Num >= 1 && Shift_Num <= 32)
                begin
                    Shift_Out       = (Shift_Data << Shift_Num);
                    Shift_Carry_Out = Shift_Data[33-Shift_Num];
                end
                else
                begin
                    Shift_Out       = 0;
                    Shift_Carry_Out = 0;
                end
            end
            2'b01://lsr
            begin
                if (~|Shift_Num)
                    if (SHIFT_OP[1])
                    begin
                        Shift_Out       = Shift_Data;
                        Shift_Carry_Out = 1'bx;
                    end
                    else
                    begin
                        Shift_Out       = 0;
                        Shift_Carry_Out = Shift_Data[32];
                    end
                else if (Shift_Num >= 1 && Shift_Num <= 32)
                begin
                    Shift_Out       = (Shift_Data >> Shift_Num);
                    Shift_Carry_Out = Shift_Data[Shift_Num];
                end
                else
                begin
                    Shift_Out       = 0;
                    Shift_Carry_Out = 0;
                end
            end
            2'b10://asr
            begin
                if (~|Shift_Num)
                    if (SHIFT_OP[1])
                    begin
                        Shift_Out       = Shift_Data;
                        Shift_Carry_Out = 1'bx;
                    end
                    else
                    begin
                        Shift_Out       = {32{Shift_Data[32]}};
                        Shift_Carry_Out = Shift_Data[32];
                    end
                else if (Shift_Num >= 1 && Shift_Num <= 31)
                begin
                    Shift_Out       = ({{32{Shift_Data[32]}},Shift_Data}>>Shift_Num);
                    Shift_Carry_Out = Shift_Data[Shift_Num];
                end
                else
                begin
                    Shift_Out       = {32{Shift_Data[32]}};
                    Shift_Carry_Out = Shift_Data[32];
                end
            end
            2'b11://ror
            begin
                if (~|Shift_Num)
                    if (SHIFT_OP[1])
                    begin
                        Shift_Out       = Shift_Data;
                        Shift_Carry_Out = 1'bx;
                    end
                    else
                    begin
                        Shift_Out       = {Carry_flag, Shift_Data[32:2]};
                        Shift_Carry_Out = Shift_Data[1];
                    end
                else if (Shift_Num >= 1 && Shift_Num <= 32)
                begin
                    Shift_Out       = ({Shift_Data,Shift_Data}>>Shift_Num);
                    Shift_Carry_Out = Shift_Data[Shift_Num];
                end
                else
                begin
                    Shift_Out <= ({{32{Shift_Data}},Shift_Data}>>Shift_Num[5:1]);
                    if (~|Shift_Num[5:1])
                        Shift_Carry_Out = Shift_Data[32];
                    else
                        Shift_Carry_Out = Shift_Data[Shift_Num[5:1]];
                end
            end
        endcase
    end
endmodule

`timescale 1ns / 1ps

module ALU_Shift(SHIFT_OP,
                 Shift_Data,
                 Shift_Num,
                 ALU_OP,
                 A,
                 CF,
                 VF,
                 NZCV,
                 F);

    input [32:1] Shift_Data;
    input [8:1] Shift_Num;
    input [3:1] SHIFT_OP;
    input [4:1] ALU_OP;
    input [32:1] A;
    input CF,VF;
    output [4:1] NZCV;
    output [32:1] F;
    wire [32:1] Shift_Out;
    wire Shift_Carry_Out;
    
    
    Shift Shift_Instance(.SHIFT_OP(SHIFT_OP),.Shift_Data(Shift_Data),.Shift_Num(Shift_Num),.Carry_flag(CF),.Shift_Out(Shift_Out),.Shift_Carry_Out(Shift_Carry_Out));
    ALU ALU_Instance(ALU_OP,A,Shift_Out,Shift_Carry_Out,CF,VF,NZCV,F);
    

    
endmodule

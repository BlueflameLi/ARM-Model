`timescale 1ns / 1ps

module ALU_Shift(clk,
                 Rst,
                 SHIFT_OP,
                 Shift_Data,
                 Shift_Num,
                 ALU_OP,
                 A,
                 CF,
                 VF,
                 NZCV,
                 F,
                 LF,
                 S);
    
    input clk,Rst,LF,S;
    input [32:1] Shift_Data;
    input [8:1] Shift_Num;
    input [3:1] SHIFT_OP;
    input [4:1] ALU_OP;
    input [32:1] A;
    input CF,VF;
    output reg [3:0] NZCV;
    output reg [31:0] F;
    
    wire Shift_Carry_Out;
    wire [3:0] NZCV_New;
    wire [31:0] Shift_Out,F_New;
    
    Shift Shift_Instance(.SHIFT_OP(SHIFT_OP),.Shift_Data(Shift_Data),.Shift_Num(Shift_Num),.Carry_flag(CF),.Shift_Out(Shift_Out),.Shift_Carry_Out(Shift_Carry_Out));
    ALU ALU_Instance(ALU_OP,A,Shift_Out,Shift_Carry_Out,CF,VF,NZCV_New,F_New);
    
    always@(negedge clk or posedge Rst)
        if (Rst)
            NZCV <= 0;
        else if (S)
            NZCV <= NZCV_New;
    
    always@(negedge clk or posedge Rst)
        if (Rst)
            F <= 0;
        else if (LF)
            F <= F_New;
    
endmodule

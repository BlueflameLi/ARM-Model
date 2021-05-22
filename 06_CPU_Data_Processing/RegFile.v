`timescale 1ns / 1ps

module RegFile(clk,
               Rst,
               Write_Reg,
               LA,
               LB,
               LC,
               R_Addr_A,
               R_Addr_B,
               R_Addr_C,
               W_Addr,
               W_Data,
               R_Data_A,
               R_Data_B,
               R_Data_C);
    parameter ADDR = 4;//寄存器编码/地址位宽
    parameter NUM  = 1<<ADDR;//寄存器个数
    parameter SIZE = 32;//寄存器数据位宽
    
    input clk;//写入时钟信号
    input Rst;//清零信号
    input Write_Reg;//写控制信号
    input LA,LB,LC;
    input [ADDR:1] R_Addr_A, R_Addr_B, R_Addr_C;//三个端口读寄存器地址
    input [ADDR:1] W_Addr;//写寄存器地址
    input [SIZE:1] W_Data;//写入数据
    
    output reg [SIZE:1] R_Data_A, R_Data_B, R_Data_C;//三个端口读出数据
    
    reg [SIZE:1] REG_Files[0:NUM-1];//寄存器堆本体
    integer i;
    
    always@(negedge clk or posedge Rst)
        if (Rst)//清零
            for(i = 0;i<NUM;i = i+1) REG_Files[i] <= 0;
        else if (Write_Reg)
            REG_Files[W_Addr] <= W_Data;
    
    always@(negedge clk or posedge Rst)
        if (Rst)
            R_Data_A <= 0;
        else if (LA)
            R_Data_A <= REG_Files[R_Addr_A];
    
    always@(negedge clk or posedge Rst)
        if (Rst)
            R_Data_B <= 0;
        else if (LB)
            R_Data_B <= REG_Files[R_Addr_B];
    
    always@(negedge clk or posedge Rst)
        if (Rst)
            R_Data_C <= 0;
        else if (LC)
            R_Data_C <= REG_Files[R_Addr_C];
    
endmodule

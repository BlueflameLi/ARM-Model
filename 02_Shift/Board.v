`timescale 1ns / 1ps

module Board(sw,
             swb,
             led,
             clk,
             which,
             seg,
             enable);
    input [1:32] sw;//开关
    input [1:6] swb;//按钮
    
    reg [32:1] Shift_Data;
    reg [8:1] Shift_Num;
    reg [3:1] SHIFT_OP;
    reg Carry_flag = 0;
    wire [32:1] Shift_Out;
    wire Shift_Carry_Out;
    
    output [1:32] led;
    
    input clk; // 数码管相关
    output [2:0] which;
    output [7:0] seg;
    output reg enable = 1; // 默认开启数码管使能
    
    always @(posedge swb[1]) Shift_Data           <= sw;            //按第一个按钮输入Shift_Data
    always @(posedge swb[2]) {Shift_Num,SHIFT_OP} <= sw[1:11];      //按第二个按钮输入Shift_Num(前8位)和SHIFT_OP(后3位)
    always @(posedge swb[6]) Carry_flag           <= ~Carry_flag;   //按第六个按钮切换Carry_flag
    
    Shift Shift_Instance(.clk(clk),.SHIFT_OP(SHIFT_OP),.Shift_Data(Shift_Data),.Shift_Num(Shift_Num),.Carry_flag(Carry_flag),.Shift_Out(Shift_Out),.Shift_Carry_Out(Shift_Carry_Out));
    
    assign led = {Shift_Carry_Out,31'h00000000}; //第一个led灯显示移位进位
    
    
    Display Display_Instance(.clk(clk), .data(Shift_Out),
    .which(which), .seg(seg));
    
endmodule

`timescale 1ns / 1ps
// 8 位七段数码管扫描显示模块
module Show(clk,
            which,
            seg,
            count); // 调试接口
    input clk; // 接入系统时钟
    output reg [2:0] which = 0; // 片选编码（驱动哪一位数码管），低电平有效
    output reg [7:0] seg; // 段选信号（点亮哪些笔划），低电平有效
    
    output reg [10:0] count = 0; // 分频扫描，从左至右循环驱动每一位数码管
    always @(posedge clk) count             <= count + 1'b1;
    always @(negedge clk) if (&count) which <= which + 1'b1;
    
    always @*
    seg <= 8'b0000_0000;
    
    
endmodule // Display

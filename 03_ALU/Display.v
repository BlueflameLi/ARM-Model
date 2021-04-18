`timescale 1ns / 1ps
// 8 位七段数码管扫描显示模块
module Display(clk, data, which, seg,
    count, digit); // 调试接口
    input clk; // 接入系统时钟
    input [32:0] data; // 32 位显示数据
    output reg [2:0] which = 0; // 片选编码（驱动哪一位数码管），低电平有效
    output reg [7:0] seg; // 段选信号（点亮哪些笔划），低电平有效

    output reg [10:0] count = 0; // 分频扫描，从左至右循环驱动每一位数码管
    always @(posedge clk) count <= count + 1'b1;
    always @(negedge clk) if (&count) which <= which + 1'b1;

    output reg [3:0] digit; // 显示数据 片选得到 十六进制数码
    always @* case (which)
        0: digit <= data[32:29]; // 最高位
        1: digit <= data[28:25];
        2: digit <= data[24:21];
        3: digit <= data[20:17];
        4: digit <= data[16:13];
        5: digit <= data[12:09];
        6: digit <= data[08:05];
        7: digit <= data[04:01]; // 最低位
    endcase

    always @* case (digit) // 十六进制数码 转换为 段选信号（a,b,c,...g,dp）
        4'h0: seg <= {7'b0000_001,data[0]}; // 除 g、dp 外全亮，显示数码 0
        4'h1: seg <= {7'b1001_111,data[0]}; // 仅 b、c 亮，显示数码 1
        4'h2: seg <= {7'b0010_010,data[0]};
        4'h3: seg <= {7'b0000_110,data[0]};
        4'h4: seg <= {7'b1001_100,data[0]};
        4'h5: seg <= {7'b0100_100,data[0]};
        4'h6: seg <= {7'b0100_000,data[0]};
        4'h7: seg <= {7'b0001_111,data[0]};
        4'h8: seg <= {7'b0000_000,data[0]};
        4'h9: seg <= {7'b0000_100,data[0]};
        4'hA: seg <= {7'b0001_000,data[0]};
        4'hB: seg <= {7'b1100_000,data[0]};
        4'hC: seg <= {7'b0110_001,data[0]};
        4'hD: seg <= {7'b1000_010,data[0]};
        4'hE: seg <= {7'b0110_000,data[0]};
        4'hF: seg <= {7'b0111_000,data[0]};
    endcase

endmodule // Display

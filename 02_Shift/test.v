`timescale 1ns / 1ps
// 通过数据输入输出测试开关、LED、数码管；通过数码管使能测试按钮
module logical_shift_left(clk,
                          SHIFT_OP,
                          Shift_Data,
                          Shift_Num,
                          Shift_Out,
                          Shift_Carry_Out);
    input clk;
    input [32:1] Shift_Data;
    input [8:1] Shift_Num;
    input [3:1] SHIFT_OP;
    output reg [32:1] Shift_Out;output reg Shift_Carry_Out;
    always@(negedge clk)
    begin
        if (Shift_Num == 0)
        begin
            Shift_Out       = Shift_Data;
            Shift_Carry_Out = 1'bx;//不移位，进位位为未定态
        end
        else if (Shif t_Num > = 1 && Shif t_Num < = 32)
        begin
            Shift_Out <= (Shift_Data << Shift_Num[8:1]);
            Shift_Carry_Out = Shift_Data[33-Shift_Num];
        end
        else
        begin
            Shift_Out <= (Shift_Data << Shift_Num[8:1]);
            Shift_Carry_Out = 0;
        end
    end
    Display Display_Instance(.clk(clk), .data(Shift_Out),
    .which(which), .seg(seg));
endmodule
    
    module logical_shift_right(clk, SHIFT_OP, Shift_Data, Shift_Num, Shift_Out,
        Shift_Carry_Out);//要移位的数据，移位位数，移位的输出
        input clk;
        input [3:1] SHIFT_OP;
        input [32:1] Shift_Data;
        input [8:1] Shift_Num;
        output reg [32:1] Shift_Out;
        output reg Shift_Carry_Out;
        always@(negedge clk)
        begin
            if (Shif t_Num == 0)
                if (SHIFT_OP[1])
                begin
                    Shift_Out       = Shift_Data;
                    Shift_Carry_Out = 1'bx;
                end
                else//当Shift_Num和Shift_OP[1]都为0时，等价于右移32位。
                begin
                    Shift_Out       = 0;
                    Shift_Carry_Out = Shift_Data[32];
                end
            else if (Shif t_Num > = 1 && Shif t_Num < = 32)
            begin
                Shift_Out <= (Shift_Data >> Shift_Num[8:1]);
                Shift_Carry_Out = Shift_Data[Shift_Num];
            end
            else
            begin
                Shift_Out <= (Shift_Data >> Shift_Num[8:1]);
                Shift_Carry_Out = 0;
            end
        end
        Display Display_Instance(.clk(clk), .data(Shift_Out),
        .which(which), .seg(seg));
    endmodule
        
        module arithmetic_shift_right(clk, SHIFT_OP, Shift_Data, Shift_Num, Shift_Out,
            Shift_Carry_Out);//要移位的数据，移位位数，移位的输出
            input clk;
            input [3:1] SHIFT_OP;
            input [32:1] Shift_Data;
            input [8:1] Shift_Num;
            output reg [32:1] Shift_Out;
            output reg Shift_Carry_Out;
            always@(negedge clk)
            begin
                if (Shif t_Num == 0)
                    if (SHIFT_OP[1])
                    begin
                        Shift_Out       = Shift_Data;
                        Shift_Carry_Out = 1'bx;
                    end
                    else//当Shift_Num和Shift_OP[1]都为0时，等价于右移32位。
                    begin
                        Shift_Out       = ($signed(Shift_Data)) >>> 32;//转化为有符号数
                        Shift_Carry_Out = Shift_Data[32];
                    end
                else if (Shif t_Num > = 1 && Shif t_Num < = 31)
                begin
                    Shift_Out <= (($signed(Shift_Data)) >>> Shift_Num[8:1]);
                    Shift_Carry_Out = Shift_Data[Shift_Num];
                end
                else
                begin
                    Shift_Out <= (($signed(Shift_Data)) >>> Shift_Num[8:1]);
                    Shift_Carry_Out = Shift_Data[32];
                end
            end
            Display Display_Instance(.clk(clk), .data(Shift_Out),
            .which(which), .seg(seg));
        endmodule
            
            module rotate_right(clk, SHIFT_OP, Shift_Data, Shift_Num, Carry_flag, Shift_Out,
                Shift_Carry_Out);//要移位的数据，移位位数，移位的输出
                input clk;
                input [3:1] SHIFT_OP;
                input [32:1] Shift_Data;
                input [8:1] Shift_Num;
                input Carry_flag;
                output reg [32:1] Shift_Out;
                output reg Shift_Carry_Out;
                always@(negedge clk)
                begin
                    if (Shif t_Num == 0)
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
                    else if (Shif t_Num > = 1 && Shif t_Num < = 32)
                    begin
                        //中间使用“|”连接，等价于循环右移。
                        Shift_Out <= (Shift_Data << (32-Shift_Num)) | (Shift_Data >>
                        Shift_Num);;
                        Shift_Carry_Out = Shift_Data[Shift_Num];
                    end
                    else
                    begin
                        //中间使用"|"连接，等价于循环右移。
                        Shift_Out <= (Shift_Data << (32-Shift_Num[5:1])) | (Shift_Data >>
                        Shift_Num[5:1]);
                        if (Shif t_Num[5:1] == 0)//加入Shif t_Num是64，那么应该等价于右移32位
                            Shift_Carry_Out = Shift_Data[32];
                        else
                            Shift_Carry_Out = Shift_Data[Shift_Num[5:1]];
                    end
                end
                Display Display_Instance(.clk(clk), .data(Shift_Out),
                .which(which), .seg(seg));
            endmodule
                
                module Board(sw, swb, led, clk, which, seg, enable);
                    input [1:32] sw;
                    output [1:32] led;
                    reg [32:1] Shift_Data;
                    reg [8:1] Shift_Num;
                    reg [3:1] SHIFT_OP;
                    assign led = Shift_Data; // 寮�鍏宠緭鍏ユ暟鎹紝鐩存帴杈撳嚭鍒� LED
                    input [1:6] swb;
                    input clk; // 鏁扮爜绠＄浉鍏�
                    output [2:0] which;
                    output [7:0] seg;
                    reg [32:1] Shift_Out;
                    reg Shift_Carry_Out;
                    output reg enable = 1; // 榛樿寮�鍚暟鐮佺浣胯兘
                    //Display Display_Instance(.clk(clk), .data(sw),.which(which), .seg(seg));
                    always@(*)
                    begin
                        if (swb[1])
                            Shift_Data <= sw;
                        else if (swb[2])
                        begin
                            Shift_Num[8:1] <= sw[8:1];
                            SHIFT_OP[3:1]  <= sw[11:9];
                        end
                            else if (swb[3])
                            Shift_Carry_Out <= 1;
                            end
                            always@(swb[6])
                            begin
                                case(SHIFT_OP[3:2])
                                    2'b00:logical_shift_left(.clk(clk), .SHIFT_OP(SHIFT_OP), .Shift_Data(Shift_Data), .Shift_Num(Shift_Num), .Shift_Out(Shift_Out), .Shift_Carry_Out(Shift_Carry_Out));
                                    2'b01:logical_shift_right(.clk(clk), .SHIFT_OP(SHIFT_OP), .Shift_Data(Shift_Data), .Shift_Num(Shift_Num), .Shift_Out(Shift_Out), .Shift_Carry_Out(Shift_Carry_Out));
                                    2'b10:arithmetic_shift_right(.clk(clk), .SHIFT_OP(SHIFT_OP), .Shift_Data(Shift_Data), .Shift_Num(Shift_Num), .Shift_Out(Shift_Out), .Shift_Carry_Out(Shift_Carry_Out));
                                    2'b11:rotate_right(.clk(clk), .SHIFT_OP(SHIFT_OP), .Shift_Data(Shift_Data), .Shift_Num(Shift_Num), .Shift_Out(Shift_Out), .Shift_Carry_Out(Shift_Carry_Out));
                                endcase
                            end
                            assign toggle = |swb; // 鎸変笅浠绘剰鎸夐挳鍒囨崲鏁扮爜绠′娇鑳�
                            always @(posedge toggle) enable <= ~enable;
                            
                            endmodule // Board

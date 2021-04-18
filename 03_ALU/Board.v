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
    
    reg [32:1] A,B;
    reg [32:0] data,data1,data2;
    reg [4:1] ALU_OP;
    reg [3:1] SHIFT_OP;
    reg CF,VF;
    reg [32:1] Shift_Data;
    reg [8:1] Shift_Num;
    wire [32:1] F;
    wire [4:1] NZCV;
    wire [32:1] Shift_Out;
    wire Shift_Carry_Out;
    reg [2:1]cnt = 0, cnt2 = 0;
    output [1:32] led;
    
    input clk; // 数码管相关
    output [2:0] which;
    output [7:0] seg;
    output reg enable = 1; // 默认开启数码管使能
    
    reg dp = 1;
    
    always @(posedge swb[1])
    begin
        if (swb[2]) //第二个按钮按住时，才会有效
        begin
            case(cnt)
            0:begin A = sw; data1 <= {A,1}; end //第一次按swb[1] 输入A
            1:begin Shift_Data = sw; data1 <= {Shift_Data,1}; end
            2:begin {Shift_Num,SHIFT_OP,ALU_OP,CF,VF} = sw[1:17]; data1 <= {Shift_Num,SHIFT_OP,ALU_OP,CF,VF,15'h0000,1}; end //第三次按swb[1] 前四位为ALU_OP，后三位为CF,VF,Shift_Carry_Out
            default: data1 <= {32'h88888888,0};
            endcase
            cnt <= (cnt+1)%3;
        end
    end
    
    always @(posedge swb[3])
    begin
        case(cnt2)
        0:begin data2 <= {F,1}; end
        1:begin data2 <= {Shift_Out,1}; end
        default:begin data2 <= {32'h88888888,0}; end 
        endcase
        cnt2 <= (cnt2+1)%3;
    end
    
    always @(swb[1] or swb[3])
        case({swb[1],swb[3]})
        2'b01:data = data2;
        2'b10:data = data1;
        2'b11:data = data2;
        endcase
    
    Shift Shift_Instance(.SHIFT_OP(SHIFT_OP),.Shift_Data(Shift_Data),.Shift_Num(Shift_Num),.Carry_flag(CF),.Shift_Out(Shift_Out),.Shift_Carry_Out(Shift_Carry_Out));
    ALU ALU_Instance(ALU_OP,A,Shift_Out,Shift_Carry_Out,CF,VF,NZCV,F);
    
    assign led[1:4]   = NZCV; //前四位显示NZCV
    assign led[31:32] = cnt;//最后两位显示按swb[1]的次数
    assign led[5]     = Shift_Carry_Out;//第五位显示Shift_Carry_Out
    
    Display Display_Instance(.clk(clk), .data(data),
    .which(which), .seg(seg));
    
endmodule

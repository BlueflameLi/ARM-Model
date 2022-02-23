`timescale 1ns / 1ps

module Regfile_Board(sw,
                 swb,
                 led,
                 clk,
                 which,
                 seg,
                 enable);
    input [1:32] sw;
    input [1:6] swb;
    reg [4:1]  R_Addr_A, R_Addr_B, R_Addr_C;
    reg [4:1] W_Addr;
    reg [5:1] M;
    //reg Shift_Carry_Out = 0;
    reg Write_Reg,Write_PC;
    reg [32:1] W_Data,PC_New;
    reg [8:1] Shift_Num;
    reg [32:0] data;
    
    reg [2:1]cnt = 0;  
    reg [3:1]cnt2 = 0;
    wire [32:1] R_Data_A, R_Data_B, R_Data_C;//三个端口读出数据
    wire [32:1] PC;
    
    output [1:32] led;
    input clk; 
    output [2:0] which;
    output [7:0] seg;
    
    output reg enable = 1;
    
    always @(posedge swb[1])
    begin
        if (swb[2]) 
        begin
            case(cnt)
            0:begin {R_Addr_A, R_Addr_B, R_Addr_C} = sw[1:12]; M=sw[17:21]; W_Addr=sw[25:28]; Write_Reg=sw[31];Write_PC=sw[32]; end
            1:begin W_Data=sw; end
            2:begin PC_New=sw; end
            endcase
            cnt <= (cnt+1)%3;
        end
    end

    always @(posedge swb[6])
    begin
        case(cnt2)
        0:begin data <= {R_Data_A,1'b1}; end
        1:begin data <= {R_Data_B,1'b1}; end
        2:begin data <= {R_Data_C,1'b1}; end
        3:begin data <= {PC,1'b1}; end
        default:begin data <= {32'h88888888,1'b0}; end
        endcase
        cnt2 <= (cnt2+1)%5;
    end
    assign led[31:32] = cnt[2:1];
    assign led[17]=Write_Reg;
    assign led[18]=Write_PC;
    assign led[12:16]=M;
    assign led[1:3] = cnt2[3:1];
    RegFile_plus Reg(
        .clk(swb[3]),
        .Rst(swb[4]),
        .M(M),
        .PC_New(PC_New),
        .Write_PC(Write_PC),
        .Write_Reg(Write_Reg),
        .R_Addr_A(R_Addr_A),
        .R_Addr_B(R_Addr_B),
        .R_Addr_C(R_Addr_C),
        .W_Addr(W_Addr),
        .W_Data(W_Data),
        .R_Data_A(R_Data_A),
        .R_Data_B(R_Data_B),
        .R_Data_C(R_Data_C),
        .PC(PC)
    );
    Display Display_Instance(.clk(clk), .data(data),
    .which(which), .seg(seg));
    
endmodule

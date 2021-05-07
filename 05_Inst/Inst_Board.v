`timescale 1ns / 1ps
module Inst_Board(sw,
                 swb,
                 led,
                 clk,
                 which,
                 seg,
                 enable);
    input [1:32] sw;
    input [1:6] swb;
    output [1:32] led;
    input clk; 
    output [2:0] which;
    output [7:0] seg;
    output reg enable = 1;
    reg [4:1] NZCV;
    reg Write_IR, Write_PC;
    
    wire [4:1] condition_code;
    wire [28:1] IR;
    wire [6:1] Inst_addr;
    wire flag;
    reg [32:1] data;

    Inst I(swb[1],swb[2],Write_IR,Write_PC,NZCV,flag,Inst_addr,condition_code,IR);
    
    always @(*)
    begin
        NZCV=sw[1:4];
        Write_PC=sw[32];
        Write_IR=sw[31];
        data={condition_code,IR};
    end
    
    assign led[27:32] = Inst_addr;
    assign led[1] = flag;
    
    Display Display_Instance(.clk(clk), .data(data),
    .which(which), .seg(seg));
    
endmodule

`timescale 1ns / 1ps

module wsl(clk,
           S,
           LA,
           LB,
           LC,
           LF,
           R_Data_A,
           R_Data_B,
           R_Data_C,
           F_New,
           NZCV_New,
           A,
           B,
           C,
           F,
           NZCV);
    
    input clk,LA,LB,LC;
    input [31:0] R_Data_A,R_Data_B,R_Data_C;
    
    output reg [31:0] A,B,C,F;
    output reg [3:0] NZCV=0;
    

    
    
endmodule

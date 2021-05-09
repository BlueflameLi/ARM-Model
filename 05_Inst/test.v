`timescale 1ns / 1ps

module Test();
    reg clk,Rst,Write_IR,Write_PC;
    reg [4:1] NZCV;
    wire flag;
    wire [6:1] Inst_addr;
    wire [4:1] condition_code;
    wire [28:1] IR;
    initial
    begin
        clk=0; 
        
        Rst=1;   #50;

        Rst=0;  
        
        NZCV=4'b0100; Write_IR=1; Write_PC=1;     #40;

        NZCV=4'b0000; Write_IR=1; Write_PC=1;     #40;

        NZCV=4'b0000; Write_IR=1; Write_PC=1;     #40;

        NZCV=4'b0010; Write_IR=1; Write_PC=1;     #40;

        NZCV=4'b1000; Write_IR=1; Write_PC=1;     #40;

        NZCV=4'b0001; Write_IR=1; Write_PC=1;     #40;

        NZCV=4'b0011; Write_IR=1; Write_PC=1;     #40;



        NZCV=4'b0000; Write_IR=1; Write_PC=1;     #40;

        NZCV=4'b0110; Write_IR=1; Write_PC=1;     #40;

        NZCV=4'b0010; Write_IR=1; Write_PC=1;     #40;

        NZCV=4'b0100; Write_IR=1; Write_PC=1;     #40;



        NZCV=4'b1000; Write_IR=1; Write_PC=1;     #40;

        NZCV=4'b1001; Write_IR=1; Write_PC=1;     #40;



        NZCV=4'b0100; Write_IR=1; Write_PC=1;     #40;

        NZCV=4'b1001; Write_IR=1; Write_PC=1;     #40;

        NZCV=4'b1011; Write_IR=1; Write_PC=1;     #40;



        NZCV=4'b0000; Write_IR=1; Write_PC=0;     #40;

        NZCV=4'b1111; Write_IR=1; Write_PC=0;     #40;



        NZCV=4'b0100; Write_IR=1; Write_PC=1;     #40;

        NZCV=4'b0000; Write_IR=1; Write_PC=1;     #40;
        
        NZCV=4'b0000; Write_IR=1; Write_PC=1;     #40;

        NZCV=4'b0000; Write_IR=1; Write_PC=1;     #40;
    end
    always
    begin
        #20 clk=~clk;
    end
    Inst test(
        .clk(clk),
        .Rst(Rst),
        .Write_IR(Write_IR),
        .Write_PC(Write_PC),
        .NZCV(NZCV),
        .flag(flag),
        .Inst_addr(Inst_addr),
        .condition_code(condition_code),
        .IR(IR)
    );
endmodule
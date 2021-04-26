`timescale 1ns / 1ps

module Test();
    reg clk,Rst,Write_Reg,Write_PC;
    reg [5:1] M;
    reg [4:1] R_Addr_A,R_Addr_B,R_Addr_C,W_Addr;
    reg [32:1] W_Data,PC_New;
    wire [32:1] R_Data_A,R_Data_B,R_Data_C,PC;
    initial
    begin
        clk=0; Rst=1;
        R_Addr_A=0; R_Addr_B=0; R_Addr_C=0;
        Write_PC=0; PC_New=0;
        W_Addr=0; Write_Reg=0; W_Data=0;     #50;

        M=5'b10000;
        Rst=0; 
        R_Addr_A=4'b0010; R_Addr_B=4'b1011; R_Addr_C=4'b1101;
        Write_PC=1; PC_New=32'h00000008;
        W_Addr=4'b0010; Write_Reg=1; W_Data=32'hffffffff;     #50;

        Rst=0;
        R_Addr_A=4'b0010; R_Addr_B=4'b1011; R_Addr_C=4'b1101;
        Write_PC=1; PC_New=32'hf0f0f0f0;
        W_Addr=4'b1011; Write_Reg=1; W_Data=32'haaaaaaaa;     #50;

        Rst=0;
        R_Addr_A=4'b0010; R_Addr_B=4'b1011; R_Addr_C=4'b1101;
        Write_PC=1; PC_New=32'h87654321;
        W_Addr=4'b1101; Write_Reg=1; W_Data=32'h40404040;     #50;

        M=5'b10001;
        Rst=0;
        R_Addr_A=4'b0101; R_Addr_B=4'b1001; R_Addr_C=4'b1110;
        Write_PC=0; PC_New=0;
        W_Addr=4'b0101; Write_Reg=1; W_Data=32'h3f3f3f3f;     #50;
        
        Rst=0;
        R_Addr_A=4'b0101; R_Addr_B=4'b1001; R_Addr_C=4'b1110;
        Write_PC=0; PC_New=0;
        W_Addr=4'b1001; Write_Reg=1; W_Data=32'hf3f3f3f3;     #50;

        Rst=0;
        R_Addr_A=4'b0101; R_Addr_B=4'b1001; R_Addr_C=4'b1110;
        Write_PC=0; PC_New=0;
        W_Addr=4'b1110; Write_Reg=1; W_Data=32'h63636363;     #50;
        /*
        M=5'b10110;
        Rst=0;
        R_Addr_A=4'b0111; R_Addr_B=4'b1010; R_Addr_C=4'b1110;
        Write_PC=0; PC_New=0;
        W_Addr=4'b0111; Write_Reg=1; W_Data=32'h3f3f3f3f;     #50;

        Rst=0;
        R_Addr_A=4'b0111; R_Addr_B=4'b1010; R_Addr_C=4'b1110;
        Write_PC=0; PC_New=0;
        W_Addr=4'b1010; Write_Reg=1; W_Data=32'h81818181;     #50;

        Rst=0;
        R_Addr_A=4'b0111; R_Addr_B=4'b1010; R_Addr_C=4'b1110;
        Write_PC=0; PC_New=0;
        W_Addr=4'b1110; Write_Reg=1; W_Data=32'hf3f3f3f3;     #50;

        Rst=1;

        clk=0; Rst=1;
        R_Addr_A=0; R_Addr_B=0; R_Addr_C=0;
        Write_PC=0; PC_New=0;
        W_Addr=0; Write_Reg=0; W_Data=0;     #50;*/

        M=5'b10111;
        Rst=0; 
        R_Addr_A=4'b0001; R_Addr_B=4'b1000; R_Addr_C=4'b1111;
        Write_PC=0; PC_New=0;
        W_Addr=4'b0001; Write_Reg=1; W_Data=32'hffffffff;     #50;

        Rst=0;
        R_Addr_A=4'b0001; R_Addr_B=4'b1000; R_Addr_C=4'b1111;
        Write_PC=0; PC_New=0;
        W_Addr=4'b1111; Write_Reg=1; W_Data=32'haaaaaaaa;     #50;

        Rst=0;
        R_Addr_A=4'b0001; R_Addr_B=4'b1000; R_Addr_C=4'b1111;
        Write_PC=0; PC_New=0;
        W_Addr=4'b1000; Write_Reg=1; W_Data=32'h40404040;     #50;
        
        M=5'b11010;
        Rst=0;
        R_Addr_A=4'b0101; R_Addr_B=4'b1100; R_Addr_C=4'b1101;
        Write_PC=0; PC_New=0;
        W_Addr=4'b0101; Write_Reg=1; W_Data=32'h3f3f3f3f;     #50;
        
        Rst=0;
        R_Addr_A=4'b0101; R_Addr_B=4'b1100; R_Addr_C=4'b1101;
        Write_PC=0; PC_New=0;
        W_Addr=4'b1101; Write_Reg=1; W_Data=32'hf3f3f3f3;     #50;

        Rst=0;
        R_Addr_A=4'b0101; R_Addr_B=4'b1100; R_Addr_C=4'b1101;
        Write_PC=0; PC_New=0;
        W_Addr=4'b1100; Write_Reg=1; W_Data=32'h63636363;     #50;

        M=5'b11111;
        Rst=0;
        R_Addr_A=4'b0110; R_Addr_B=4'b1010; R_Addr_C=4'b1110;
        Write_PC=0; PC_New=0;
        W_Addr=4'b0110; Write_Reg=1; W_Data=32'h3f3f3f3f;     #50;

        Rst=0;
        R_Addr_A=4'b0110; R_Addr_B=4'b1010; R_Addr_C=4'b1110;
        Write_PC=0; PC_New=0;
        W_Addr=4'b1010; Write_Reg=1; W_Data=32'h81818181;     #50;

        Rst=0;
        R_Addr_A=4'b0110; R_Addr_B=4'b1010; R_Addr_C=4'b1110;
        Write_PC=0; PC_New=0;
        W_Addr=4'b1110; Write_Reg=1; W_Data=32'hf3f3f3f3;     #50;
        
        Rst=0;
        R_Addr_A=4'b0101; R_Addr_B=4'b1100; R_Addr_C=4'b1101;
        Write_PC=0; PC_New=0;
        W_Addr=0; Write_Reg=0; W_Data=0;     #50;
        
        Rst=0;
        R_Addr_A=4'b0101; R_Addr_B=4'b1001; R_Addr_C=4'b1110;
        Write_PC=0; PC_New=0;
        W_Addr=0; Write_Reg=0; W_Data=0;     #50;
        
        Rst=1;
    end
    always
    begin
        #10 clk=~clk;
    end
    RegFile_plus reg_test(
        .clk(clk),
        .Rst(Rst),
        .PC(PC),
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
        .R_Data_C(R_Data_C)
    );
endmodule
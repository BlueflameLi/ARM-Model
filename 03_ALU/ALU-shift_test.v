`timescale 1ns / 1ps
module Display_Test();
    reg clk = 0;
    reg [32:1] Shift_Data; 
    reg [8:1] Shift_Num; 
    reg [3:1] SHIFT_OP;
    
    reg [4:1] ALU_OP;
    reg CF,VF;
    wire [32:1] Shift_Out;
    reg [32:1] A;
    wire Shift_Carry_Out=0;
    wire enable;
    wire [32:1] F;
    wire [4:1] NZCV;
    always #0.01 clk = ~clk; // 0.01ns == 10ps
    initial begin
        SHIFT_OP=3'b001; Shift_Num=8'd3;
        Shift_Data = 32'h3ac50001;
        ALU_OP=4'b0101; 
        A = 32'h9a4d882b;
        CF=1'b1; VF=1'b0;
        #100;
        
        SHIFT_OP=3'b000; Shift_Num=8'd35;
        Shift_Data = 32'h2342689a;
        ALU_OP=4'b1100;
        A = 32'hee34fa12;
        CF=1'b0; VF=1'b1;
        #100;
        
        SHIFT_OP=3'b010; Shift_Num=8'd0;
        Shift_Data = 32'hf0000000;
        ALU_OP=4'b0001;
        A = 32'h8b49da1f;
        CF=1'b0; VF=1'b0;
        #100;
        
        SHIFT_OP=3'b010; Shift_Num=8'd12;
        Shift_Data = 32'h5f5555f5;
        ALU_OP=4'b0111;
        A = 32'h98463f4f;
        CF=1'b0; VF=1'b0;
        #100;
        
        SHIFT_OP=3'b100; Shift_Num=8'd6;
        Shift_Data = 32'h8a9d029d;
        ALU_OP=4'b1010;
        A = 32'h4b5c6d7e;
        CF=1'b1; VF=1'b1;
        #100;

        SHIFT_OP=3'b101; Shift_Num=8'd40;
        Shift_Data = 32'h8a9d029d;
        ALU_OP=4'b1101;
        A = 32'hbcdef123;
        CF=1'b1; VF=1'b1;
        #100;

        SHIFT_OP=3'b111; Shift_Num=8'd0;
        Shift_Data = 32'h888ee888;
        ALU_OP=4'b1111;
        A = 32'h3343dacd;
        CF=1'b0; VF=1'b1;
        #100;

        SHIFT_OP=3'b110; Shift_Num=8'd1;
        Shift_Data = 32'h3f3f3f3f;
        ALU_OP=4'b0011;
        A = 32'h87654321;
        CF=1'b1; VF=1'b0;
        #100;

        SHIFT_OP=3'b000; Shift_Num=8'd0;
        Shift_Data = 32'h2d7d9d00;
        ALU_OP=4'b1100;
        A = 32'h7331b232;
        CF=1'b1; VF=1'b1;
        //#100;        
        
    end  
    
    Shift Shift_Instance(.clk(clk),.SHIFT_OP(SHIFT_OP),.Shift_Data(Shift_Data),.Shift_Num(Shift_Num),.Carry_flag(CF),.Shift_Out(Shift_Out),.Shift_Carry_Out(Shift_Carry_Out));
    ALU ALU_Instance(ALU_OP,A,Shift_Out,Shift_Carry_Out,CF,VF,NZCV,F);
endmodule
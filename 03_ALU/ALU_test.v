`timescale 1ns / 1ps
module Test();
    reg [32:1] A,B,C,D;
    reg [4:1] OP;
    reg CF,VF;
    initial
    begin
        A=32'hac963a55; B=32'h365aacf9;
        //按位与
            OP=4'b0000; CF=1'b0; VF=1'b0; #50;
        //按位异或
            OP=4'b0001; CF=1'b0; VF=1'b0;; #50;
        //A-B
            OP=4'b0010; CF=1'b0; VF=1'b0; #50;
        //B-A*/
            OP=4'b0011; CF=1'b0; VF=1'b1; #50;
        //算术加运算
            OP=4'b0100; CF=1'b0; VF=1'b0; #50;
        //A+B+CF
            OP=4'b0101; CF=1'b1; VF=1'b0; #50;
        //A-B+CF-1
            OP=4'b0110; CF=1'b0; VF=1'b0; #50;
        //B-A+CF-1
            OP=4'b0111; CF=1'b1; VF=1'b0; #50;
        //F=A
            OP=4'b1000; CF=1'b1; VF=1'b1; #50;
        //A-B+4
            OP=4'b1010; CF=1'b0; VF=1'b0; #50;
        //A或B
            OP=4'b1100; CF=1'b0; VF=1'b0; #50;
        //F=B
            OP=4'b1101; CF=1'b0; VF=1'b1; #50;
        //A&(~B)
            OP=4'b1110; CF=1'b0; VF=1'b0; #50;
        //~B
            OP=4'b1111; CF=1'b0; VF=1'b0; #50;
    end
    wire [32:1] F;
    wire Shift_Carry_Out;
    reg [4:1] NZCF;
    ALU ALU_test(
        .ALU_OP(OP),
        .A(A),
        .B(B),
        .F(F),
        .VF(VF),
        .CF(CF),
        .Shift_Carry_Out(Shift_Carry_Out)
    );
    
endmodule


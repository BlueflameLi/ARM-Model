`timescale 1ns / 1ps
module Shift_Test();
    reg clk = 0;
    reg [32:1] Shift_Data;
    reg [8:1] Shift_Num;
    reg [3:1] SHIFT_OP;
    reg Carry_flag;
    wire enable;
    wire [32:1] Shift_Out;
    wire Shift_Carry_Out;
    always #0.01 clk = ~clk; // 0.01ns == 10ps
    initial begin
        Carry_flag = 0; SHIFT_OP = 3'b000; Shift_Num = 8'd0; 
        Shift_Data = 32'h773d8f5c;
        
        #10 Carry_flag = 0; SHIFT_OP = 3'b001; Shift_Num = 8'd3; 
        Shift_Data = 32'h3ac50001;

        #10 Carry_flag = 0; SHIFT_OP = 3'b000; Shift_Num = 8'd35; 
        Shift_Data = 32'h87654321;



        #10 Carry_flag = 0; SHIFT_OP = 3'b010; Shift_Num = 8'd0; 
        Shift_Data = 32'hf0000000;

        #10 Carry_flag = 0; SHIFT_OP = 3'b011; Shift_Num = 8'd0; 
        Shift_Data = 32'h9fdcba97;

        #10 Carry_flag = 0; SHIFT_OP = 3'b010; Shift_Num = 8'd12; 
        Shift_Data = 32'h5f5555f5;

        #10 Carry_flag = 0; SHIFT_OP = 3'b011; Shift_Num = 8'd31; 
        Shift_Data = 32'hffffffff;

        #10 Carry_flag = 0; SHIFT_OP = 3'b010; Shift_Num = 8'd32; 
        Shift_Data = 32'hffffffff;

        #10 Carry_flag = 0; SHIFT_OP = 3'b011; Shift_Num = 8'd33; 
        Shift_Data = 32'hffffffff;



        #10 Carry_flag = 0; SHIFT_OP = 3'b100; Shift_Num = 8'd0; 
        Shift_Data = 32'h7a9d029d;

        #10 Carry_flag = 0; SHIFT_OP = 3'b101; Shift_Num = 8'd0; 
        Shift_Data = 32'h8a9d029d;

        #10 Carry_flag = 0; SHIFT_OP = 3'b100; Shift_Num = 8'd6; 
        Shift_Data = 32'h8a9d029d;

        #10 Carry_flag = 1; SHIFT_OP = 3'b101; Shift_Num = 8'd40; 
        Shift_Data = 32'h8a9d029d;
        
        

        
        #10 Carry_flag = 1; SHIFT_OP = 3'b110; Shift_Num = 8'd0; 
        Shift_Data = 32'h999ff999;

        #10 Carry_flag = 1; SHIFT_OP = 3'b111; Shift_Num = 8'd0; 
        Shift_Data = 32'h12345678;

        #10 Carry_flag = 1; SHIFT_OP = 3'b110; Shift_Num = 8'd1; 
        Shift_Data = 32'h3f3f3f3f;

        #10 Carry_flag = 0; SHIFT_OP = 3'b111; Shift_Num = 8'd39; 
        Shift_Data = 32'h1f2f3f4f;
        
        
    end
    Shift u(.clk(clk), .SHIFT_OP(SHIFT_OP), .Shift_Data(Shift_Data), .Shift_Num(Shift_Num),.Carry_flag(Carry_flag), .Shift_Out(Shift_Out), .Shift_Carry_Out(Shift_Carry_Out));
endmodule

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
        Shift_Num      = 8'h04; SHIFT_OP      = 3'b000;
        Shift_Data     = 32'haaaaff00;
        #100 Shift_Num = 8'h00;
        #100 Shift_Num = 8'h01;
        #100 Shift_Num = 8'h06;
        #100 Shift_Num = 8'h40;
        #100 Shift_Num = 8'h10;
        
        #100 Shift_Num = 8'h04; SHIFT_OP = 3'b001;
        Shift_Data     = 32'haaaaff00;
        #100 Shift_Num = 8'h00;
        #100 Shift_Num = 8'h01;
        #100 Shift_Num = 8'h06;
        #100 Shift_Num = 8'h40;
        #100 Shift_Num = 8'h10;
        
        #100 Shift_Num = 8'h04; SHIFT_OP = 3'b010;
        Shift_Data     = 32'haaaaff00;
        #100 Shift_Num = 8'h00;
        #100 Shift_Num = 8'h01;
        #100 Shift_Num = 8'h06;
        #100 Shift_Num = 8'h40;
        #100 Shift_Num = 8'h10;
        
        #100 Shift_Num = 8'h04; SHIFT_OP = 3'b011;
        Shift_Data     = 32'haaaaff00;
        #100 Shift_Num = 8'h00;
        #100 Shift_Num = 8'h01;
        #100 Shift_Num = 8'h06;
        #100 Shift_Num = 8'h40;
        #100 Shift_Num = 8'h10;
        
        #100 Shift_Num = 8'h04; SHIFT_OP = 3'b100;
        Shift_Data     = 32'haaaaff00;
        #100 Shift_Num = 8'h00;
        #100 Shift_Num = 8'h01;
        #100 Shift_Num = 8'h06;
        #100 Shift_Num = 8'h40;
        #100 Shift_Num = 8'h10;
        
        #100 Shift_Num = 8'h04; SHIFT_OP = 3'b101;
        Shift_Data     = 32'haaaaff00;
        #100 Shift_Num = 8'h00;
        #100 Shift_Num = 8'h01;
        #100 Shift_Num = 8'h06;
        #100 Shift_Num = 8'h40;
        #100 Shift_Num = 8'h10;
        
        #100 Shift_Num = 8'h04; SHIFT_OP = 3'b110; Carry_flag = 0;
        Shift_Data     = 32'haaaaff00;
        #100 Shift_Num = 8'h00;
        #100 Shift_Num = 8'h01;
        #100 Shift_Num = 8'h06;
        #100 Shift_Num = 8'h40;
        #100 Shift_Num = 8'h10;
        
        #100 Shift_Num = 8'h04; SHIFT_OP = 3'b110; Carry_flag = 1;
        Shift_Data     = 32'haaaaff00;
        #100 Shift_Num = 8'h00;
        #100 Shift_Num = 8'h01;
        #100 Shift_Num = 8'h06;
        #100 Shift_Num = 8'h40;
        #100 Shift_Num = 8'h10;
        
        #100 Shift_Num = 8'h04; SHIFT_OP = 3'b111;
        Shift_Data     = 32'haaaaff00;
        #100 Shift_Num = 8'h00;
        #100 Shift_Num = 8'h01;
        #100 Shift_Num = 8'h06;
        #100 Shift_Num = 8'h40;
        #100 Shift_Num = 8'h10;
    end
    Shift u(.clk(clk), .SHIFT_OP(SHIFT_OP), .Shift_Data(Shift_Data), .Shift_Num(Shift_Num),.Carry_flag(Carry_flag), .Shift_Out(Shift_Out), .Shift_Carry_Out(Shift_Carry_Out));
endmodule

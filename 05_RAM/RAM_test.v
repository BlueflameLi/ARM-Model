`timescale 1ns / 1ps

module RAM_test();
    
    
    reg clk;
    reg [8:1] Mem_Addr;
    reg [32:1] R_data_B;
    wire [32:1] M_R_Data;
    reg Mem_Write;
    
    initial
    begin
        Mem_Write = 0;
        Mem_Addr  = 0;
        
        repeat(10) #50  Mem_Addr = Mem_Addr+3'b100;
        
    end
    
    initial
    begin
      #800
        Mem_Write = 0;
        Mem_Addr  = 0;
        repeat(10) #50  Mem_Addr = Mem_Addr+3'b100;
    end
    
    initial
    begin
        
        #500
        
        Mem_Write = 1;
        Mem_Addr  = 8'b00000100;
        R_data_B = 32'ha0a0a0a0; #50
        
        Mem_Write = 1;
        Mem_Addr  = 8'b00001100;
        R_data_B = 32'h0b0b0b0b; #50
        
        Mem_Write = 1;
        Mem_Addr  = 8'b00010100;
        R_data_B = 32'h0c0c0c0c; #50
        
        Mem_Write = 1;
        Mem_Addr  = 8'b00100000;
        R_data_B = 32'hd0d0d0d0; #50
        
        Mem_Write = 1;
        Mem_Addr  = 8'b00100100;
        R_data_B = 32'h50505050; #50
        
        Mem_Write = 1;
        Mem_Addr  = 8'b00101000;
        R_data_B = 32'h70707070; #50
        
        Mem_Write = 1;
        Mem_Addr  = 8'b00110000;
        R_data_B = 32'h65432121; 
        
    end
    
    initial
    begin
        clk             = 0;
        forever #10 clk = ~clk;
    end
    
    RAM_B Data_RAM (
    .clka(clk),
    .wea(Mem_Write),
    .addra(Mem_Addr[8:3]),
    .dina(R_data_B),
    .douta(M_R_Data)
    );
    
    
    
endmodule

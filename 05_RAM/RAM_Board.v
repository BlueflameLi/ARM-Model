`timescale 1ns / 1ps

module RAM_Board(sw,
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
    
    wire Rst,clk_m;
    reg [8:1] Mem_Addr;
    reg [32:1] R_data_B;
    
    reg [32:1] data;
    
    RAM_B Data_RAM (
    .clka(clk_m),
    .wea(Mem_Write),
    .addra(Mem_Addr[8:3]),
    .dina(R_data_B),
    .douta(M_R_Data)
    );
    
    always @(posedge swb[1]) Mem_Addr[8:3] = sw[1:5];
    always @(posedge swb[2]) R_data_B = sw;
    
    assign led[1:6] = Mem_Addr;
    
    assign Mem_Write = swb[3];
    assign clk_m     = swb[4];
    assign Rst       = swb[5];
    
    
    always@(*)
        if (Rst)
            data = R_data_B;
        else
            data = 0;
    
    Display Display_Instance(.clk(clk), .data(data),
    .which(which), .seg(seg));
    
endmodule

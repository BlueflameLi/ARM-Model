`timescale 1ns / 1ps

module Inst(clk,
            Rst,
            Write_IR,
            Write_PC,
            NZCV,
            flag,
            Inst_addr,
            condition_code,
            IR);
    
    input clk, Rst, Write_IR, Write_PC;
    input [4:1] NZCV;
    output reg flag;//条件判断输出结果
    output [6:1] Inst_addr;
    output [4:1] condition_code;//高四位条件码
    output reg [28:1] IR;
    
    reg [32:1] PC;
    wire [32:1] I;
    wire [32:1] PC_new;
    
    assign PC_new         = PC+3'b100;
    assign Inst_addr      = PC[8:3];
    assign condition_code = I[32:29];
    
    always@(negedge clk or posedge Rst)
    begin
        if (Rst)
            PC <= 0;
        else if (Write_PC)
            PC <= PC_new;
        
    end
    
    Inst_ROM Inst_ROM_Instance(.clka(clk),.addra(Inst_addr),.douta(I));
    
    always@(*)
    begin
        case(condition_code)
            4'b0000: begin flag = NZCV[3];   end
            4'b0001: begin flag = !NZCV[3];  end
            4'b0010: begin flag = NZCV[2];   end
            4'b0011: begin flag = !NZCV[2];  end
            4'b0100: begin flag = NZCV[4];   end
            4'b0101: begin flag = !NZCV[4];  end
            4'b0110: begin flag = NZCV[1];   end
            4'b0111: begin flag = !NZCV[1];  end
            4'b1000: begin flag = NZCV[2] & !NZCV[3]; end
            4'b1001: begin flag = !NZCV[2] | NZCV[3]; end
            4'b1010: begin flag = NZCV[4] ^! NZCV[1]; end
            4'b1011: begin flag = NZCV[4] ^ NZCV[1];  end
            4'b1100: begin flag = !NZCV[3] & (NZCV[4] ^! NZCV[1]);  end
            4'b1101: begin flag = NZCV[3] | (NZCV[4] ^ NZCV[1]);    end
            4'b1110: begin flag = 1; end
            4'b1111: begin flag = 0; end
        endcase
    end
    
    always@(negedge clk)
        if (flag&&Write_IR)
            IR = I[28:1];
    
    
endmodule

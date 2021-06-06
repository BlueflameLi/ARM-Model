`timescale 1ns / 1ps

module ALU(ALU_OP,
           A,
           B,
           Shift_Carry_Out,
           CF,
           VF,
           NZCV,
           F);
    input [4:1] ALU_OP;
    input [32:1] A,B;
    input Shift_Carry_Out;
    input CF,VF;
    output reg [4:1] NZCV;
    output reg [32:1] F;
    
    reg C;
    
    always@(*)
        begin
            C = 0;
            NZCV = {2'b00,Shift_Carry_Out,VF};
            case(ALU_OP)
            4'b0000: begin F = A&B;    end
            4'b0001: begin F = A^B;    end
            4'b0010: begin {C,F} = A-B;      NZCV[1] = A[32]^B[32]^F[32]^C; NZCV[2] = ~C; end
            4'b0011: begin {C,F} = B-A;      NZCV[1] = A[32]^B[32]^F[32]^C; NZCV[2] = ~C; end
            4'b0100: begin {C,F} = A+B;      NZCV[1] = A[32]^B[32]^F[32]^C; NZCV[2] =  C; end
            4'b0101: begin {C,F} = A+B+CF;   NZCV[1] = A[32]^B[32]^F[32]^C; NZCV[2] =  C; end
            4'b0110: begin {C,F} = A-B+CF-1; NZCV[1] = A[32]^B[32]^F[32]^C; NZCV[2] = ~C; end
            4'b0111: begin {C,F} = B-A+CF-1; NZCV[1] = A[32]^B[32]^F[32]^C; NZCV[2] = ~C; end
            4'b1000: begin F = A;      end
            4'b1010: begin F = A-B+4;  end
            4'b1100: begin F = A|B;    end
            4'b1101: begin F = B;      end
            4'b1110: begin F = A&(~B); end
            4'b1111: begin F = ~B;     end
            endcase
            NZCV[4] = F[32];
            NZCV[3] = ~|F;
        end
endmodule

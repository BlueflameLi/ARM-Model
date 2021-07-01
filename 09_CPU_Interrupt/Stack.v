module Stack(input clk,
             input rst,
             input SP_in,
             input SP_out,
             input [4:0] M,
             output reg [31:0] SP,
             output reg [31:0] PSP,
             output reg [31:0] MSP);
    
    reg [31:0] SP,SP_fiq,SP_irq,SP_svc,SP_mon,SP_abt,SP_hyp,SP_und;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            MSP <= 32'h0000_0020;
            PSP <= 0;
        end
        else begin
            if (SP_out && M[4]) begin
                case(M[3:0])
                    4'd0: PSP  <= SP;
                    4'd1: MSP  <= SP_fiq;
                    4'd2: MSP  <= SP_irq;
                    4'd3: MSP  <= SP_svc;
                    4'd6: MSP  <= SP_mon;
                    4'd7: MSP  <= SP_abt;
                    4'd10: MSP <= SP_hyp;
                    4'd11: MSP <= SP_und;
                    4'd15: MSP <= SP;
                    default:;
                endcase
            end
                if (SP_in && M[4]) begin
                    case(M[3:0])
                        4'd0: SP      <= PSP;
                        4'd1: SP_fiq  <= MSP;
                        4'd2: SP_irq  <= MSP;
                        4'd3: SP_svc  <= MSP;
                        4'd6: SP_mon  <= MSP;
                        4'd7: SP_abt  <= MSP;
                        4'd10: SP_hyp <= MSP;
                        4'd11: SP_und <= MSP;
                        4'd15: SP     <= MSP;
                    endcase
                end
        end
    end
endmodule

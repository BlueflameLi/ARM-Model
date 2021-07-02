module Reg_CPSR(input clk,
                input rst,
                input W_SPSR_s,
                input [2:0] W_CPSR_s,
                input Write_SPSR,
                input Write_CPSR,
                input [31:0] SPSR_New,
                input [31:0] CPSR_New,
                input [3:0] MASK,
                input [3:0] NZCV,
                input [2:0] Change_M,
                input S,
                output [31:0] SPSR_fiq,
                output [31:0] SPSR_irq,
                output [31:0] SPSR_abt,
                output [31:0] SPSR_svc,
                output [31:0] SPSR_und,
                output [31:0] SPSR_mon,
                output [31:0] SPSR_hyp,
                output [31:0] CPSR,
                output reg [31:0] Curr_SPSR
                );
    reg [31:0] CPSR_in;
    wire [31:0] new_SPSR;
    reg [6:0] clk_m;
    reg [4:0] M;
    
    assign new_SPSR      = (W_SPSR_s == 1)? CPSR : SPSR_New;
    //    assign CPSR_in = (W_CPSR_s == 1)? CPSR_New : Curr_SPSR;
    
    always@(Change_M or CPSR[4:0]) begin
        case(Change_M)
            3'd0: M <= CPSR[4:0];
            3'd1: M <= 5'b10001; //fiq
            3'd2: M <= 5'b10010; //irq
            3'd3: M <= 5'b10011; //svc
            3'd4: M <= 5'b11011; //und
        endcase
    end
    
    always@(*)begin
        case(W_CPSR_s)
            3'd0: CPSR_in <= Curr_SPSR;
            3'd1: CPSR_in <= CPSR_New;
            3'd2: CPSR_in <= {CPSR[31:8],8'h92}; //irq
            3'd3: CPSR_in <= {CPSR[31:8],8'hD1}; //fiq
            3'd4: CPSR_in <= {CPSR[31:8],8'h93}; //svc
            3'd5: CPSR_in <= {CPSR[31:8],8'h1B}; //und
        endcase
    end
    
    always@(M[4:0]) begin
        if (M[4]) begin
            case(M[3:0])
                4'b0001: begin
                    clk_m = 7'b0000001;
                    Curr_SPSR <= SPSR_fiq;
                end
                4'b0010: begin
                    clk_m = 7'b0000010;
                    Curr_SPSR <= SPSR_irq;
                end
                4'b0011: begin
                    clk_m = 7'b0000100;
                    Curr_SPSR <= SPSR_svc;
                end
                4'b0110: begin
                    clk_m = 7'b0001000;
                    Curr_SPSR <= SPSR_mon;
                end
                4'b0111: begin
                    clk_m = 7'b0010000;
                    Curr_SPSR <= SPSR_abt;
                end
                4'b1010: begin
                    clk_m = 7'b0100000;
                    Curr_SPSR <= SPSR_hyp;
                end
                4'b1011: begin
                    clk_m = 7'b1000000;
                    Curr_SPSR <= SPSR_und;
                end
            endcase
        end
    end
    
    
    //SPSR
    d_flip_flop_32 D_SPSR_fiq(
    .d(new_SPSR),
    .clk(~clk & Write_SPSR & clk_m[0]),
    .q(SPSR_fiq),
    .clr(rst)
    );
    d_flip_flop_32 D_SPSR_irq(
    .d(new_SPSR),
    .clk(~clk & Write_SPSR & clk_m[1]),
    .q(SPSR_irq),
    .clr(rst)
    );
    d_flip_flop_32 D_SPSR_svc(
    .d(new_SPSR),
    .clk(~clk & Write_SPSR & clk_m[2]),
    .q(SPSR_svc),
    .clr(rst)
    );
    d_flip_flop_32 D_SPSR_mon(
    .d(new_SPSR),
    .clk(~clk & Write_SPSR & clk_m[3]),
    .q(SPSR_mon),
    .clr(rst)
    );
    d_flip_flop_32 D_SPSR_abt(
    .d(new_SPSR),
    .clk(~clk & Write_SPSR & clk_m[4]),
    .q(SPSR_abt),
    .clr(rst)
    );
    d_flip_flop_32 D_SPSR_hyp(
    .d(new_SPSR),
    .clk(~clk & Write_SPSR & clk_m[5]),
    .q(SPSR_hyp),
    .clr(rst)
    );
    d_flip_flop_32 D_SPSR_und(
    .d(new_SPSR),
    .clk(~clk & Write_SPSR & clk_m[6]),
    .q(SPSR_und),
    .clr(rst)
    );
    
    //CPSR
    d_flip_flop_8_2 D_CPSR_7_0(
    .d(CPSR_in[7:0]),
    .clk(~clk & Write_CPSR & ~(W_CPSR_s[0] & ~MASK[0] & ~W_CPSR_s[1] & ~W_CPSR_s[2])),
    .q(CPSR[7:0]),
    .clr(rst)
    );
    d_flip_flop_8 D_CPSR_15_8(
    .d(CPSR_in[15:8]),
    .clk(~clk & Write_CPSR & ((~W_CPSR_s[0] & ~W_CPSR_s[1] & ~W_CPSR_s[2]) | (~W_CPSR_s[1] & ~W_CPSR_s[2] & MASK[1]))),
    .q(CPSR[15:8]),
    .clr(rst)
    );
    d_flip_flop_8 D_CPSR_23_16(
    .d(CPSR_in[23:16]),
    .clk(~clk & Write_CPSR & ((~W_CPSR_s[0] & ~W_CPSR_s[1] & ~W_CPSR_s[2]) | (~W_CPSR_s[1] & ~W_CPSR_s[2] & MASK[2]))),
    .q(CPSR[23:16]),
    .clr(rst)
    );
    d_flip_flop_4 D_CPSR_27_24(
    .d(CPSR_in[27:24]),
    .clk(~clk & Write_CPSR & ((~W_CPSR_s[0] & ~W_CPSR_s[1] & ~W_CPSR_s[2]) | (~W_CPSR_s[1] & ~W_CPSR_s[2] & MASK[3]))),
    .q(CPSR[27:24]),
    .clr(rst)
    );
    d_flip_flop_4 D_CPSR_31_28(
    .d((S == 0)? CPSR_in[31:28] : NZCV),
    .clk((~clk & Write_CPSR & ((~W_CPSR_s[0] & ~W_CPSR_s[1] & ~W_CPSR_s[2]) | (~W_CPSR_s[1] & ~W_CPSR_s[2] & MASK[3]))) | (~clk  &  S)),
    .q(CPSR[31:28]),
    .clr(rst)
    );
endmodule
    
    module d_flip_flop_32(
        input [31:0]d,
        input clk,
        input clr,
        output reg [31:0] q
        );
        
        always@ (posedge clk or posedge clr) begin
            if (clr) begin
                q <= 0;
            end
            else begin
                q <= d;
            end
        end
        
    endmodule
        
        module d_flip_flop_4(
            input [3:0]d,
            input clk,
            input clr,
            output reg [3:0] q
            );
            
            always@ (posedge clk or posedge clr) begin
                if (clr) begin
                    q <= 0;
                end
                else begin
                    q <= d;
                end
            end
            
        endmodule
            
            module d_flip_flop_8(
                input [7:0]d,
                input clk,
                input clr,
                output reg [7:0] q
                );
                
                always@ (posedge clk or posedge clr) begin
                    if (clr) begin
                        q <= 0;
                    end
                    else begin
                        q <= d;
                    end
                end
                
            endmodule
                
                module d_flip_flop_8_2(
                    input [7:0]d,
                    input clk,
                    input clr,
                    output reg [7:0] q
                    );
                    
                    always@ (posedge clk or posedge clr) begin
                        if (clr) begin
                            q <= 8'h10;
                        end
                        else begin
                            q <= d;
                        end
                    end
                    
                endmodule

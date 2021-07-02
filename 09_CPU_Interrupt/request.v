module d_flip_flop(input d,
                   input clk,
                   input clr,
                   output reg q);
    
    always@ (posedge clk or posedge clr)
    begin
        if (clr)
        begin
            q <= 0;
        end
        else
        begin
            q <= d;
        end
    end
    
endmodule
    
module request(
    input CPSR_6,
    input CPSR_7,
    input INTA_irq,
    input INTA_fiq,
    input EX_irq,
    input EX_fiq,
    input Rst,
    
    output INT_irq,
    output INT_fiq);

    d_flip_flop D1(
    .d(1'b1),
    .clk(~CPSR_6),
    .clr(INTA_fiq),
    .q(Q_fiq)
    );
    
    d_flip_flop D2(
    .d(Q_fiq),
    .clk(EX_fiq),
    .clr(INTA_fiq|Rst),
    .q(INT_fiq)
    );
    
    d_flip_flop D3(
    .d(1'b1),
    .clk(~CPSR_7),
    .clr(INTA_irq),
    .q(Q_irq)
    );
    
    d_flip_flop D4(
    .d(Q_irq),
    .clk(EX_irq),
    .clr(INTA_irq|Rst),
    .q(INT_irq_tmp)
    );
    
    assign INT_irq = ~INT_fiq & INT_irq_tmp;
    
endmodule

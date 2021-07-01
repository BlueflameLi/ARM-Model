module d_flip_flop(
    input d,
    input clk,
    input clr,
    output reg q
    );
        
    always@ (posedge clk or posedge clr) begin
        if(clr) begin
            q <= 0; 
        end
        else begin
            q <= d;
        end
    end
    
endmodule

module request(
    input CPSR_7,
    input INTA_irq,
    input EX_irq,
    
    output INT_irq,
    output Q
    );
    
    //wire Q;
    
    d_flip_flop D1(
        .d(1'b1),
        .clk(~CPSR_7),
        .clr(INTA_irq),
        .q(Q)
    );
    
    d_flip_flop D2(
        .d(Q),
        .clk(EX_irq),
        .clr(INTA_irq),
        .q(INT_irq)
    );
endmodule

// module decode(
//     input clk,
//     input INT_irq,
    
//     output reg INTA_irq,
//     output reg [1:0]PC_s,
//     output reg Write_PC
//     );
//     always@(posedge clk) begin
//         if(INT_irq) begin
//             INTA_irq <= 1;
//             PC_s <= 2'b11;
//             Write_PC <= 1;
//         end
//         else begin
//             INTA_irq <= 0;
//             PC_s <= 2'b00;
//             Write_PC <= 0;
//         end
//     end
// endmodule
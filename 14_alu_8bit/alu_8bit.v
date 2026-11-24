`timescale 1ns / 1ps
// Project 14 : 8-bit ALU
// 16 operations selected by a 4-bit opcode, with Zero / Carry / Negative / Overflow flags.
module alu_8bit (
    input  wire [7:0] a,
    input  wire [7:0] b,
    input  wire [3:0] op,
    output reg  [7:0] result,
    output reg        carry,
    output reg        overflow,
    output wire       zero,
    output wire       negative
);
    localparam OP_ADD  = 4'h0,
               OP_SUB  = 4'h1,
               OP_AND  = 4'h2,
               OP_OR   = 4'h3,
               OP_XOR  = 4'h4,
               OP_NOT  = 4'h5,  // NOT a
               OP_NAND = 4'h6,
               OP_NOR  = 4'h7,
               OP_XNOR = 4'h8,
               OP_SHL  = 4'h9,  // a << 1
               OP_SHR  = 4'hA,  // a >> 1 (logical)
               OP_INC  = 4'hB,  // a + 1
               OP_DEC  = 4'hC,  // a - 1
               OP_SLT  = 4'hD,  // 1 if a < b (unsigned)
               OP_PASA = 4'hE,  // pass a
               OP_PASB = 4'hF;  // pass b

    reg [8:0] tmp;

    always @(*) begin
        tmp      = 9'd0;
        carry    = 1'b0;
        overflow = 1'b0;
        result   = 8'd0;
        case (op)
            OP_ADD: begin
                tmp      = {1'b0, a} + {1'b0, b};
                result   = tmp[7:0];
                carry    = tmp[8];
                overflow = (a[7] == b[7]) && (result[7] != a[7]);
            end
            OP_SUB: begin
                tmp      = {1'b0, a} - {1'b0, b};
                result   = tmp[7:0];
                carry    = tmp[8];          // 1 = borrow occurred
                overflow = (a[7] != b[7]) && (result[7] != a[7]);
            end
            OP_AND:  result = a & b;
            OP_OR:   result = a | b;
            OP_XOR:  result = a ^ b;
            OP_NOT:  result = ~a;
            OP_NAND: result = ~(a & b);
            OP_NOR:  result = ~(a | b);
            OP_XNOR: result = ~(a ^ b);
            OP_SHL: begin
                result = {a[6:0], 1'b0};
                carry  = a[7];
            end
            OP_SHR: begin
                result = {1'b0, a[7:1]};
                carry  = a[0];
            end
            OP_INC: begin
                tmp    = {1'b0, a} + 9'd1;
                result = tmp[7:0];
                carry  = tmp[8];
            end
            OP_DEC: begin
                tmp    = {1'b0, a} - 9'd1;
                result = tmp[7:0];
                carry  = tmp[8];
            end
            OP_SLT:  result = (a < b) ? 8'd1 : 8'd0;
            OP_PASA: result = a;
            OP_PASB: result = b;
            default: result = 8'd0;
        endcase
    end

    assign zero     = (result == 8'd0);
    assign negative = result[7];
endmodule

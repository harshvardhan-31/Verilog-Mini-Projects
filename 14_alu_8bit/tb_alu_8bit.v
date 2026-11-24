`timescale 1ns / 1ps
module tb_alu_8bit;
    reg  [7:0] a, b;
    reg  [3:0] op;
    wire [7:0] result;
    wire carry, overflow, zero, negative;
    integer k;

    alu_8bit uut (
        .a(a), .b(b), .op(op), .result(result),
        .carry(carry), .overflow(overflow), .zero(zero), .negative(negative)
    );

    initial begin
        $display(" op |    a     b   | result   | C V Z N");
        $display("----+--------------+----------+--------");
        a = 8'h3C; b = 8'h0F;
        for (k = 0; k < 16; k = k + 1) begin
            op = k[3:0]; #10;
            $display("  %h | %h(%3d) %h | %h (%3d) | %b %b %b %b",
                     op, a, a, b, result, result, carry, overflow, zero, negative);
        end
        $display("--- edge cases ---");
        a = 8'd127; b = 8'd1;   op = 4'h0; #10;
        $display(" 127 + 1   -> %3d  C=%b V=%b N=%b", result, carry, overflow, negative);
        a = 8'd200; b = 8'd100; op = 4'h0; #10;
        $display(" 200 + 100 -> %3d  C=%b V=%b", result, carry, overflow);
        a = 8'd5;   b = 8'd5;   op = 4'h1; #10;
        $display("   5 - 5   -> %3d  Z=%b", result, zero);
        a = 8'd3;   b = 8'd10;  op = 4'h1; #10;
        $display("   3 - 10  -> %3d (signed %0d) C=%b N=%b", result, $signed(result), carry, negative);
        $finish;
    end
endmodule

`timescale 1ns / 1ps
module tb_logic_gates;
    reg  a, b;
    wire y_and, y_or, y_not, y_nand, y_nor, y_xor, y_xnor;
    integer i;

    logic_gates uut (
        .a(a), .b(b),
        .y_and(y_and), .y_or(y_or), .y_not(y_not),
        .y_nand(y_nand), .y_nor(y_nor), .y_xor(y_xor), .y_xnor(y_xnor)
    );

    initial begin
        $display(" a b | AND OR NOT NAND NOR XOR XNOR");
        $display("-----+------------------------------");
        for (i = 0; i < 4; i = i + 1) begin
            {a, b} = i[1:0];
            #10;
            $display(" %b %b |  %b   %b   %b    %b    %b   %b    %b",
                     a, b, y_and, y_or, y_not, y_nand, y_nor, y_xor, y_xnor);
        end
        $finish;
    end
endmodule

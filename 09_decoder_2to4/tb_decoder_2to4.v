`timescale 1ns / 1ps
module tb_decoder_2to4;
    reg  [1:0] a;
    reg        en;
    wire [3:0] y;
    integer i;

    decoder_2to4 uut (.a(a), .en(en), .y(y));

    initial begin
        $display(" en  a | y");
        $display("-------+-----");
        for (i = 0; i < 8; i = i + 1) begin
            {en, a} = i[2:0];
            #10;
            $display("  %b %b | %b", en, a, y);
        end
        $finish;
    end
endmodule

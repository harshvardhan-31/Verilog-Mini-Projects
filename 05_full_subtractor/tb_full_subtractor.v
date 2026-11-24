`timescale 1ns / 1ps
module tb_full_subtractor;
    reg  a, b, bin;
    wire diff, bout;
    integer i;

    full_subtractor uut (.a(a), .b(b), .bin(bin), .diff(diff), .bout(bout));

    initial begin
        $display(" a b bin | bout diff");
        $display("---------+----------");
        for (i = 0; i < 8; i = i + 1) begin
            {a, b, bin} = i[2:0];
            #10;
            $display(" %b %b  %b  |   %b    %b", a, b, bin, bout, diff);
        end
        $finish;
    end
endmodule

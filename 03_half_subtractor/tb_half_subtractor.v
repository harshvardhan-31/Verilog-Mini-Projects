`timescale 1ns / 1ps
module tb_half_subtractor;
    reg  a, b;
    wire diff, borrow;
    integer i;

    half_subtractor uut (.a(a), .b(b), .diff(diff), .borrow(borrow));

    initial begin
        $display(" a b | borrow diff");
        $display("-----+------------");
        for (i = 0; i < 4; i = i + 1) begin
            {a, b} = i[1:0];
            #10;
            $display(" %b %b |    %b     %b", a, b, borrow, diff);
        end
        $finish;
    end
endmodule

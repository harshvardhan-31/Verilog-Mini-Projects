`timescale 1ns / 1ps
module tb_comparator_4bit;
    reg  [3:0] a, b;
    wire gt, eq, lt;

    comparator_4bit uut (.a(a), .b(b), .gt(gt), .eq(eq), .lt(lt));

    task check(input [3:0] x, input [3:0] y);
        begin
            a = x; b = y; #10;
            $display(" %2d  %2d | %b  %b  %b", a, b, gt, eq, lt);
        end
    endtask

    initial begin
        $display("  a   b | gt eq lt");
        $display("--------+---------");
        check(4'd5,  4'd3);
        check(4'd7,  4'd7);
        check(4'd2,  4'd9);
        check(4'd15, 4'd0);
        check(4'd0,  4'd0);
        check(4'd8,  4'd12);
        $finish;
    end
endmodule

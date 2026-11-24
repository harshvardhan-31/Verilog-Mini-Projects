`timescale 1ns / 1ps
module tb_adder_subtractor_4bit;
    reg  [3:0] a, b;
    reg        mode;
    wire [3:0] result;
    wire       cout, overflow;

    adder_subtractor_4bit uut (
        .a(a), .b(b), .mode(mode),
        .result(result), .cout(cout), .overflow(overflow)
    );

    task run(input [3:0] x, input [3:0] y, input m);
        begin
            a = x; b = y; mode = m; #10;
            $display(" %2d %s %2d = %2d (signed %3d) | cout=%b ovf=%b",
                     a, m ? "-" : "+", b, result, $signed(result), cout, overflow);
        end
    endtask

    initial begin
        run(4'd5, 4'd2, 1'b0);
        run(4'd9, 4'd6, 1'b0);
        run(4'd7, 4'd1, 1'b0);   // 7 + 1 overflows signed 4-bit
        run(4'd7, 4'd3, 1'b1);
        run(4'd3, 4'd7, 1'b1);   // negative result
        run(4'd0, 4'd1, 1'b1);
        $finish;
    end
endmodule

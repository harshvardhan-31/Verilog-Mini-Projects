`timescale 1ns / 1ps
module tb_priority_encoder_4to2;
    reg  [3:0] d;
    wire [1:0] y;
    wire       valid;
    integer i;

    priority_encoder_4to2 uut (.d(d), .y(y), .valid(valid));

    initial begin
        $display("   d  | y  valid");
        $display("------+---------");
        for (i = 0; i < 16; i = i + 1) begin
            d = i[3:0];
            #10;
            $display(" %b | %b    %b", d, y, valid);
        end
        $finish;
    end
endmodule

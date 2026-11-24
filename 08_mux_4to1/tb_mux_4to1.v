`timescale 1ns / 1ps
module tb_mux_4to1;
    reg  [3:0] i;
    reg  [1:0] sel;
    wire       y;
    integer k;

    mux_4to1 uut (.i(i), .sel(sel), .y(y));

    initial begin
        $display("   i   sel | y");
        $display("-----------+--");
        i = 4'b1010;
        for (k = 0; k < 4; k = k + 1) begin
            sel = k[1:0]; #10;
            $display(" %b  %b  | %b", i, sel, y);
        end
        i = 4'b0110;
        for (k = 0; k < 4; k = k + 1) begin
            sel = k[1:0]; #10;
            $display(" %b  %b  | %b", i, sel, y);
        end
        $finish;
    end
endmodule

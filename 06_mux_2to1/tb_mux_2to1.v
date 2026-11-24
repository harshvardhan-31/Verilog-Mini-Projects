`timescale 1ns / 1ps
module tb_mux_2to1;
    reg  i0, i1, sel;
    wire y;
    integer i;

    mux_2to1 uut (.i0(i0), .i1(i1), .sel(sel), .y(y));

    initial begin
        $display(" sel i1 i0 | y");
        $display("-----------+--");
        for (i = 0; i < 8; i = i + 1) begin
            {sel, i1, i0} = i[2:0];
            #10;
            $display("  %b   %b  %b | %b", sel, i1, i0, y);
        end
        $finish;
    end
endmodule

`timescale 1ns / 1ps
module tb_demux_1to2;
    reg  d, sel;
    wire y0, y1;
    integer i;

    demux_1to2 uut (.d(d), .sel(sel), .y0(y0), .y1(y1));

    initial begin
        $display(" sel d | y1 y0");
        $display("-------+------");
        for (i = 0; i < 4; i = i + 1) begin
            {sel, d} = i[1:0];
            #10;
            $display("  %b  %b |  %b  %b", sel, d, y1, y0);
        end
        $finish;
    end
endmodule

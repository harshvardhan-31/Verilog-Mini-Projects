`timescale 1ns / 1ps
module tb_ripple_carry_adder_4bit;
    reg  [3:0] a, b;
    reg        cin;
    wire [3:0] sum;
    wire       cout;
    integer errors = 0;
    integer x, y, z;

    ripple_carry_adder_4bit uut (.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));

    initial begin
        $display("  a +  b + cin = cout sum");
        // Exhaustive check of all 512 combinations
        for (x = 0; x < 16; x = x + 1)
            for (y = 0; y < 16; y = y + 1)
                for (z = 0; z < 2; z = z + 1) begin
                    a = x; b = y; cin = z; #5;
                    if ({cout, sum} !== x + y + z) errors = errors + 1;
                end
        // A few sample rows for the log
        a = 4'd3;  b = 4'd4;  cin = 0; #5; $display(" %2d + %2d +  %b  =   %b  %2d", a, b, cin, cout, sum);
        a = 4'd9;  b = 4'd6;  cin = 1; #5; $display(" %2d + %2d +  %b  =   %b  %2d", a, b, cin, cout, sum);
        a = 4'd15; b = 4'd15; cin = 1; #5; $display(" %2d + %2d +  %b  =   %b  %2d", a, b, cin, cout, sum);
        if (errors == 0) $display("PASS: all 512 combinations correct");
        else             $display("FAIL: %0d errors", errors);
        $finish;
    end
endmodule

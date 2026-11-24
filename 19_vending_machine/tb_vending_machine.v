`timescale 1ns / 1ps
module tb_vending_machine;
    reg clk = 0, rst = 1;
    reg nickel = 0, dime = 0;
    wire dispense, change;

    vending_machine uut (
        .clk(clk), .rst(rst),
        .nickel(nickel), .dime(dime),
        .dispense(dispense), .change(change)
    );

    always #5 clk = ~clk;

    task insert_nickel;
        begin
            @(negedge clk) nickel = 1;
            @(negedge clk) nickel = 0;
        end
    endtask

    task insert_dime;
        begin
            @(negedge clk) dime = 1;
            @(negedge clk) dime = 0;
        end
    endtask

    always @(posedge clk)
        #1 $display("%4t | nickel=%b dime=%b | dispense=%b change=%b",
                    $time, nickel, dime, dispense, change);

    initial begin
        $display("time | coins        | outputs");
        #12 rst = 0;
        // Case 1: 5 + 10 = 15 -> dispense, no change
        insert_nickel;
        insert_dime;
        @(negedge clk);
        // Case 2: 10 + 10 = 20 -> dispense + change
        insert_dime;
        insert_dime;
        @(negedge clk);
        // Case 3: 5 + 5 + 5 = 15 -> dispense
        insert_nickel;
        insert_nickel;
        insert_nickel;
        @(negedge clk);
        $finish;
    end
endmodule

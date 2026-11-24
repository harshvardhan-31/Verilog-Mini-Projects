`timescale 1ns / 1ps
// Project 19 : Vending Machine (FSM)
// Item price is 15 cents. Accepts nickels (5) and dimes (10).
// dispense pulses high when 15 or more is inserted; change is returned
// (5 cents back when a dime follows a nickel).
module vending_machine (
    input  wire clk,
    input  wire rst,
    input  wire nickel,   // 5 cents inserted
    input  wire dime,     // 10 cents inserted
    output reg  dispense, // item released
    output reg  change    // 5 cents returned
);
    localparam S0  = 2'd0,  // 0 cents
               S5  = 2'd1,  // 5 cents
               S10 = 2'd2;  // 10 cents

    reg [1:0] state;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state    <= S0;
            dispense <= 1'b0;
            change   <= 1'b0;
        end else begin
            dispense <= 1'b0;   // outputs pulse for one cycle
            change   <= 1'b0;
            case (state)
                S0: begin
                    if (dime)       state <= S10;
                    else if (nickel) state <= S5;
                end
                S5: begin
                    if (dime) begin           // 5 + 10 = 15 -> vend
                        state    <= S0;
                        dispense <= 1'b1;
                    end else if (nickel) state <= S10;
                end
                S10: begin
                    if (nickel) begin         // 10 + 5 = 15 -> vend
                        state    <= S0;
                        dispense <= 1'b1;
                    end else if (dime) begin  // 10 + 10 = 20 -> vend + 5 change
                        state    <= S0;
                        dispense <= 1'b1;
                        change   <= 1'b1;
                    end
                end
                default: state <= S0;
            endcase
        end
    end
endmodule

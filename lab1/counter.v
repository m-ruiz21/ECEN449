`timescale 1ns / 1ps

module counter(
    input BUTTONS[1:0],
    input clk, 
    input rst,
    output reg [3:0] LEDS,
    );
    
    reg clk_out; 
    clock_divider divider(
        .clk_in(clk_in),
        .clk_out(clk_out)
    ); 

    always @(posedge clk_out) begin
        if (rst)
            LEDS <= 4`b0;
        else if (BUTTONS[0])
            LEDS <= LEDS + 4`b1;
        else if (BUTTONS[1])
            LEDS <= LEDS - 4`b1;
    end
endmodule

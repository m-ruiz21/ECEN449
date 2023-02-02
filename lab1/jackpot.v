module jackpot(
    input [3:0] SWITCHES,
    output [3:0] LEDS
    );
    
      
    reg clk_out; 
    clock_divider divider(
        .clk_in(clk_in),
        .clk_out(clk_out)
    );
    
    reg prev_switches <= SWITCHES;
    reg [26:0] counter = 27`d0; // counts clock cycles
    reg win = 1`b0;

    always @(posedge clk_out) begin 
         
    end
    
endmodule

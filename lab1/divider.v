module clk_divider(
    input clk_in,
    input hz_opt, 
    output reg clk_out
);
    // use selector bit since only 2 modules need the divider
    reg divider;
    always @* begin
        if (hz_opt)
            divider = 125000000;            // 1Hz
        else
            divider = 31250000;             // 2 Hz
    end
    
    reg [26:0] counter;                     // 27 bit counter bc the most we'll have to slow it down to is 1Hz
    always @(posedge clk_in) begin          
        counter <= counter + 1;
        if (counter == divider) begin      // cycle every 1/2 second / 2 HZ
            counter <= 0;
            clk_out <= ~clk_out;
        end 
    end
endmodule

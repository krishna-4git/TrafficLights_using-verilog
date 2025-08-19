//counter module for delay of 25 and 4 seconds

module TimingCircuits(
    input wire clk,
    input wire rst,
    input wire Start_LongTimer,         // to start counting for 25s delay (trigger)
    input wire Start_ShortTimer,        // to start counting for 4s delay  (trigger)
    output reg Timer_done
);

//setting clk frequency as parameter
//parameter clk_freq    = 32'd50_000_000;
parameter clk_freq    = 32'd10       ;  // lets use 10hz as frequancy for simulation purposes
parameter count_25sec = 25 * clk_freq;
parameter count_4sec  =  4 * clk_freq;

reg [30:0] count;
reg [30:0] target_count;
reg running;

//counter logic 
always@(posedge clk or posedge rst) begin 
    if(rst) begin 
        count        <= 31'b0;
        Timer_done   <= 1'b0;
        running      <= 1'b0;
        target_count <= 31'b0;
    end else begin
        if(!running) begin 
            if(Start_LongTimer) begin 
                running      <= 1'b1;
                target_count <= count_25sec;
                count        <= 31'b0;
                Timer_done   <= 1'b0;
            end else if(Start_ShortTimer) begin 
                running      <= 1'b1;
                target_count <= count_4sec;
                count        <= 31'b0;
                Timer_done   <= 1'b0;
            end else begin 
                Timer_done   <= 1'b0; // stay idle
            end
        end else begin 
            if(count >= target_count-1) begin 
                Timer_done <= 1'b1;
                running    <= 1'b0;   // allow retrigger next time
            end else begin 
                count <= count + 1;
            end
        end
    end
end

endmodule

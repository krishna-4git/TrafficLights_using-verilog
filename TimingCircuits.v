//counter module for delay of 25 and 4 seconds

module TimingCircuits(
    input wire clk,
    input wire rst,
    input wire Start_LongTimer,         // to start counting for 25s delay (trigger)
    input wire Start_ShortTimer,        // to start counting for 4s delay  (trigger)
    output reg Timer_done
);

//setting clk frequancy as parameter
parameter clk_freq    = 32'd50000000;
parameter count_25sec = 25 * clk_freq;
parameter count_4sec  =  4 * clk_freq;

reg [30:0] count;
reg [30:0] target_count;

//to put conditions for counting 
always@(posedge clk or posedge rst) begin 
    if(rst) begin 
        count      <= 31'b0;
        Timer_done <=  1'b0;
    end else if(Start_LongTimer) begin 
        count        <= 31'b0;
        Timer_done   <=  1'b0;
        target_count <= count_25sec;       
    end else if(Start_ShortTimer) begin 
        count        <= 31'b0;
        Timer_done   <=  1'b0;
        target_count <= count_4sec;        
    end else if(!Timer_done) begin //counter start from next clk of the trigger
        if(count == target_count-2) Timer_done <= 1'b1;
        else count  <= count+1 ;
    end
end

endmodule
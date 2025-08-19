module Controller(
    input wire clk,
    input wire rst,
    input wire VehiclePresent,
    input wire TimerDone,
    output reg [1:0] StateOut
);

//state declarations using param
    parameter s0_main_g = 2'b00;
    parameter s1_main_y = 2'b01;
    parameter s2_side_g = 2'b11;
    parameter s3_side_y = 2'b10;

    reg [1:0] next_state;

    always@(posedge clk or posedge rst) begin 
        if (rst) StateOut <= s0_main_g;
        else     StateOut <= next_state;
    end

    always@(*) begin 
        case (StateOut)
            s0_main_g : next_state = (TimerDone && VehiclePresent ) ? s1_main_y : s0_main_g;
            s1_main_y : next_state = ( TimerDone                  ) ? s2_side_g : s1_main_y;
            s2_side_g : next_state = (TimerDone || !VehiclePresent) ? s3_side_y : s2_side_g;
            s3_side_y : next_state = ( TimerDone                  ) ? s0_main_g : s3_side_y;
            default   : next_state = s0_main_g ;
        endcase
    end

endmodule
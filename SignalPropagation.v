module SignalPropagation(
    input wire [1:0] StateIn,
    output reg [2:0] MainLights,
    output reg [2:0] SideLights,
    output reg Start_LongTimer,
    output reg Start_ShortTimer
);

//state declarations using param
    parameter s0_main_g = 2'b00;
    parameter s1_main_y = 2'b01;
    parameter s2_side_g = 2'b11;
    parameter s3_side_y = 2'b10;

// Light patterns for clarity {R, Y, G}
    parameter red    = 3'b100;
    parameter yellow = 3'b010;
    parameter green  = 3'b001;

    always@(*) begin 
        //default assingment and for only triggering.
        Start_ShortTimer = 1'b0;
        Start_LongTimer  = 1'b0;
        MainLights = red  ;
        SideLights = red  ;


        case(StateIn) 
        s0_main_g : begin 
            MainLights = green;
            SideLights = red  ;
            Start_LongTimer = 1'b1;
        end 
        s1_main_y : begin 
            MainLights = yellow;
            SideLights = red   ;
            Start_ShortTimer = 1'b1;
        end
        s2_side_g : begin 
            MainLights = red   ;
            SideLights = green ;
            Start_LongTimer = 1'b1;
        end
        s3_side_y : begin
            MainLights = red    ;
            SideLights = yellow ;
            Start_ShortTimer  = 1'b1;
        end
        endcase
    end


endmodule
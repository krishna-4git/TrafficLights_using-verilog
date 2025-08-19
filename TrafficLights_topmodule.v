module TrafficLights_topmodule(
    input wire clk,
    input wire rst,
    input wire VehiclePresent,
    output [2:0] MainLights,
    output [2:0] SideLights
); 

wire [1:0] StateOut;
wire TimerDone;
wire Start_LongTimer;
wire Start_ShortTimer;

Controller dut1(
        .clk(clk),
        .rst(rst),
        .VehiclePresent(VehiclePresent),
        .TimerDone(TimerDone),
        .StateOut(StateOut)
    );

SignalPropagation dut2 (
        .StateIn(StateOut),
        .MainLights(MainLights),
        .SideLights(SideLights),
        .Start_LongTimer(Start_LongTimer),
        .Start_ShortTimer(Start_ShortTimer)
    );

TimingCircuits dut3 (
        .clk(clk),
        .rst(rst),
        .Start_LongTimer(Start_LongTimer),
        .Start_ShortTimer(Start_ShortTimer),
        .Timer_done(TimerDone)
    );

endmodule
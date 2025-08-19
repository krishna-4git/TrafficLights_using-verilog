`timescale 1ns / 1ps

module TrafficLight_tb;

    
    reg clk;
    reg rst;
    reg VehiclePresent;
    wire [2:0] MainLights;
    wire [2:0] SideLights;

    // Instantiate 
    TrafficLights_topmodule dut (
        .clk(clk),
        .rst(rst),
        .VehiclePresent(VehiclePresent),
        .MainLights(MainLights),
        .SideLights(SideLights)
    );

    initial begin
        clk = 0;
        forever #10 clk = ~clk; //20ns (50 MHz)
    end

   
    initial begin
        rst = 1;
        VehiclePresent = 0;
        #20; 
        rst = 0;
        $display("main road is green");
        #100;
        VehiclePresent = 1;
        $display("vehicle at side road");
        #100;
        $display("T=%0t: Simulation finished.", $time);
        
    end

    // Monitor to display changes in light signals
    initial begin
        $monitor("T=%0t: Main Lights: %b, Side Lights: %b, VehiclePresent: %b",
                 $time, MainLights, SideLights, VehiclePresent);
    end

endmodule

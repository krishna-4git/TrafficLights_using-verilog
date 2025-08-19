Verilog Traffic Light Controller

What's this all about?
Hi guys. This is a simple traffic light controller which i made it using Verilog. It's designed to manage a standard intersection with a main road and a smaller side road.

How it Works - I broke the project down into three main pieces to keep things clean:

1.Controller.v: This is basically the brain of project. It's a state machine (FSM - encoding states) that keeps track of what the lights should be doing and decides when it's time to change them.

2.SignalPropagation.v: This part takes the commands from the brain (ie, Controller) and translates them into the actual signals for traffic lights

3.TimingCircuits.v: This is the stopwatch. It handles the delays, making sure the green lights stay on for 25 seconds and the yellow lights for 4 seconds.

All these modules are made together in the TrafficLight_Top.v file, which acts as the main board for the whole system.

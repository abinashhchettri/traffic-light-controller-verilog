`timescale 1ns / 1ps

module traffic_light_tb;
    reg clk;
    reg rst;
    wire [2:0] light_NS;
    wire [2:0] light_EW;

    // Instantiate the traffic light controller
    traffic_light uut (
        .clk(clk),
        .rst(rst),
        .light_NS(light_NS),
        .light_EW(light_EW)
    );

    // Generate Clock (toggles every 5ns, creating a 10ns period)
    always #5 clk = ~clk;

    initial begin
        // Setup file dumping for GTKWave
        $dumpfile("traffic_light_simulation.vcd");
        $dumpvars(0, traffic_light_tb);

        // Initialize Inputs
        clk = 0;
        rst = 1;
        #20; // Hold reset for 20ns
        
        rst = 0; // Release reset
        #500;    // Run simulation for 500ns
        
        $finish; // End simulation
    end
endmodule
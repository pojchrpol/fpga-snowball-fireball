`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/10/2021 02:42:01 PM
// Design Name: 
// Module Name: sim_clock_divider
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module sim_clock_divider();
    reg sim_clock;
    wire sim_new_clock;
    
    clock_divider test_div (.basys_clock(sim_clock), .value_m(16), .new_clock(sim_new_clock));
    
    initial begin
        sim_clock = 0;
    end
    always begin
        #5; sim_clock = ~sim_clock;
    end
endmodule

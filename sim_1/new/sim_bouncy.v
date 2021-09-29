`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2021 06:28:12 PM
// Design Name: 
// Module Name: sim_bouncy
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


module sim_bouncy();
    reg sim_clk;
    wire [6:0] sim_x;
    wire [5:0] sim_y;
    
    bouncy sim_bc (.clk(sim_clk), .bouncy_x(sim_x), .bouncy_y(sim_y));
    
    initial begin
        sim_clk = 0;
    end
    
    always begin
        #5; sim_clk = ~sim_clk;
    end
endmodule

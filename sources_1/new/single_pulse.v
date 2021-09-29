`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2021 02:07:00 AM
// Design Name: 
// Module Name: single_pulse
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


module single_pulse(input clk, pb, output signal);
    wire q1, q2;
    assign signal = q1 & ~q2;
    dff first_dff (.clk(clk), .d(pb), .q(q1));
    dff sec_dff (.clk(clk), .d(q1), .q(q2));
endmodule

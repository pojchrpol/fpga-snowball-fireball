`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/02/2021 06:13:21 PM
// Design Name: 
// Module Name: evolve_counter
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


module evolve_counter(input clk, clr, output reg done = 0);
    reg [3:0] count = 0;
    always @ (posedge clk) begin
        count <= (clr) ? 0 : count + 1;
        done <= (done) ? 0 : (count == 4'b1111);
    end
endmodule

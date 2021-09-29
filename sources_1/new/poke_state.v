`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/02/2021 05:54:14 PM
// Design Name: 
// Module Name: poke_state
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


module poke_state(input clk, clr, [3:0] vol, output reg [1:0] state = 0);
    wire done;
    evolve_counter counter (.clk(clk), .clr(clr), .done(done));
    always @ (posedge clk) begin
        if(clr) state = 2'b00;
        else begin case(state)
            2'b00: if (vol > 10) state = 2'b01;
            2'b01: if (done) state = 2'b10;
        endcase end
    end
endmodule

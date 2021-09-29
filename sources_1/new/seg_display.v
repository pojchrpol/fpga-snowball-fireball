`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2021 08:41:21 PM
// Design Name: 
// Module Name: seg_display
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


module seg_display(
	input clk,
	input sw,
	input [3:0] truncated_signal,
	output reg [3:0] an, 
	output reg [6:0] seg
    );
   	
   	reg [1:0] ctr = 0;
   	
   	always @(posedge clk) begin
//   		an <= 4'b0011;
//   		seg <= 7'b0000001;
   		if (sw) begin
   			an <= 4'b0000;
   			if (truncated_signal < 4'd5) begin
   				seg <= 7'b1110001; //L
   			end
			else if (truncated_signal < 4'd10) begin
				seg <= 7'b0101011;
			end
			else begin
    			seg <= 7'b1001000;
			end
   		end	
   		else begin
   			ctr <= ctr + 1;
			case (ctr)
			0:
			begin
				an <= 4'b1101;
				case(truncated_signal)
					15:seg <= 7'b1001111;
					14:seg <= 7'b1001111;
					13:seg <= 7'b1001111;
					12:seg <= 7'b1001111;
					11:seg <= 7'b1001111;
					10:seg <= 7'b1001111;
					9:seg <= 7'b1111111;
					8:seg <= 7'b1111111;
					7:seg <= 7'b1111111; 
					6:seg <= 7'b1111111;
					5:seg <= 7'b1111111;
					4:seg <= 7'b1111111;
					3:seg <= 7'b1111111;
					2:seg <= 7'b1111111;
					1:seg <= 7'b1111111;
					0:seg <= 7'b1111111;
				endcase
			end
			1:
			begin
			an <= 4'b1110;
			case(truncated_signal)
					15:seg <= 7'b0100100;
					14:seg <= 7'b1001100;
					13:seg <= 7'b0000110;
					12:seg <= 7'b0010010;
					11:seg <= 7'b1001111;
					10:seg <= 7'b0010010;
					9:seg <= 7'b0000100;
					8:seg <= 7'b0000000;
					7:seg <= 7'b0001111; 
					6:seg <= 7'b0100000;
					5:seg <= 7'b0100100;
					4:seg <= 7'b1001100;
					3:seg <= 7'b0000110;
					2:seg <= 7'b0010010;
					1:seg <= 7'b1001111;
					0:seg <= 7'b0000001;
				endcase
			end
			2:
			an <= 4'b1111;
			3:
			an <= 4'b1111;
			endcase
   		end
   	end
   	
endmodule
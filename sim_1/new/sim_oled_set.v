`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2021 12:44:03 PM
// Design Name: 
// Module Name: sim_oled_set
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


module sim_oled_set();
    reg sim_clk;
    reg [11:0] sim_mic_in;
    wire [7:0] JX;
    reg [15:0] oled_data;
    
    wire reset;
       
    wire fb, sendp, samp;
    wire [12:0] pi;
    wire [4:0] ts;
    Oled_Display sim (.clk(sim_clk), .reset(reset), .frame_begin(fb), .sending_pixels(sendp),
      .sample_pixel(samp), .pixel_index(pi), .pixel_data(oled_data), .cs(JX[0]), .sdin(JX[1]), .sclk(JX[3]), 
      .d_cn(JX[4]), .resn(JX[5]), .vccen(JX[6]), .pmoden(JX[7]), .teststate(ts));
      
    always @(posedge sim_clk) begin
        oled_data <= {sim_mic_in[11:7], 6'd0, 5'd0};
    end
    
    initial begin
        sim_clk = 0;
        sim_mic_in = 12'd0; #20; sim_mic_in = 12'b111111111111;
    end
    always begin
        #5; sim_clk = ~sim_clk;
    end
endmodule

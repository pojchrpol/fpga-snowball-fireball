`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
//
//  FILL IN THE FOLLOWING INFORMATION:
//
//  LAB SESSION DAY (Delete where applicable): WEDNESDAY P.M
//
//  STUDENT A NAME: Tie Zhou Peng
//  STUDENT A MATRICULATION NUMBER: A0219606A
//
//  STUDENT B NAME: Pojcharapol Leenukiat
//  STUDENT B MATRICULATION NUMBER: A0219984L
//
//////////////////////////////////////////////////////////////////////////////////


module Top_Student (
    input  J_MIC3_Pin3,   // Connect from this signal to Audio_Capture.v
    output J_MIC3_Pin1,   // Connect to this signal from Audio_Capture.v
    output J_MIC3_Pin4,    // Connect to this signal from Audio_Capture.v
    input CLK100MHZ,
    input [15:0] sw,
    output [15:0] led,
    output [3:0] an,
    output [6:0] seg,
    input btnC, btnL, btnR, btnU, btnD,
    output pmodoledrgb_cs,
    output pmodoledrgb_sdin,
    output pmodoledrgb_sclk,
    output pmodoledrgb_d_cn,
    output pmodoledrgb_resn,
    output pmodoledrgb_vccen,
    output pmodoledrgb_pmoden
    );

    //clock dividers
    wire clk12p5m;
    clock_divider clk_12p5m (.basys_clock(CLK100MHZ), .value_m(4), .new_clock(clk12p5m));
    wire clk6p25m;
    clock_divider clk_6p25m (.basys_clock(CLK100MHZ), .value_m(8), .new_clock(clk6p25m));
    wire clk_3hz;
    clock_divider clk3hz (.basys_clock(CLK100MHZ), .value_m({24{1'b1}}), .new_clock(clk_3hz));
    wire clk_6hz;
    clock_divider clk6hz (.basys_clock(CLK100MHZ), .value_m({23{1'b1}}), .new_clock(clk_6hz));
    wire clk_12hz;
    clock_divider clk12hz (.basys_clock(CLK100MHZ), .value_m({22{1'b1}}), .new_clock(clk_12hz));
    wire clk_20khz;
    clock_divider clk20khz (.basys_clock(CLK100MHZ), .value_m(2500), .new_clock(clk_20khz));
    wire clk_5hz;
    clock_divider clk5hz (.basys_clock(CLK100MHZ), .value_m(20000000), .new_clock(clk_5hz));
    
    //single pulse
    wire reset;
    single_pulse res (.clk(clk6p25m), .pb(btnC), .signal(reset));

    wire pulse_left, pulse_up, pulse_right, pulse_down; 
    single_pulse pull (.clk(clk6p25m), .pb(btnL), .signal(pulse_left));
    single_pulse pulu (.clk(clk6p25m), .pb(btnU), .signal(pulse_up));
    single_pulse pulr (.clk(clk6p25m), .pb(btnR), .signal(pulse_right));
    single_pulse puld (.clk(clk6p25m), .pb(btnD), .signal(pulse_down));
    
    wire pulse_up_12;
    single_pulse pulu12 (.clk(clk_12hz), .pb(btnU), .signal(pulse_up_12));
    wire pulse_sw_15, pulse_sw_14, pulse_sw_13;
    single_pulse sw15 (.clk(clk_6hz), .pb(sw[15]), .signal(pulse_sw_15));
    single_pulse sw14 (.clk(clk_6hz), .pb(sw[14]), .signal(pulse_sw_14));
    single_pulse sw13 (.clk(clk_6hz), .pb(sw[13]), .signal(pulse_sw_13));
    
    //microphone
    wire [11:0] mic_in;    
    wire [3:0] truncated_signal;
    
    wire [15:0] default_led;
    reg [15:0] peak_intensity = 16'b1111111111111111;
    assign led = sw[1] ? peak_intensity : default_led;
       
    signal_truncation sig_trunc(clk_20khz, clk_5hz, mic_in, truncated_signal);
    
    led_array led_signal(clk_20khz, truncated_signal, default_led);
    
    seg_display seg1_display(clk_20khz, sw[2], truncated_signal, an, seg);
    
    Audio_Capture sound (
    .CLK        (CLK100MHZ),                  // 100MHz clock
    .cs            (clk_20khz),               // sampling clock, 20kHz
    .MISO        (J_MIC3_Pin3),               // J_MIC3_Pin3, serial mic input
    .clk_samp    (J_MIC3_Pin1),               // J_MIC3_Pin1
    .sclk        (J_MIC3_Pin4),               // J_MIC3_Pin4, MIC3 serial clock
    .sample     (mic_in)                      // 12-bit audio sample data
        );
    
    
    
    //setting up OLED
    wire fb, sendp, samp;
    wire [12:0] pixel_index;
    wire [4:0] ts;
    wire [15:0] pixel_data;
    Oled_Display display (.clk(clk6p25m), .reset(reset), .frame_begin(fb), .sending_pixels(sendp),
      .sample_pixel(samp), .pixel_index(pixel_index), .pixel_data(pixel_data), .cs(pmodoledrgb_cs), 
      .sdin(pmodoledrgb_sdin), .sclk(pmodoledrgb_sclk), .d_cn(pmodoledrgb_d_cn), .resn(pmodoledrgb_resn), 
      .vccen(pmodoledrgb_vccen), .pmoden(pmodoledrgb_pmoden), .teststate(ts));
    
    wire [6:0] pixel_x; wire [5:0] pixel_y;
    pixel_x_y pixel_convert (.pixel_index(pixel_index), .pixel_x(pixel_x), .pixel_y(pixel_y));
    //main menu          
    //volume bar
    wire [6:0] bar_pos; wire [1:0] border, bar; wire [15:0] pixel_bar;
    bar_position barpos (.clk(clk_6hz), .clr(pulse_sw_15), .bL(btnL), .bR(btnR), .bar_pos(bar_pos));
    bar_control barcon (.clk(clk6p25m), .sw_on(sw[15]), .bU(pulse_up), .bD(pulse_down), .border(border), .bar(bar));
    volume_bar disp0 (.clk(clk6p25m), .bar_pos(bar_pos), .border(border), .bar(bar), .vol(truncated_signal),
        .pixel_x(pixel_x), .pixel_y(pixel_y), .pixel_data(pixel_bar));
        
    //game
    wire [15:0] pixel_game; wire win; wire [1:0] life; wire [2:0] cd_cnt;
    wire [6:0] char_x, fire1_x, fire2_x, fire3_x, fire4_x; 
    wire [5:0] char_y, fire1_y, fire2_y, fire3_y, fire4_y;
    wire clr_game = (life == 0) | win | pulse_sw_14;
    wire clr_char = (life == 0) | pulse_sw_14;
    char_walk charcater (.clk(clk_12hz), .clr(clr_char), .cd_cnt(cd_cnt), .win(win), .btnD(btnD), .btnR(btnR), .x(char_x), .y(char_y));
    bouncy fireball1 (.clk(clk_12hz), .clr(clr_game), .start_x(20), .start_y(50), .start_dir(2'b10), .bouncy_x(fire1_x), .bouncy_y(fire1_y));
    bouncy fireball2 (.clk(clk_12hz), .clr(clr_game), .start_x(30), .start_y(40), .start_dir(2'b01), .bouncy_x(fire2_x), .bouncy_y(fire2_y));
    bouncy fireball3 (.clk(clk_12hz), .clr(clr_game), .start_x(70), .start_y(20), .start_dir(2'b11), .bouncy_x(fire3_x), .bouncy_y(fire3_y));
    bouncy fireball4 (.clk(clk_12hz), .clr(clr_game), .start_x(80), .start_y(30), .start_dir(2'b00), .bouncy_x(fire4_x), .bouncy_y(fire4_y));
    life_count lifecount (.clk(clk_12hz), .clr(pulse_sw_14), .char_x(char_x), .char_y(char_y),
                    .fire1_x(fire1_x), .fire2_x(fire2_x), .fire3_x(fire3_x), .fire4_x(fire4_x), 
                    .fire1_y(fire1_y), .fire2_y(fire2_y), .fire3_y(fire3_y), .fire4_y(fire4_y), 
                    .life(life), .cd_cnt(cd_cnt));
    game disp1 (.clk(clk6p25m), .win(win), .life(life), .cd_cnt(cd_cnt), .char_x(char_x), .char_y(char_y), 
                .fire1_x(fire1_x), .fire2_x(fire2_x), .fire3_x(fire3_x), .fire4_x(fire4_x), 
                .fire1_y(fire1_y), .fire2_y(fire2_y), .fire3_y(fire3_y), .fire4_y(fire4_y), 
                .x(pixel_x), .y(pixel_y), .pixel_data(pixel_game));
    
    //pokemon display
    wire [15:0] ele_pixel, vt_pixel, pixel_poke; wire [1:0] state;
    voltorb_disp v_disp (.clk(clk6p25m), .x(pixel_x), .y(pixel_y), .pixel_data(vt_pixel));
    electrode_disp ele_disp (.clk(clk6p25m), .blink_clk(clk_3hz), .state(state), .x(pixel_x), .y(pixel_y), .pixel_data(ele_pixel));    
    poke_state pokestate (.clk(clk_6hz), .clr(pulse_sw_13), .vol(truncated_signal), .state(state));
    poke_disp disp2 (.vt_pixel(vt_pixel), .ele_pixel(ele_pixel), .state(state), .pixel_data(pixel_poke));
    
    assign pixel_data = (sw[15]) ? pixel_bar : (sw[14]) ? pixel_game : (sw[13]) ? pixel_poke : 16'h0000;
endmodule
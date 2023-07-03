// ZXUNO port by DistWave (2016)
// fpganes
// Copyright (c) 2012-2013 Ludvig Strigeus
// This program is GPL Licensed. See COPYING for the full license.
//
// ZX Spectrum Next port by Victor Trucco (2020)
//


`timescale 1ns / 1ps
`default_nettype none

module NES_ZXNEXT(
	// Clocks
      input  wire clock_50_i,

      //SRAM (AS7C34096)
      output wire [18:0] ram_addr_o,
      inout  wire [15:0] ram_data_io,
      output wire ram_oe_n_o,
      output wire ram_we_n_o,
      output wire [3:0] ram_ce_n_o,

     // PS2
      inout wire ps2_clk_io,
      inout wire ps2_data_io,
      inout wire ps2_pin6_io,
      inout wire ps2_pin2_io,
                            
      // SD Card
      output wire sd_cs0_n_o,
      output wire sd_cs1_n_o,
      output wire sd_sclk_o,
      output wire sd_mosi_o,
      input  wire sd_miso_i,

      // Flash
      output wire flash_cs_n_o,
      output wire flash_sclk_o,
      output wire flash_mosi_o,
      input  wire flash_miso_i,
      output wire flash_wp_o,
      output wire flash_hold_o,

      // Joystick
      input  wire joyp1_i,
      input  wire joyp2_i,
      input  wire joyp3_i,
      input  wire joyp4_i,
      input  wire joyp6_i,
      output wire joyp7_o,
      input  wire joyp9_i,
      output wire joysel_o,

      // Audio
      output wire audioext_l_o,
      output wire audioext_r_o,
      output wire audioint_o,

      // K7
      output wire ear_port_i,
      input  wire mic_port_o,

      // Buttons
      input  wire btn_divmmc_n_i,
      input  wire btn_multiface_n_i,
      input  wire btn_reset_n_i,

      // Matrix keyboard
      output wire [7:0] keyb_row_o,
      input  wire [6:0] keyb_col_i,

      // Bus
      inout  wire bus_rst_n_io,
      output wire bus_clk35_o,
      output wire [15:0] bus_addr_o,
      inout  wire [7:0] bus_data_io,
      inout  wire bus_int_n_io,
      input  wire bus_nmi_n_i,
      input  wire bus_ramcs_i,
      input  wire bus_romcs_i,
      input  wire bus_wait_n_i,
      output wire bus_halt_n_o,
      output wire bus_iorq_n_o,
      output wire bus_m1_n_o,
      output wire bus_mreq_n_o,
      output wire bus_rd_n_o,
      output wire bus_wr_n_o,
      output wire bus_rfsh_n_o,
      input  wire bus_busreq_n_i,
      output wire bus_busack_n_o,
      input  wire bus_iorqula_n_i,

      // VGA
      output wire [2:0] rgb_r_o,
      output wire [2:0] rgb_g_o,
      output wire [2:0] rgb_b_o,
      output wire hsync_o,
      output wire vsync_o,
      output wire csync_o,

      // HDMI
      output wire [3:0] hdmi_p_o,
      output wire [3:0] hdmi_n_o,

      // I2C (RTC and HDMI)
      inout  wire i2c_scl_io,
      inout  wire i2c_sda_io,

      // ESP
      inout  wire esp_gpio0_io,
      inout  wire esp_gpio2_io,
      input  wire esp_rx_i,
      output wire esp_tx_o,

      // PI GPIO
      inout  wire [27:0] accel_io,

      // Vacant pins
      inout  wire extras_io
  );

  wire osd_window;
  wire osd_pixel;
  wire [15:0] dipswitches;
  wire scanlines;
  wire hq_enable;
  wire border;
  
  wire joy3bt_enable;
  
  assign scanlines = dipswitches[0];
  assign hq_enable = dipswitches[1];
  
  assign joy3bt_enable = dipswitches[2];
  
  wire host_reset_n;
  wire host_reset_loader;
  wire host_divert_sdcard;
  wire host_divert_keyboard;
  wire host_select;
  wire host_start;
  
  wire master_reset;
  
  reg boot_state = 1'b0;
 
  wire [31:0] bootdata;
  wire bootdata_req;
  reg bootdata_ack = 1'b0;
  
  wire AUD_MCLK;
  wire AUD_LRCK;
  wire AUD_SCK;
  wire AUD_SDIN;
  
  wire [3:0] vga_blue;
  wire [3:0] vga_green;
  wire [3:0] vga_red;
  
  wire vga_hsync;
  wire vga_vsync;
  wire [7:0] vga_osd_r;
  wire [7:0] vga_osd_g;
  wire [7:0] vga_osd_b;
  assign hsync_o = vga_hsync;
  assign vsync_o = vga_vsync;
  assign rgb_r_o = vga_osd_r[7:5];
  assign rgb_g_o = vga_osd_g[7:5];
  assign rgb_b_o = vga_osd_b[7:5];

//  assign led = loader_fail;
  
  wire clock_locked;
  wire clk;
  reg clk_loader;
  wire clk_gameloader;
  wire clk_fifo;

  wire clk_ctrl;
  reg[15:0] data;
  reg [7:0] loader_input;
    
  wire joypad_data;
  
  nes_clk clock_21mhz(
    .CLK_IN1(clock_50_i), 
	 .CLK_OUT1(clk), 
	 .CLK_OUT2(clk_ctrl), 
	 /*.CLK_OUT3(clk4),*/ 
	 .LOCKED(clock_locked)
	);

  // NES Palette -> RGB332 conversion
  reg [14:0] pallut[0:63];
  initial $readmemh("nes_palette.txt", pallut);

  wire [8:0] cycle;
  wire [8:0] scanline;
  wire [15:0] sample;
  wire [5:0] color;
  wire joypad_strobe;
  wire [1:0] joypad_clock;
  wire [21:0] memory_addr;
  wire memory_read_cpu, memory_read_ppu;
  wire memory_write;
  wire [7:0] memory_din_cpu, memory_din_ppu;
  wire [7:0] memory_dout;
  reg [7:0] joypad_bits, joypad_bits2;
  reg [1:0] last_joypad_clock;
  wire [31:0] dbgadr;
  wire [1:0] dbgctr;

  reg [1:0] nes_ce;

  reg [13:0] debugaddr;
  wire [15:0] debugdata;
  
    wire ram_WE_n;          // Write Enable. WRITE when Low.
  wire [18:0] ram_a;
  wire [7:0] from_sram;
  wire [7:0] to_sram;
   
	assign ram_ce_n_o = 4'b1110;			//-- always active
	assign ram_oe_n_o	= 1'b0;				//-- always active
	

  wire [7:0] joystick1, joystick2;
  wire p_sel = !host_select;
  wire p_start = !host_start;
  
  // right, left, down, up, start, slect, B, A
  assign joystick1 = {zxn_joy_left[0],  zxn_joy_left[1],  zxn_joy_left[2],  zxn_joy_left[3],  ~p_start |zxn_joy_left[7],  ~p_sel | zxn_joy_left[4],  zxn_joy_left[5],  zxn_joy_left[6]};
  assign joystick2 = {zxn_joy_right[0], zxn_joy_right[1], zxn_joy_right[2], zxn_joy_right[3], ~p_start |zxn_joy_right[7], ~p_sel | zxn_joy_right[4], zxn_joy_right[5], zxn_joy_right[6]};

	wire [7:0] zxn_joy_right;
	wire [7:0] zxn_joy_left;
  
   md6_joystick_connector_x2 sega
   (
      .reset_i     ( ~host_reset_n ),
      
      .CLK_28_i    ( clk ),
      .CLK_EN_i    ( vga_hsync ), 

		.joy3bt_i 	 (joy3bt_enable),		
      
      .joy1_i      ( joyp1_i ),
      .joy2_i      ( joyp2_i ),
      .joy3_i      ( joyp3_i ),
      .joy4_i      ( joyp4_i ),
      .joy6_i      ( joyp6_i ),
      .joy9_i      ( joyp9_i ),
      
      .joy7_o      ( joyp7_o ),          //-- joystick pin out for md protocol
      .joys_o      ( joysel_o ),         //-- joystick selection mux (0 = left, 1 = right)

      .joyleft_o   ( zxn_joy_left ),     //-- active high START/MODE A/X B/Y/F2 C/Z/F1 U D L R
      .joyright_o  ( zxn_joy_right )     //-- active high START/MODE A/X B/Y/F2 C/Z/F1 U D L R
   );
  
  
  always @(posedge clk) begin
    if (joypad_strobe) begin
      joypad_bits <= joystick1;
      joypad_bits2 <= joystick2;
    end
    if (!joypad_clock[0] && last_joypad_clock[0])
      joypad_bits <= {1'b0, joypad_bits[7:1]};
    if (!joypad_clock[1] && last_joypad_clock[1])
      joypad_bits2 <= {1'b0, joypad_bits2[7:1]};
    last_joypad_clock <= joypad_clock;
  end
  
  wire [21:0] loader_addr;
  wire [7:0] loader_write_data;
  wire loader_reset = host_reset_loader;// &&  uart_loader_conf[0];
  wire loader_write;
  wire [31:0] mapper_flags;
  wire loader_done, loader_fail;
  wire empty_fifo;
  
  GameLoader loader(
    clk_gameloader, 
    loader_reset, 
	 loader_input, 
	 clk_loader,
	 loader_addr, 
	 loader_write_data, 
	 loader_write,
	 mapper_flags,
	 loader_done,
	 loader_fail
	);

  wire reset_nes = (!host_reset_n || !loader_done || !btn_reset_n_i);
  wire run_mem = (nes_ce == 0) && !reset_nes;
  wire run_nes = (nes_ce == 3) && !reset_nes;


  // NES is clocked at every 4th cycle.
  always @(posedge clk)
    nes_ce <= nes_ce + 1;
    
  NES nes(clk, reset_nes, run_nes,
          mapper_flags,
          sample, color,
          joypad_strobe, joypad_clock, {joypad_bits2[0], joypad_bits[0]},
          5'b11111,
          memory_addr,
          memory_read_cpu, memory_din_cpu,
          memory_read_ppu, memory_din_ppu,
          memory_write, memory_dout,
          cycle, scanline,
          dbgadr,
          dbgctr
   );

  // This is the memory controller to access the board's SRAM
  wire ram_busy;
  
  MemoryController memory(clk,
                          memory_read_cpu && run_mem, 
                          memory_read_ppu && run_mem,
                          memory_write && run_mem || loader_write,
                          loader_write ? loader_addr : memory_addr,
                          loader_write ? loader_write_data : memory_dout,
                          memory_din_cpu,
                          memory_din_ppu,
                          ram_busy,
								  ram_we_n_o,
                          ram_addr_o,
                          ram_data_io,
								  debugaddr,
								  debugdata);
								  
  reg ramfail;
  always @(posedge clk) begin
    if (loader_reset)
      ramfail <= 0;
    else
      ramfail <= ram_busy && loader_write || ramfail;
  end

  wire [14:0] doubler_pixel;
  wire doubler_sync;
  wire [9:0] vga_hcounter, doubler_x;
  wire [9:0] vga_vcounter;
  
  VgaDriver vga(
		clk, 
		vga_hsync, 
		vga_vsync, 
		vga_red, 
		vga_green, 
		vga_blue, 
		vga_hcounter, 
		vga_vcounter, 
		doubler_x, 
		doubler_pixel, 
		doubler_sync, 
		1'b0);
  
  wire [14:0] pixel_in = pallut[color];
  
  Hq2x hq2x(clk, pixel_in, !hq_enable, 
            scanline[8],        // reset_frame
            (cycle[8:3] == 42), // reset_line
            doubler_x,          // 0-511 for line 1, or 512-1023 for line 2.
            doubler_sync,       // new frame has just started
            doubler_pixel);     // pixel is outputted

	assign audioext_r_o = audio;
	assign audioext_l_o = audio;
   wire audio;
	
	sigma_delta_dac sigma_delta_dac (
        .DACout         (audio),
        .DACin          (sample[15:8]),
        .CLK            (clk),
        .RESET          (reset_nes)
	);

wire [31:0] rom_size;

	CtrlModule control (
			.clk(clk_ctrl), 
			.reset_n(1'b1), 
			.vga_hsync(vga_hsync), 
			.vga_vsync(vga_vsync), 
			.osd_window(osd_window), 
			.osd_pixel(osd_pixel), 
			.ps2k_clk_in(ps2_clk_io), 
			.ps2k_dat_in(ps2_data_io),
			.spi_miso( sd_miso_i ), 
			.spi_mosi( sd_mosi_o ), 
			.spi_clk( sd_sclk_o ), 
			.spi_cs( sd_cs0_n_o ),  
			.dipswitches(dipswitches), 
			.size(rom_size), 
			
			.joy_pins({1'b0, ~btn_divmmc_n_i, zxn_joy_left[3], zxn_joy_left[2], zxn_joy_left[1], zxn_joy_left[0], zxn_joy_left[6]}), 
 		
			.host_divert_sdcard(host_divert_sdcard), 
			.host_divert_keyboard(host_divert_keyboard), 
			.host_reset_n(host_reset_n), 
			.host_select(host_select), 
			.host_start(host_start),
			.host_reset_loader(host_reset_loader),
			.host_bootdata(bootdata), 
			.host_bootdata_req(bootdata_req), 
			.host_bootdata_ack(bootdata_ack),
			.host_master_reset(master_reset)
	);
	
	OSD_Overlay osd (
			.clk(clk_ctrl),
			.red_in({vga_red, 4'b0000}),
			.green_in({vga_green, 4'b0000}),
			.blue_in({vga_blue, 4'b0000}),
			.window_in(1'b1),
			.hsync_in(vga_hsync),
			.osd_window_in(osd_window),
			.osd_pixel_in(osd_pixel),
			.red_out(vga_osd_r),
			.green_out(vga_osd_g),
			.blue_out(vga_osd_b),
			.window_out(),
			.scanline_ena(scanlines)
	);
/*
  SSEG_Driver debugboard ( .clk( clk ),
						  .reset( 1'b0 ), 
						  .data( data ),
						  .sseg( sseg_a_to_dp ), 
						  .an( sseg_an ) );
*/
reg write_fifo;
reg read_fifo;
wire full_fifo;
reg skip_fifo = 1'b0;
wire [7:0] dout_fifo;
reg [31:0] bytesloaded;

reg [12:0] counter_fifo;
assign clk_fifo = counter_fifo[7]; 
assign clk_gameloader = counter_fifo[6]; 

  fifo_loader loaderbuffer (
         .wr_clk(clk_ctrl),
         .rd_clk(clk_fifo), 
			.din(bootdata), 
			.wr_en(write_fifo), 
			.rd_en(read_fifo), 
			.dout(dout_fifo),
			.full(full_fifo), 
			.empty(empty_fifo)
  );
 
always@( posedge clk_ctrl )
begin
	if (host_reset_loader == 1'b1) begin
		bootdata_ack <= 1'b0;
		boot_state <= 1'b0;
		write_fifo <= 1'b0;
		read_fifo <= 1'b0;
		skip_fifo <= 1'b0;
		bytesloaded <= 32'h00000000;
	end else begin
		if (dout_fifo == 8'h4E) skip_fifo <= 1'b1;

		case (boot_state)
			1'b0:
				if (bootdata_req == 1'b1) begin
					if (full_fifo == 1'b0) begin
						boot_state <= 1'b1;
						bootdata_ack <= 1'b1;
						write_fifo <= (bytesloaded < rom_size) ? 1'b1 : 1'b0;
					end else read_fifo <= 1'b1;
				end else begin
					bootdata_ack <= 1'b0;
					end
			1'b1: 
 				begin
					if (write_fifo == 1'b1) begin
						write_fifo <= 1'b0;
						bytesloaded <= bytesloaded + 4;
					end
					boot_state <= 1'b0;
					bootdata_ack <= 1'b0;
				end
		endcase;
	end
end

always@( posedge clk )
begin
/*
   data <= debugdata;

	if (set == 1'b0)
		if (reset == 1'b1) debugaddr <= 14'b00000000000010;
      else debugaddr <= 14'b00000000000000;
	else 

    debugaddr <= 14'b00000000000001;
*/

//  if (reset == 1'b1)
//     data <= {3'b000, empty_fifo, 3'b000, full_fifo, 3'b000, clk_loader, 3'b000, skip_fifo};
//		data <= rom_size[19:4];

	counter_fifo <= counter_fifo + 1'b1;
	clk_loader <= !clk_fifo && skip_fifo;
end

always@( posedge clk_loader)
begin
	loader_input <= dout_fifo;
//	data <= bytesloaded[19:4];
end

//-----------------Multiboot-------------
//    multiboot el_multiboot (
//        .clk_icap(clk),
//        .REBOOT(master_reset | (~P_R & ~P_L & ~P_D & ~P_U))
//    );

//--------------------------------------------------------
	//-- Unused outputs
	//--------------------------------------------------------

	// TODO: add support for HDMI output
   OBUFDS OBUFDS_c0  ( .O  ( hdmi_p_o[0]), .OB  ( hdmi_n_o[0]), .I (1'b1));
   OBUFDS OBUFDS_c1  ( .O  ( hdmi_p_o[1]), .OB  ( hdmi_n_o[1]), .I (1'b1));
   OBUFDS OBUFDS_c2  ( .O  ( hdmi_p_o[2]), .OB  ( hdmi_n_o[2]), .I (1'b1));
   OBUFDS OBUFDS_clk ( .O  ( hdmi_p_o[3]), .OB  ( hdmi_n_o[3]), .I (1'b1));
	
   // -- Interal audio (speaker, not fitted)
    assign audioint_o     = 1'b0;

    //-- Spectrum Next Bus
    assign bus_addr_o     = 16'hFFFF;
    assign bus_busack_n_o = 1'b1;
    assign bus_clk35_o    = 1'b1;
    assign bus_data_io    = 8'hFF;
    assign bus_halt_n_o   = 1'b1;
    assign bus_iorq_n_o   = 1'b1;
    assign bus_m1_n_o     = 1'b1;
    assign bus_mreq_n_o   = 1'b1;
    assign bus_rd_n_o     = 1'b1;
    assign bus_rfsh_n_o   = 1'b1;
    assign bus_rst_n_io   = 1'b1;
    assign bus_wr_n_o     = 1'b1;

    //-- ESP 8266 module
    assign esp_gpio0_io   = 1'bZ;
    assign esp_gpio2_io   = 1'bZ;
    assign esp_tx_o = 1'b1;
	 
    //-- Addtional flash pins; used at IO2 and IO3 in Quad SPI Mode
    assign flash_hold_o   = 1'b1;
    assign flash_wp_o     = 1'b1;
	 
	 assign flash_cs_n_o  = 1'b1;
    assign flash_sclk_o  = 1'b1;
    assign flash_mosi_o  = 1'b1;

    assign ear_port_i = 1'b1;
    assign keyb_row_o = 8'hFF;
		
	 assign i2c_scl_io = 1'bZ;
    assign i2c_sda_io = 1'bZ;

    //-- Keyboard row
    assign keyb_row_o = 8'hFF;

    //-- Mic Port (output, as it connects to the mic input on cassette deck)
    assign mic_port_o = 1'b0;

	 //-- CS2 is for internal SD socket
    assign sd_cs1_n_o = 1'b1;
	 
    // PI GPIO
    assign accel_io = 28'bZZZZZZZZZZZZZZZZZZZZZZZZZZZZ;

    // Vacant pins
    assign extras_io = 1'b1;
	 
	 assign csync_o = 1'b1;



endmodule

--
-- ZXUNO_A2601.vhd
--
-- Atari VCS 2600 toplevel for the ZXUNO
-- 2016 DistWave
--
-- Based on the MiST port from https://github.com/wsoltys/tca2601
-- Copyright (c) 2014 W. Soltys <wsoltys@gmail.com>
--
-- This source file is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published
-- by the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This source file is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.
--

-------------------------------------------------------------------------------
--
-- ZX Spectrum Next top by Victor Trucco - 2020
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

library UNISIM;
use UNISIM.Vcomponents.all;


-- -----------------------------------------------------------------------

entity ZX_Next_A2601 is
    port (
    -- Clocks
      clock_50_i        : in    std_logic;

      -- SRAM (AS7C34096)
      ram_addr_o        : out   std_logic_vector(18 downto 0)  := (others => '0');
      ram_data_io       : inout std_logic_vector(15 downto 0)  := (others => 'Z');
      ram_oe_n_o        : out   std_logic                      := '1';
      ram_we_n_o        : out   std_logic                      := '1';
      ram_ce_n_o        : out   std_logic_vector( 3 downto 0)  := (others => '1');

      -- PS2
      ps2_clk_io        : inout std_logic                      := 'Z';
      ps2_data_io       : inout std_logic                      := 'Z';
      ps2_pin6_io       : inout std_logic                      := 'Z';  -- Mouse clock
      ps2_pin2_io       : inout std_logic                      := 'Z';  -- Mouse data

      -- SD Card
      sd_cs0_n_o        : out   std_logic                      := '1';
      sd_cs1_n_o        : out   std_logic                      := '1';
      sd_sclk_o         : out   std_logic                      := '0';
      sd_mosi_o         : out   std_logic                      := '0';
      sd_miso_i         : in    std_logic;

      -- Flash
      flash_cs_n_o      : out   std_logic                      := '1';
      flash_sclk_o      : out   std_logic                      := '0';
      flash_mosi_o      : out   std_logic                      := '0';
      flash_miso_i      : in    std_logic;
      flash_wp_o        : out   std_logic                      := '0';
      flash_hold_o      : out   std_logic                      := '1';

      -- Joystick
      joyp1_i           : in    std_logic;
      joyp2_i           : in    std_logic;
      joyp3_i           : in    std_logic;
      joyp4_i           : in    std_logic;
      joyp6_i           : in    std_logic;
      joyp7_o           : out   std_logic                      := '1';
      joyp9_i           : in    std_logic;
      joysel_o          : out   std_logic                      := '0';

      -- Audio
      audioext_l_o      : out   std_logic                      := '0';
      audioext_r_o      : out   std_logic                      := '0';
      audioint_o        : out   std_logic                      := '0';

      -- K7
      ear_port_i        : in    std_logic;
      mic_port_o        : out   std_logic                      := '0';

      -- Buttons
      btn_divmmc_n_i    : in    std_logic;
      btn_multiface_n_i : in    std_logic;
      btn_reset_n_i     : in    std_logic;

      -- Matrix keyboard
      keyb_row_o        : out   std_logic_vector( 7 downto 0)  := (others => 'Z');
      keyb_col_i        : in    std_logic_vector( 6 downto 0);

      -- Bus
      bus_rst_n_io      : inout std_logic                      := 'Z';
      bus_clk35_o       : out   std_logic                      := 'Z';
      bus_addr_o        : out   std_logic_vector(15 downto 0)  := (others => 'Z');
      bus_data_io       : inout std_logic_vector( 7 downto 0)  := (others => 'Z');
      bus_int_n_io      : inout std_logic                      := 'Z';
      bus_nmi_n_i       : in    std_logic;
      bus_ramcs_i       : in    std_logic;
      bus_romcs_i       : in    std_logic;
      bus_wait_n_i      : in    std_logic;
      bus_halt_n_o      : out   std_logic                      := 'Z';
      bus_iorq_n_o      : out   std_logic                      := 'Z';
      bus_m1_n_o        : out   std_logic                      := 'Z';
      bus_mreq_n_o      : out   std_logic                      := 'Z';
      bus_rd_n_o        : out   std_logic                      := 'Z';
      bus_wr_n_o        : out   std_logic                      := 'Z';
      bus_rfsh_n_o      : out   std_logic                      := 'Z';
      bus_busreq_n_i    : in    std_logic;
      bus_busack_n_o    : out   std_logic                      := 'Z';
      bus_iorqula_n_i   : in    std_logic;

      -- VGA
      rgb_r_o           : out   std_logic_vector( 2 downto 0)  := (others => '0');
      rgb_g_o           : out   std_logic_vector( 2 downto 0)  := (others => '0');
      rgb_b_o           : out   std_logic_vector( 2 downto 0)  := (others => '0');
      hsync_o           : out   std_logic                      := '1';
      vsync_o           : out   std_logic                      := '1';
      csync_o           : out   std_logic                      := 'Z';

      -- HDMI
      hdmi_p_o          : out   std_logic_vector(3 downto 0);
      hdmi_n_o          : out   std_logic_vector(3 downto 0);

      -- I2C (RTC and HDMI)
      i2c_scl_io        : inout std_logic                      := 'Z';
      i2c_sda_io        : inout std_logic                      := 'Z';

      -- ESP
      esp_gpio0_io      : inout std_logic                      := 'Z';
      esp_gpio2_io      : inout std_logic                      := 'Z';
      esp_rx_i          : in    std_logic;
      esp_tx_o          : out   std_logic                      := '1';

      -- PI GPIO
      accel_io          : inout std_logic_vector(27 downto 0)  := (others => 'Z');

      -- Vacant pins
      extras_io         : inout std_logic := 'Z'
    );
end entity;

-- -----------------------------------------------------------------------

architecture rtl of ZX_Next_A2601 is

-- System clocks
  signal vid_clk: std_logic := '0';
  signal ctrl_clk: std_logic := '0';

-- A2601
  signal audio: std_logic := '0';

  signal p_b: std_logic := '0';
  signal p2_l: std_logic := '0';
  signal p2_r: std_logic := '0';
  signal p2_a: std_logic := '0';
  signal p2_b: std_logic := '0';
  signal p2_u: std_logic := '0';
  signal p2_d: std_logic := '0';
  
  signal p_color: std_logic := '1';
  signal p_pal: std_logic := '0';
  signal p_dif: std_logic_vector(1 downto 0) := (others => '0');
  signal size: std_logic_vector(15 downto 0) := (others => '0');

-- User IO
  signal switches   : std_logic_vector(1 downto 0);
  signal buttons    : std_logic_vector(1 downto 0);
--  signal joy0       : std_logic_vector(7 downto 0);
--  signal joy1       : std_logic_vector(7 downto 0);
  signal joy_a_0    : std_logic_vector(15 downto 0);
  signal joy_a_1    : std_logic_vector(15 downto 0);
--  signal status     : std_logic_vector(7 downto 0);
  signal ascii_new  : std_logic;
  signal ascii_code : STD_LOGIC_VECTOR(6 DOWNTO 0);
  signal clk12k     : std_logic;
--  signal ps2Clk     : std_logic;
--  signal ps2Data    : std_logic;
--  signal ps2_scancode : std_logic_vector(7 downto 0);
  
  signal ps2k_clk_in : std_logic;
  signal ps2k_clk_out : std_logic;
  signal ps2k_dat_in : std_logic;
  signal ps2k_dat_out : std_logic;

--CtrlModule--
-- Internal video signals:  
  signal vga_vsync_i : std_logic := '0';
  signal vga_hsync_i : std_logic := '0';
  signal vga_red_i : std_logic_vector(7 downto 0) := (others => '0');
  signal vga_green_i : std_logic_vector(7 downto 0) := (others => '0');
  signal vga_blue_i	: std_logic_vector(7 downto 0) := (others => '0');
  
  signal osd_window : std_logic;
  signal osd_pixel : std_logic;
 
  signal scanlines : std_logic;

-- Host control signals, from the Control module
  signal host_reset_n: std_logic;
  signal host_divert_sdcard : std_logic;
  signal host_divert_keyboard : std_logic;
  signal host_pal : std_logic;
  signal host_select : std_logic;
  signal host_start : std_logic;

  signal host_bootdata : std_logic_vector(31 downto 0);
  signal host_bootdata_req : std_logic;
  signal host_bootdata_ack : std_logic;
	
	-- Joystick
	signal joy1_s				: std_logic_vector( 5 downto 0);
	signal joy2_s				: std_logic_vector( 5 downto 0);
	signal joysel_s			: std_logic;

begin

	-- joystick multiplex
	process (vga_hsync_i)
	begin
		if falling_edge(vga_hsync_i) then
			joysel_s <= not joysel_s;
			
			if joysel_s = '0' then
				joy1_s <= joyp9_i & joyp6_i & joyp4_i & joyp3_i & joyp2_i & joyp1_i;
			else
			   joy2_s <= joyp9_i & joyp6_i & joyp4_i & joyp3_i & joyp2_i & joyp1_i;
			end if;
			
			
		end if;
	end process;
	
	joysel_o <= joysel_s;

ps2k_dat_in<=ps2_data_io;
ps2_data_io <= '0' when ps2k_dat_out='0' else 'Z';
ps2k_clk_in<=ps2_clk_io;
ps2_clk_io <= '0' when ps2k_clk_out='0' else 'Z';

ps2k_clk_out<='1';
ps2k_dat_out<='1';

-- Control module

MyCtrlModule : entity work.CtrlModule
	port map (
		clk => ctrl_clk,
		reset_n => '1',

		-- Video signals for OSD
		vga_hsync => vga_hsync_i,
		vga_vsync => vga_vsync_i,
		osd_window => osd_window,
		osd_pixel => osd_pixel,

		-- PS2 keyboard
		ps2k_clk_in => ps2k_clk_in,
		ps2k_dat_in => ps2k_dat_in,
		
		-- SD card signals
		spi_clk => sd_sclk_o,
		spi_mosi => sd_mosi_o,
		spi_miso => sd_miso_i,
		spi_cs => sd_cs0_n_o,
		
		-- DIP switches
		dipswitches(15 downto 5) => open,
		dipswitches(4) => p_dif(1),
		dipswitches(3) => p_dif(0),
		dipswitches(2) => scanlines,
		dipswitches(1) => p_pal,
		dipswitches(0) => p_color,
		
		--ROM size
		size => size,
		
		-- Control signals
		host_divert_keyboard => host_divert_keyboard,
		host_divert_sdcard => host_divert_sdcard,
		host_reset_n => host_reset_n,
		host_start => host_start,
      host_select => host_select,
		
		-- Boot data upload signals
		host_bootdata => host_bootdata,
		host_bootdata_req => host_bootdata_req,
		host_bootdata_ack => host_bootdata_ack
	);

overlay : entity work.OSD_Overlay
	port map
	(
		clk => ctrl_clk,
		red_in => vga_red_i,
		green_in => vga_green_i,
		blue_in => vga_blue_i,
		window_in => '1',
		osd_window_in => osd_window,
		osd_pixel_in => osd_pixel,
		hsync_in => vga_hsync_i,
		red_out(7 downto 5) => rgb_r_o,
		red_out(4 downto 0) => open,
		green_out(7 downto 5) => rgb_g_o,
		green_out(4 downto 0) => open,
		blue_out(7 downto 5) => rgb_b_o,
		blue_out(4 downto 0) => open,
		window_out => open,
		scanline_ena => scanlines
	);

  ram_we_n_o <= '1'; -- disable ram

  hsync_o <= vga_hsync_i;
  vsync_o <= vga_vsync_i;
 
--  NTSC <= '0';
--  PAL <= '0';
  
-- -----------------------------------------------------------------------
-- A2601 core
-- -----------------------------------------------------------------------
  a2601Instance : entity work.A2601NoFlash
    port map (
      vid_clk => vid_clk,
		ram_clk => ctrl_clk,
      audio => audio,
      O_VSYNC => vga_vsync_i,
      O_HSYNC => vga_hsync_i,
      O_VIDEO_R => vga_red_i(7 downto 2),
      O_VIDEO_G => vga_green_i(7 downto 2),
      O_VIDEO_B => vga_blue_i(7 downto 2),
      res => not(host_reset_n) or not btn_reset_n_i,
      p_l => joy1_s(2),
      p_r => joy1_s(3),
      p_a => joy1_s(4),
      p_b => '1',
      p_u => joy1_s(0),
      p_d => joy1_s(1),
      p2_l => joy2_s(2),
      p2_r => joy2_s(3),
      p2_a => joy2_s(4),
      p2_b => '1',
      p2_u => joy2_s(0),
      p2_d => joy2_s(1),
      paddle_0 => joy_a_0(15 downto 8),
      paddle_1 => joy_a_0(7 downto 0),
      paddle_2 => joy_a_1(15 downto 8),
      paddle_3 => joy_a_1(7 downto 0),
      paddle_ena => '0',
      p_start => not(host_start),
      p_select => not(host_select),
      p_color => p_color,
      pal => p_pal,
      p_dif => p_dif,
      bootdata => host_bootdata,
      bootdata_req => host_bootdata_req,
      bootdata_ack => host_bootdata_ack,
		size => size
    );

  audioext_l_o <= audio;
  audioext_r_o <= audio;



-- -----------------------------------------------------------------------
-- Clocks and PLL
-- -----------------------------------------------------------------------
  pllInstance : entity work.pll
    port map (
      CLK_IN1 => clock_50_i,
      CLK_OUT1 => vid_clk,
		CLK_OUT2 => ctrl_clk
    );

  -- TODO: add support for HDMI output
    OBUFDS_c0  : OBUFDS port map ( O  => hdmi_p_o(0), OB => hdmi_n_o(0), I => '1');
    OBUFDS_c1  : OBUFDS port map ( O  => hdmi_p_o(1), OB => hdmi_n_o(1), I => '1');
    OBUFDS_c2  : OBUFDS port map ( O  => hdmi_p_o(2), OB => hdmi_n_o(2), I => '1');
    OBUFDS_clk : OBUFDS port map ( O  => hdmi_p_o(3), OB => hdmi_n_o(3), I => '1');
	 
end architecture;

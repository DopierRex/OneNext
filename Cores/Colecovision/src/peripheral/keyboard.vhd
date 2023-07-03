-------------------------------------------------------------------------------
--
-- Copyright (c) 2006, Arnim Laeuger (arnim.laeuger@gmx.net)
--
-- All rights reserved
--
-- Redistribution and use in source and synthezised forms, with or without
-- modification, are permitted provided that the following conditions are met:
--
-- Redistributions of source code must retain the above copyright notice,
-- this list of conditions and the following disclaimer.
--
-- Redistributions in synthesized form must reproduce the above copyright
-- notice, this list of conditions and the following disclaimer in the
-- documentation and/or other materials provided with the distribution.
--
-- Neither the name of the author nor the names of other contributors may
-- be used to endorse or promote products derived from this software without
-- specific prior written permission.
--
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
-- AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
-- THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
-- PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE
-- LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
-- CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
-- SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
-- INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
-- CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
-- ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
-- POSSIBILITY OF SUCH DAMAGE.
--
-- Please report bugs to the author, but before you do so, please
-- make sure that this is not a derivative work and that
-- you have the latest version of this file.
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

use work.kbd_pkg.all;

entity colecoKeyboard is
	port (
		clk				: in    std_logic;
		reset				: in    std_logic;
		-- inputs from PS/2 port
		ps2_clk			: inout std_logic;
		ps2_data			: inout std_logic;
		-- user outputs
		keys_o			: out   std_logic_vector(15 downto 0);
		joy_o				: out   std_logic_vector(15 downto 0);
		core_reload_o	: out   std_logic;
		home_o			: out std_logic;
		
		--membrane keyboard
	   i_rows         : in   std_logic_vector(7 downto 0);  -- which row we are testing ('0' to test)
      i_cols         : in   std_logic_vector(4 downto 0)  -- resulting col

	);
end colecoKeyboard;

architecture SYN of colecoKeyboard is

	component ps2kbd
		port (
			clk      : in  std_logic;
			rst_n    : in  std_logic;
			tick1us  : in  std_logic;
			ps2_clk  : in  std_logic;
			ps2_data : in  std_logic;

			reset    : out std_logic;
			press    : out std_logic;
			release  : out std_logic;
			scancode : out std_logic_vector(7 downto 0)
		);
	end component;

	signal rst_n			: std_logic;

	-- 1us tick for PS/2 interface
	signal tick1us		: std_logic;

	signal ps2_reset		: std_logic;
	signal ps2_press		: std_logic;
	signal ps2_release	: std_logic;
	signal ps2_scancode	: std_logic_vector(7 downto 0);
	signal ctrl_s			: std_logic								:= '0';
	signal alt_s			: std_logic								:= '0';
	signal home_s			: std_logic								:= '0';
	
	signal keys				: std_logic_vector(15 downto 0);
	signal joy				: std_logic_vector(15 downto 0);
	signal membrane_key	: std_logic_vector(15 downto 0);
	signal membrane_joy	: std_logic_vector(15 downto 0);
	signal caps_s			: std_logic								:= '0';

begin

	rst_n <= not reset;

	-- produce a 1us tick from the 20MHz ref clock
	process (clk, reset)
		variable count : integer range 0 to 19;
	begin
		if reset = '1' then
			tick1us <= '0';
			count := 0;
		elsif rising_edge (clk) then
			if count = 19 then
				tick1us <= '1';
				count := 0;
			else
				tick1us <= '0';
				count := count + 1;
			end if;
		end if;
	end process;

	latchInputs: process (clk, rst_n)
	begin
		-- note: all inputs are active HIGH

		if rst_n = '0' then
			keys				<= (others => '0');
			joy				<= (others => '0');
			core_reload_o	<= '0';
			home_s			<= '0';
		elsif rising_edge (clk) then
			core_reload_o <= '0';

			if (ps2_press or ps2_release) = '1' then
				case ps2_scancode is
					-- this is not a valid scancode
					-- but stuff the right button in here
					when SCANCODE_X =>
						keys(0) <= ps2_press;
					when SCANCODE_8 =>
						keys(1) <= ps2_press;
					when SCANCODE_4 =>
						keys(2) <= ps2_press;
					when SCANCODE_5 =>
						keys(3) <= ps2_press;
					when SCANCODE_7 =>
						keys(5) <= ps2_press;
					when SCANCODE_Q =>						-- '#'
						keys(6) <= ps2_press;
					when SCANCODE_2 =>
						keys(7) <= ps2_press;
					when SCANCODE_W =>						-- '*'
						keys(9) <= ps2_press;
					when SCANCODE_0 =>
						keys(10) <= ps2_press;
					when SCANCODE_9 =>
						keys(11) <= ps2_press;
					when SCANCODE_3 =>
						keys(12) <= ps2_press;
					when SCANCODE_1 =>
						keys(13) <= ps2_press;
					when SCANCODE_6 =>
						keys(14) <= ps2_press;
					------------------------------------------------
					when SCANCODE_ESC =>  -- soft reset key : ESC
						keys(8) <= ps2_press;
					-------------------------------------------------
					when SCANCODE_UP =>
						joy(0) <= ps2_press;
					when SCANCODE_DOWN =>
						joy(1) <= ps2_press;
					when SCANCODE_LEFT =>
						joy(2) <= ps2_press;
					when SCANCODE_RIGHT =>
						joy(3) <= ps2_press;
					when SCANCODE_Z =>
						joy(4) <= ps2_press;
					when SCANCODE_LCTRL =>
						ctrl_s <= ps2_press;
					when SCANCODE_LALT =>
						alt_s	<= ps2_press;
					when SCANCODE_BACKSPACE =>
						if alt_s = '1' and ctrl_s = '1' then
						--	core_reload_o <= '1';
						end if;
					when SCANCODE_HOME =>
						home_s <= ps2_press;
					when others =>
						null;
				end case;
			end if; -- ps2_press or release
			
			if (ps2_reset = '1') then
				keys <= (others => '0');
				joy <= (others => '0');
			end if;
			
			
			-- membrane	
			
			if i_rows = "11111110" then -- (A8)
				if i_cols(0) = '0' then	caps_s <= '1'; else caps_s <= '0'; end if; -- CAPS Shift

				if i_cols(1) = '0' then	membrane_joy(4) <= '1'; else membrane_joy(4) <= '0'; end if; -- z
				if i_cols(2) = '0' then	membrane_key(0) <= '1'; else membrane_key(0) <= '0'; end if; -- x
				
			end if;
			
			if i_rows = "11111011" then -- (A10)
				if i_cols(0) = '0' then membrane_key(6) <= '1'; else membrane_key(6) <= '0'; end if; -- Q = #
				if i_cols(1) = '0' then membrane_key(9) <= '1'; else membrane_key(9) <= '0'; end if; -- W = *
			end if;
			
			if i_rows = "11110111" then -- (A11)
				if i_cols(0) = '0' then membrane_key(13) <= '1'; else membrane_key(13) <= '0'; end if; -- 1
				if i_cols(1) = '0' then membrane_key(7)  <= '1'; else membrane_key(7)  <= '0'; end if; -- 2
				if i_cols(2) = '0' then	membrane_key(12) <= '1'; else membrane_key(12) <= '0'; end if; -- 3
				if i_cols(3) = '0' then	membrane_key(2)  <= '1'; else membrane_key(2)  <= '0'; end if; -- 4
				
				if caps_s = '0' then
					if i_cols(4) = '0' then	membrane_key(3)  <= '1'; else membrane_key(3)  <= '0'; membrane_joy(2)  <= '0'; end if; -- 5
				else -- arrows
					if i_cols(4) = '0' then	membrane_joy(2)  <= '1'; else membrane_joy(2)  <= '0'; end if; -- left
				end if;
				
			end if;
			
			if i_rows = "11101111" then -- (A12)
			
				if caps_s = '0' then
					if i_cols(2) = '0' then	membrane_key(1)  <= '1'; else membrane_key(1)  <= '0'; membrane_joy(3) <= '0'; end if; -- 8
					if i_cols(3) = '0' then	membrane_key(5)  <= '1'; else membrane_key(5)  <= '0'; membrane_joy(0) <= '0'; end if; -- 7
					if i_cols(4) = '0' then	membrane_key(14) <= '1'; else membrane_key(14) <= '0'; membrane_joy(1) <= '0'; end if; -- 6
				else --arrow keys
					if i_cols(2) = '0' then	membrane_joy(3) <= '1'; else membrane_joy(3) <= '0'; end if; -- right
					if i_cols(3) = '0' then	membrane_joy(0) <= '1'; else membrane_joy(0) <= '0'; end if; -- up
					if i_cols(4) = '0' then	membrane_joy(1) <= '1'; else membrane_joy(1) <= '0'; end if; -- down
				end if;
				
				if i_cols(0) = '0' then membrane_key(10) <= '1'; else membrane_key(10) <= '0'; end if; -- 0
				if i_cols(1) = '0' then membrane_key(11) <= '1'; else membrane_key(11) <= '0'; end if; -- 9
				
			end if;		
				
		end if; -- rising_edge (clk)
	end process latchInputs;

	ps2kbd_inst : ps2kbd
	port map (
		clk      	=> clk,
		rst_n    	=> rst_n,
		tick1us  	=> tick1us,
		ps2_clk  	=> ps2_clk,
		ps2_data 	=> ps2_data,

		reset    	=> ps2_reset,
		press 		=> ps2_press,
		release  	=> ps2_release,
		scancode 	=> ps2_scancode
	);

	home_o <= home_s;
	
	joy_o <= joy or membrane_joy;
	keys_o <= keys or membrane_key;

end SYN;

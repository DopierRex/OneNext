
-- MegaDrive Joysticks x 2
-- Copyright 2020 Victor Trucco
--
-- This file is part of the ZX Spectrum Next Project
-- <https://gitlab.com/SpectrumNext/ZX_Spectrum_Next_FPGA/tree/master/cores>
--
-- The ZX Spectrum Next FPGA source code is free software: you can 
-- redistribute it and/or modify it under the terms of the GNU General 
-- Public License as published by the Free Software Foundation, either 
-- version 3 of the License, or (at your option) any later version.
--
-- The ZX Spectrum Next FPGA source code is distributed in the hope 
-- that it will be useful, but WITHOUT ANY WARRANTY; without even the 
-- implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR 
-- PURPOSE.  See the GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with the ZX Spectrum Next FPGA source code.  If not, see 
-- <https://www.gnu.org/licenses/>.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity md6_joystick_connector_x2 is
   port 
   (
      reset_i     : in std_logic;
      
      CLK_28_i    : in std_logic;
      CLK_EN_i    : in std_logic;      -- approximately 15kHz enable
		
		joy3bt_i		: in std_logic;
      
      joy1_i      : in std_logic;
      joy2_i      : in std_logic;
      joy3_i      : in std_logic;
      joy4_i      : in std_logic;
      joy6_i      : in std_logic;
      joy9_i      : in std_logic;
      
      joy7_o      : out std_logic;     -- joystick pin out for md protocol
      joys_o      : out std_logic;     -- joystick selection mux (0 = left, 1 = right)

      joyleft_o   : out std_logic_vector(7 downto 0);   -- active high START/MODE A/X B/Y/F2 C/Z/F1 U D L R
      joyright_o  : out std_logic_vector(7 downto 0)    -- active high START/MODE A/X B/Y/F2 C/Z/F1 U D L R
   );
end entity;

architecture rtl of md6_joystick_connector_x2 is

   signal joy_raw_n           : std_logic_vector(5 downto 0);
   signal joy_select          : std_logic;
   signal joy1_raw_n          : std_logic_vector(5 downto 0);
   signal joy2_raw_n          : std_logic_vector(5 downto 0);
   signal state_raw           : std_logic_vector(2 downto 0);
   
   signal joyp7               : std_logic;
   signal joy1_is_sixbutton   : std_logic;
   signal joy2_is_sixbutton   : std_logic;
   signal joy1_n              : std_logic_vector(7 downto 0);
   signal joy2_n              : std_logic_vector(7 downto 0);
   signal joy1_o              : std_logic_vector(7 downto 0);
   signal joy2_o              : std_logic_vector(7 downto 0);

   -- The width of state_md determines the polling period for the md joysticks.
   
   -- According to online docs this must be at least 1.8ms but this number is ill-defined
   -- as it depends on an RC constant and may be different on cheap clones.
   
   -- Victor's original module had an 8-bit width which corresponds to a joystick scan
   -- every 256 lines or every 17ms.  This is a little faster than once per frame so it
   -- is likely a latency of one frame would be seen.  Not usually a problem but effort
   -- is being expended to keep the keyboard low latency so we'll do the same here.
   
   signal state_md            : std_logic_vector(5 downto 0);   -- 64/15kHz = 4.2ms
   
begin

   -- constantly read raw joystick state
   
   joy_raw_n <= joy9_i & joy6_i & joy1_i & joy2_i & joy3_i & joy4_i;
   
   process (CLK_28_i)
   begin
      if rising_edge(CLK_28_i) then
         if reset_i = '1' then
         
            joy_select <= '1';
            joy1_raw_n <= (others => '1');
            joy2_raw_n <= (others => '1');
            state_raw  <= (others => '0');
         
         else
         
            case state_raw is
            
               when "000"  =>
                  joy2_raw_n <= joy_raw_n;
                  joy_select <= '0';
                  
               when "100"  =>
                  joy1_raw_n <= joy_raw_n;
                  joy_select <= '1';
                  
               when others =>
                  null;
                  
            end case;
         
            state_raw <= state_raw + 1;
            
         end if;
      end if;
   end process;
   
   -- six button md protocol
   
   process (CLK_EN_i)
   begin
      if rising_edge(CLK_EN_i) then
         if reset_i = '1' then
         
            joyp7 <= '1';
            
            joy1_is_sixbutton <= '0';
            joy2_is_sixbutton <= '0';
            
            joy1_n <= (others => '1');
            joy2_n <= (others => '1');
            
            joy1_o <= (others => '0');
            joy2_o <= (others => '0');
            
            state_md <= "00" & X"7";
         
         else 
         
            case state_md is
            
               when "00" & X"0" =>
                  joyp7 <= '0';
                  
               when "00" & X"1" =>
                  joyp7 <= '1';
                  
               when "00" & X"2" =>
                  joy1_n(5 downto 0) <= joy1_raw_n(4) & joy1_raw_n(5) & joy1_raw_n(3 downto 0);   --Fire2, Fire, Up, Down, Left, Right
                  joy2_n(5 downto 0) <= joy2_raw_n(4) & joy2_raw_n(5) & joy2_raw_n(3 downto 0);   --Fire2, Fire, Up, Down, Left, Right
                  
                  joyp7 <= '0';
                  
                  joy1_is_sixbutton <= '0';
                  joy2_is_sixbutton <= '0';
                  
               when "00" & X"3" =>
						if joy1_raw_n(0) = '0' and joy1_raw_n(1) = '0' and joy3bt_i = '1' then -- it's a megadrive controller
							joy1_n(7 downto 6) <= joy1_raw_n(5 downto 4);   -- Start, A
						else
							joy1_n(7 downto 4) <= '1' & joy1_raw_n(4) & joy1_raw_n(5) & '1'; -- read A/B as master System
						end if;
							
						if joy2_raw_n(0) = '0' and joy2_raw_n(1) = '0'  and joy3bt_i = '1' then -- it's a megadrive controller	
							joy2_n(7 downto 6) <= joy2_raw_n(5 downto 4);   -- Start, A
                  else
							joy2_n(7 downto 4) <= '1' & joy2_raw_n(4) & joy2_raw_n(5) & '1' ; -- read A/B as master System
						end if;
						
                  joyp7 <= '1';
         
               when "00" & X"4" =>
                  joyp7 <= '0';
                  
               when "00" & X"5" =>
                  if joy1_raw_n(3 downto 0) = "0000" and joy3bt_i = '1' then
                     joy1_is_sixbutton <= '1';
                  end if;
                  
                  if joy2_raw_n(3 downto 0) = "0000" and joy3bt_i = '1'  then
                     joy2_is_sixbutton <= '1';
                  end if;
                  
                  joyp7 <= '1';
                  
               when "00" & X"6" =>
                  if joy1_is_sixbutton = '1' then
                     joy1_n(7 downto 4) <= joy1_n(7 downto 4) and ('1' & joy1_raw_n(1) & joy1_raw_n(3) & joy1_raw_n(2)); 
                  end if;
                  
                  if joy2_is_sixbutton = '1' then
                     joy2_n(7 downto 4) <= joy2_n(7 downto 4) and ('1' & joy2_raw_n(1) & joy2_raw_n(3) & joy2_raw_n(2));
                  end if;
                  
                  joyp7 <= '0';
               
               when "00" & X"7" =>
                  joy1_o <= not joy1_n;   -- active high
                  joy2_o <= not joy2_n;   -- active high
                  
                  joyp7 <= '1';
                  
               when others =>
                  joyp7 <= '1';
                  
            end case;
         
            state_md <= state_md + 1;
            
         end if;
      end if;
   end process;
   
   -- outputs
   
   joy7_o <= joyp7;
   joys_o <= joy_select;
   
   joyleft_o <= joy1_o;
   joyright_o <= joy2_o;

end architecture;

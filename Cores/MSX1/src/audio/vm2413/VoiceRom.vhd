--
-- VoiceRom.vhd
--
-- Copyright (c) 2006 Mitsutaka Okazaki (brezza@pokipoki.org)
-- All rights reserved.
--
-- Redistribution and use of this source code or any derivative works, are
-- permitted provided that the following conditions are met:
--
-- 1. Redistributions of source code must retain the above copyright notice,
--    this list of conditions and the following disclaimer.
-- 2. Redistributions in binary form must reproduce the above copyright
--    notice, this list of conditions and the following disclaimer in the
--    documentation and/or other materials provided with the distribution.
-- 3. Redistributions may not be sold, nor may they be used in a commercial
--    product or activity without specific prior written permission.
--
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
-- "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
-- TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
-- PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
-- CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
-- EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
-- PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
-- OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
-- WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
-- OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
-- ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
--
--
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.vm2413.all;

entity VoiceRom is
	port (
		clk    : in std_logic;
		addr : in integer range 0 to 37;
		data  : out VOICE_TYPE
	);
end entity;

architecture RTL of VoiceRom is

	type VOICE_ARRAY_TYPE is array (0 to 37) of std_logic_vector(35 downto 0);
	constant voices : VOICE_ARRAY_TYPE := (
-- APEK<ML>KL< TL >W<F><AR><DR><SL><RR>
  "000000000000000000000000000000000000", -- @0(M)
  "000000000000000000000000000000000000", -- @0(C)
-- APEK<ML>KL< TL >W<F><AR><DR><SL><RR>
  "011000010001111001111111000000000000", -- @1(M)
  "011000010000000010000111111100010111", -- @1(C)
-- APEK<ML>KL< TL >W<F><AR><DR><SL><RR>
  "000100110001011111101111111100100011", -- @2(M)
  "010000010000000000001111111100010011", -- @2(C)
-- APEK<ML>KL< TL >W<F><AR><DR><SL><RR>
  "001000111001101001001010001111110000", -- @3(M)
  "000000010000000000001111010000100011", -- @3(C)
-- APEK<ML>KL< TL >W<F><AR><DR><SL><RR>
  "000100010000111001111111101001110000", -- @4(M)
  "011000010000000000000110010000010111", -- @4(C)
-- APEK<ML>KL< TL >W<F><AR><DR><SL><RR>
  "001000100001111001101111000000000000", -- @5(M)
  "001000010000000000000111011000101000", -- @5(C)
-- APEK<ML>KL< TL >W<F><AR><DR><SL><RR>
  "001000010001011001011111000000000000", -- @6(M)
  "001000100000000000000111000100011000", -- @6(C)
-- APEK<ML>KL< TL >W<F><AR><DR><SL><RR>
  "001000010001110101111000001000010000", -- @7(M)
  "011000010000000000001000000000000111", -- @7(C)
-- APEK<ML>KL< TL >W<F><AR><DR><SL><RR>
  "001000110010110101101001000000000000", -- @8(M)
  "001000010000000010001001000000000111", -- @8(C)
-- APEK<ML>KL< TL >W<F><AR><DR><SL><RR>
  "001000010001101101100110010000010000", -- @9(M)
  "001000010000000000000110010100010111", -- @9(C)
-- APEK<ML>KL< TL >W<F><AR><DR><SL><RR>
  "001000010000101110101000010101110000", -- @10(M)
  "001000010000000010001010000000000111", -- @10(C)
-- APEK<ML>KL< TL >W<F><AR><DR><SL><RR>
  "001000111000001100001111111100010000", -- @11(M)
  "000000010000000010001011000000000100", -- @11(C)
-- APEK<ML>KL< TL >W<F><AR><DR><SL><RR>
  "100101110010000001111111111100100010", -- @12(M)
  "110000010000000000001111111100010010", -- @12(C)
-- APEK<ML>KL< TL >W<F><AR><DR><SL><RR>
  "011000010000110001011101001001000000", -- @13(M)
  "000000000000000000001111011001000011", -- @13(C)
-- APEK<ML>KL< TL >W<F><AR><DR><SL><RR>
  "000000010101011000111111010000000011", -- @14(M)
  "000000010000000000001111000000000010", -- @14(C)
-- APEK<ML>KL< TL >W<F><AR><DR><SL><RR>
  "001000011000100100111111000111110000", -- @15(M)
  "010000010000000000001111010000100011", -- @15(C)
-- APEK<ML>KL< TL >W<F><AR><DR><SL><RR>
  "000001110001011000001101111111111111", -- BD(M)
  "001000010000000000001111100011111000", -- BD(C)
-- APEK<ML>KL< TL >W<F><AR><DR><SL><RR>
  "001100010000000000001111011111110111", -- HH
  "001100100000000000001111011111110111", -- SD
-- APEK<ML>KL< TL >W<F><AR><DR><SL><RR>
  "001001010000000000001111100011111000", -- TOM
  "000000010000000000001101110001010101"  -- CYM
);

begin

	process (clk)
	begin
		if rising_edge(clk) then
			data <= CONV_VOICE(voices(addr));
		end if;
	end process;

end architecture;
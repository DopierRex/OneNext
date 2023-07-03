library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

entity saa5050_rom_dual_port is
    generic (
        ADDR_WIDTH       : integer := 12;
        DATA_WIDTH       : integer := 8
    );
    port(
        clock    : in  std_logic;
        addressA : in  std_logic_vector(ADDR_WIDTH-1 downto 0);
        QA       : out std_logic_vector(DATA_WIDTH-1 downto 0);
        addressB : in  std_logic_vector(ADDR_WIDTH-1 downto 0);
        QB       : out std_logic_vector(DATA_WIDTH-1 downto 0)
  );
end saa5050_rom_dual_port;

architecture RTL of saa5050_rom_dual_port is

    constant MEM_DEPTH : integer := 2**ADDR_WIDTH;

    type mem_type is array (0 to MEM_DEPTH-1) of signed(DATA_WIDTH-1 downto 0);

    shared variable mem : mem_type := (
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"04",x"04",x"04",x"04",x"04",x"00",x"04",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"0A",x"0A",x"0A",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"06",x"09",x"08",x"1C",x"08",x"08",x"1F",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"0E",x"15",x"14",x"0E",x"05",x"15",x"0E",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"18",x"19",x"02",x"04",x"08",x"13",x"03",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"08",x"14",x"14",x"08",x"15",x"12",x"0D",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"04",x"04",x"04",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"02",x"04",x"08",x"08",x"08",x"04",x"02",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"08",x"04",x"02",x"02",x"02",x"04",x"08",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"04",x"15",x"0E",x"04",x"0E",x"15",x"04",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"04",x"04",x"1F",x"04",x"04",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"04",x"04",
	x"08",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"0E",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"04",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"01",x"02",x"04",x"08",x"10",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"04",x"0A",x"11",x"11",x"11",x"0A",x"04",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"04",x"0C",x"04",x"04",x"04",x"04",x"0E",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"0E",x"11",x"01",x"06",x"08",x"10",x"1F",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"1F",x"01",x"02",x"06",x"01",x"11",x"0E",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"02",x"06",x"0A",x"12",x"1F",x"02",x"02",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"1F",x"10",x"1E",x"01",x"01",x"11",x"0E",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"06",x"08",x"10",x"1E",x"11",x"11",x"0E",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"1F",x"01",x"02",x"04",x"08",x"08",x"08",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"0E",x"11",x"11",x"0E",x"11",x"11",x"0E",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"0E",x"11",x"11",x"0F",x"01",x"02",x"0C",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"04",x"00",x"00",x"00",x"04",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"04",x"00",x"00",x"04",x"04",
	x"08",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"02",x"04",x"08",x"10",x"08",x"04",x"02",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"1F",x"00",x"1F",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"08",x"04",x"02",x"01",x"02",x"04",x"08",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"0E",x"11",x"02",x"04",x"04",x"00",x"04",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"0E",x"11",x"17",x"15",x"17",x"10",x"0E",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"04",x"0A",x"11",x"11",x"1F",x"11",x"11",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"1E",x"11",x"11",x"1E",x"11",x"11",x"1E",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"0E",x"11",x"10",x"10",x"10",x"11",x"0E",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"1E",x"11",x"11",x"11",x"11",x"11",x"1E",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"1F",x"10",x"10",x"1E",x"10",x"10",x"1F",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"1F",x"10",x"10",x"1E",x"10",x"10",x"10",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"0E",x"11",x"10",x"10",x"13",x"11",x"0F",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"11",x"11",x"11",x"1F",x"11",x"11",x"11",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"0E",x"04",x"04",x"04",x"04",x"04",x"0E",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"01",x"01",x"01",x"01",x"01",x"11",x"0E",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"11",x"12",x"14",x"18",x"14",x"12",x"11",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"10",x"10",x"10",x"10",x"10",x"10",x"1F",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"11",x"1B",x"15",x"15",x"11",x"11",x"11",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"11",x"11",x"19",x"15",x"13",x"11",x"11",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"0E",x"11",x"11",x"11",x"11",x"11",x"0E",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"1E",x"11",x"11",x"1E",x"10",x"10",x"10",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"0E",x"11",x"11",x"11",x"15",x"12",x"0D",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"1E",x"11",x"11",x"1E",x"14",x"12",x"11",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"0E",x"11",x"10",x"0E",x"01",x"11",x"0E",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"1F",x"04",x"04",x"04",x"04",x"04",x"04",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"11",x"11",x"11",x"11",x"11",x"11",x"0E",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"11",x"11",x"11",x"0A",x"0A",x"04",x"04",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"11",x"11",x"11",x"15",x"15",x"15",x"0A",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"11",x"11",x"0A",x"04",x"0A",x"11",x"11",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"11",x"11",x"0A",x"04",x"04",x"04",x"04",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"1F",x"01",x"02",x"04",x"08",x"10",x"1F",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"04",x"08",x"1F",x"08",x"04",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"10",x"10",x"10",x"10",x"16",x"01",x"02",
	x"04",x"07",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"04",x"02",x"1F",x"02",x"04",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"04",x"0E",x"15",x"04",x"04",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"0A",x"0A",x"1F",x"0A",x"1F",x"0A",x"0A",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"1F",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"0E",x"01",x"0F",x"11",x"0F",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"10",x"10",x"1E",x"11",x"11",x"11",x"1E",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"0F",x"10",x"10",x"10",x"0F",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"01",x"01",x"0F",x"11",x"11",x"11",x"0F",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"0E",x"11",x"1F",x"10",x"0E",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"02",x"04",x"04",x"0E",x"04",x"04",x"04",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"0F",x"11",x"11",x"11",x"0F",
	x"01",x"0E",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"10",x"10",x"1E",x"11",x"11",x"11",x"11",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"04",x"00",x"0C",x"04",x"04",x"04",x"0E",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"04",x"00",x"04",x"04",x"04",x"04",x"04",
	x"04",x"08",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"08",x"08",x"09",x"0A",x"0C",x"0A",x"09",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"0C",x"04",x"04",x"04",x"04",x"04",x"0E",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"1A",x"15",x"15",x"15",x"15",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"1E",x"11",x"11",x"11",x"11",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"0E",x"11",x"11",x"11",x"0E",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"1E",x"11",x"11",x"11",x"1E",
	x"10",x"10",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"0F",x"11",x"11",x"11",x"0F",
	x"01",x"01",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"0B",x"0C",x"08",x"08",x"08",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"0F",x"10",x"0E",x"01",x"1E",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"04",x"04",x"0E",x"04",x"04",x"04",x"02",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"11",x"11",x"11",x"11",x"0F",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"11",x"11",x"0A",x"0A",x"04",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"11",x"11",x"15",x"15",x"0A",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"11",x"0A",x"04",x"0A",x"11",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"11",x"11",x"11",x"11",x"0F",
	x"01",x"0E",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"1F",x"02",x"04",x"08",x"1F",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"08",x"08",x"08",x"08",x"09",x"03",x"05",
	x"07",x"01",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"0A",x"0A",x"0A",x"0A",x"0A",x"0A",x"0A",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"18",x"04",x"18",x"04",x"19",x"03",x"05",
	x"07",x"01",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"04",x"00",x"1F",x"00",x"04",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"1F",x"1F",x"1F",x"1F",x"1F",x"1F",x"1F",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"80",x"80",x"80",x"80",x"80",x"80",x"80",x"80",
	x"80",x"80",x"00",x"00",x"00",x"00",x"00",x"00",
	x"B8",x"B8",x"B8",x"80",x"80",x"80",x"80",x"80",
	x"80",x"80",x"00",x"00",x"00",x"00",x"00",x"00",
	x"87",x"87",x"87",x"80",x"80",x"80",x"80",x"80",
	x"80",x"80",x"00",x"00",x"00",x"00",x"00",x"00",
	x"BF",x"BF",x"BF",x"80",x"80",x"80",x"80",x"80",
	x"80",x"80",x"00",x"00",x"00",x"00",x"00",x"00",
	x"80",x"80",x"80",x"B8",x"B8",x"B8",x"B8",x"80",
	x"80",x"80",x"00",x"00",x"00",x"00",x"00",x"00",
	x"B8",x"B8",x"B8",x"B8",x"B8",x"B8",x"B8",x"80",
	x"80",x"80",x"00",x"00",x"00",x"00",x"00",x"00",
	x"87",x"87",x"87",x"B8",x"B8",x"B8",x"B8",x"80",
	x"80",x"80",x"00",x"00",x"00",x"00",x"00",x"00",
	x"BF",x"BF",x"BF",x"B8",x"B8",x"B8",x"B8",x"80",
	x"80",x"80",x"00",x"00",x"00",x"00",x"00",x"00",
	x"80",x"80",x"80",x"87",x"87",x"87",x"87",x"80",
	x"80",x"80",x"00",x"00",x"00",x"00",x"00",x"00",
	x"B8",x"B8",x"B8",x"87",x"87",x"87",x"87",x"80",
	x"80",x"80",x"00",x"00",x"00",x"00",x"00",x"00",
	x"87",x"87",x"87",x"87",x"87",x"87",x"87",x"80",
	x"80",x"80",x"00",x"00",x"00",x"00",x"00",x"00",
	x"BF",x"BF",x"BF",x"87",x"87",x"87",x"87",x"80",
	x"80",x"80",x"00",x"00",x"00",x"00",x"00",x"00",
	x"80",x"80",x"80",x"BF",x"BF",x"BF",x"BF",x"80",
	x"80",x"80",x"00",x"00",x"00",x"00",x"00",x"00",
	x"B8",x"B8",x"B8",x"BF",x"BF",x"BF",x"BF",x"80",
	x"80",x"80",x"00",x"00",x"00",x"00",x"00",x"00",
	x"87",x"87",x"87",x"BF",x"BF",x"BF",x"BF",x"80",
	x"80",x"80",x"00",x"00",x"00",x"00",x"00",x"00",
	x"BF",x"BF",x"BF",x"BF",x"BF",x"BF",x"BF",x"80",
	x"80",x"80",x"00",x"00",x"00",x"00",x"00",x"00",
	x"80",x"80",x"80",x"80",x"80",x"80",x"80",x"B8",
	x"B8",x"B8",x"00",x"00",x"00",x"00",x"00",x"00",
	x"B8",x"B8",x"B8",x"80",x"80",x"80",x"80",x"B8",
	x"B8",x"B8",x"00",x"00",x"00",x"00",x"00",x"00",
	x"87",x"87",x"87",x"80",x"80",x"80",x"80",x"B8",
	x"B8",x"B8",x"00",x"00",x"00",x"00",x"00",x"00",
	x"BF",x"BF",x"BF",x"80",x"80",x"80",x"80",x"B8",
	x"B8",x"B8",x"00",x"00",x"00",x"00",x"00",x"00",
	x"80",x"80",x"80",x"B8",x"B8",x"B8",x"B8",x"B8",
	x"B8",x"B8",x"00",x"00",x"00",x"00",x"00",x"00",
	x"B8",x"B8",x"B8",x"B8",x"B8",x"B8",x"B8",x"B8",
	x"B8",x"B8",x"00",x"00",x"00",x"00",x"00",x"00",
	x"87",x"87",x"87",x"B8",x"B8",x"B8",x"B8",x"B8",
	x"B8",x"B8",x"00",x"00",x"00",x"00",x"00",x"00",
	x"BF",x"BF",x"BF",x"B8",x"B8",x"B8",x"B8",x"B8",
	x"B8",x"B8",x"00",x"00",x"00",x"00",x"00",x"00",
	x"80",x"80",x"80",x"87",x"87",x"87",x"87",x"B8",
	x"B8",x"B8",x"00",x"00",x"00",x"00",x"00",x"00",
	x"B8",x"B8",x"B8",x"87",x"87",x"87",x"87",x"B8",
	x"B8",x"B8",x"00",x"00",x"00",x"00",x"00",x"00",
	x"87",x"87",x"87",x"87",x"87",x"87",x"87",x"B8",
	x"B8",x"B8",x"00",x"00",x"00",x"00",x"00",x"00",
	x"BF",x"BF",x"BF",x"87",x"87",x"87",x"87",x"B8",
	x"B8",x"B8",x"00",x"00",x"00",x"00",x"00",x"00",
	x"80",x"80",x"80",x"BF",x"BF",x"BF",x"BF",x"B8",
	x"B8",x"B8",x"00",x"00",x"00",x"00",x"00",x"00",
	x"B8",x"B8",x"B8",x"BF",x"BF",x"BF",x"BF",x"B8",
	x"B8",x"B8",x"00",x"00",x"00",x"00",x"00",x"00",
	x"87",x"87",x"87",x"BF",x"BF",x"BF",x"BF",x"B8",
	x"B8",x"B8",x"00",x"00",x"00",x"00",x"00",x"00",
	x"BF",x"BF",x"BF",x"BF",x"BF",x"BF",x"BF",x"B8",
	x"B8",x"B8",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"0E",x"11",x"17",x"15",x"17",x"10",x"0E",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"04",x"0A",x"11",x"11",x"1F",x"11",x"11",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"1E",x"11",x"11",x"1E",x"11",x"11",x"1E",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"0E",x"11",x"10",x"10",x"10",x"11",x"0E",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"1E",x"11",x"11",x"11",x"11",x"11",x"1E",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"1F",x"10",x"10",x"1E",x"10",x"10",x"1F",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"1F",x"10",x"10",x"1E",x"10",x"10",x"10",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"0E",x"11",x"10",x"10",x"13",x"11",x"0F",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"11",x"11",x"11",x"1F",x"11",x"11",x"11",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"0E",x"04",x"04",x"04",x"04",x"04",x"0E",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"01",x"01",x"01",x"01",x"01",x"11",x"0E",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"11",x"12",x"14",x"18",x"14",x"12",x"11",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"10",x"10",x"10",x"10",x"10",x"10",x"1F",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"11",x"1B",x"15",x"15",x"11",x"11",x"11",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"11",x"11",x"19",x"15",x"13",x"11",x"11",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"0E",x"11",x"11",x"11",x"11",x"11",x"0E",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"1E",x"11",x"11",x"1E",x"10",x"10",x"10",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"0E",x"11",x"11",x"11",x"15",x"12",x"0D",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"1E",x"11",x"11",x"1E",x"14",x"12",x"11",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"0E",x"11",x"10",x"0E",x"01",x"11",x"0E",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"1F",x"04",x"04",x"04",x"04",x"04",x"04",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"11",x"11",x"11",x"11",x"11",x"11",x"0E",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"11",x"11",x"11",x"0A",x"0A",x"04",x"04",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"11",x"11",x"11",x"15",x"15",x"15",x"0A",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"11",x"11",x"0A",x"04",x"0A",x"11",x"11",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"11",x"11",x"0A",x"04",x"04",x"04",x"04",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"1F",x"01",x"02",x"04",x"08",x"10",x"1F",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"04",x"08",x"1F",x"08",x"04",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"10",x"10",x"10",x"10",x"16",x"01",x"02",
	x"04",x"07",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"04",x"02",x"1F",x"02",x"04",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"00",x"04",x"0E",x"15",x"04",x"04",x"00",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"00",x"0A",x"0A",x"1F",x"0A",x"1F",x"0A",x"0A",
	x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
	x"80",x"80",x"80",x"80",x"80",x"80",x"80",x"87",
	x"87",x"87",x"00",x"00",x"00",x"00",x"00",x"00",
	x"B8",x"B8",x"B8",x"80",x"80",x"80",x"80",x"87",
	x"87",x"87",x"00",x"00",x"00",x"00",x"00",x"00",
	x"87",x"87",x"87",x"80",x"80",x"80",x"80",x"87",
	x"87",x"87",x"00",x"00",x"00",x"00",x"00",x"00",
	x"BF",x"BF",x"BF",x"80",x"80",x"80",x"80",x"87",
	x"87",x"87",x"00",x"00",x"00",x"00",x"00",x"00",
	x"80",x"80",x"80",x"B8",x"B8",x"B8",x"B8",x"87",
	x"87",x"87",x"00",x"00",x"00",x"00",x"00",x"00",
	x"B8",x"B8",x"B8",x"B8",x"B8",x"B8",x"B8",x"87",
	x"87",x"87",x"00",x"00",x"00",x"00",x"00",x"00",
	x"87",x"87",x"87",x"B8",x"B8",x"B8",x"B8",x"87",
	x"87",x"87",x"00",x"00",x"00",x"00",x"00",x"00",
	x"BF",x"BF",x"BF",x"B8",x"B8",x"B8",x"B8",x"87",
	x"87",x"87",x"00",x"00",x"00",x"00",x"00",x"00",
	x"80",x"80",x"80",x"87",x"87",x"87",x"87",x"87",
	x"87",x"87",x"00",x"00",x"00",x"00",x"00",x"00",
	x"B8",x"B8",x"B8",x"87",x"87",x"87",x"87",x"87",
	x"87",x"87",x"00",x"00",x"00",x"00",x"00",x"00",
	x"87",x"87",x"87",x"87",x"87",x"87",x"87",x"87",
	x"87",x"87",x"00",x"00",x"00",x"00",x"00",x"00",
	x"BF",x"BF",x"BF",x"87",x"87",x"87",x"87",x"87",
	x"87",x"87",x"00",x"00",x"00",x"00",x"00",x"00",
	x"80",x"80",x"80",x"BF",x"BF",x"BF",x"BF",x"87",
	x"87",x"87",x"00",x"00",x"00",x"00",x"00",x"00",
	x"B8",x"B8",x"B8",x"BF",x"BF",x"BF",x"BF",x"87",
	x"87",x"87",x"00",x"00",x"00",x"00",x"00",x"00",
	x"87",x"87",x"87",x"BF",x"BF",x"BF",x"BF",x"87",
	x"87",x"87",x"00",x"00",x"00",x"00",x"00",x"00",
	x"BF",x"BF",x"BF",x"BF",x"BF",x"BF",x"BF",x"87",
	x"87",x"87",x"00",x"00",x"00",x"00",x"00",x"00",
	x"80",x"80",x"80",x"80",x"80",x"80",x"80",x"BF",
	x"BF",x"BF",x"00",x"00",x"00",x"00",x"00",x"00",
	x"B8",x"B8",x"B8",x"80",x"80",x"80",x"80",x"BF",
	x"BF",x"BF",x"00",x"00",x"00",x"00",x"00",x"00",
	x"87",x"87",x"87",x"80",x"80",x"80",x"80",x"BF",
	x"BF",x"BF",x"00",x"00",x"00",x"00",x"00",x"00",
	x"BF",x"BF",x"BF",x"80",x"80",x"80",x"80",x"BF",
	x"BF",x"BF",x"00",x"00",x"00",x"00",x"00",x"00",
	x"80",x"80",x"80",x"B8",x"B8",x"B8",x"B8",x"BF",
	x"BF",x"BF",x"00",x"00",x"00",x"00",x"00",x"00",
	x"B8",x"B8",x"B8",x"B8",x"B8",x"B8",x"B8",x"BF",
	x"BF",x"BF",x"00",x"00",x"00",x"00",x"00",x"00",
	x"87",x"87",x"87",x"B8",x"B8",x"B8",x"B8",x"BF",
	x"BF",x"BF",x"00",x"00",x"00",x"00",x"00",x"00",
	x"BF",x"BF",x"BF",x"B8",x"B8",x"B8",x"B8",x"BF",
	x"BF",x"BF",x"00",x"00",x"00",x"00",x"00",x"00",
	x"80",x"80",x"80",x"87",x"87",x"87",x"87",x"BF",
	x"BF",x"BF",x"00",x"00",x"00",x"00",x"00",x"00",
	x"B8",x"B8",x"B8",x"87",x"87",x"87",x"87",x"BF",
	x"BF",x"BF",x"00",x"00",x"00",x"00",x"00",x"00",
	x"87",x"87",x"87",x"87",x"87",x"87",x"87",x"BF",
	x"BF",x"BF",x"00",x"00",x"00",x"00",x"00",x"00",
	x"BF",x"BF",x"BF",x"87",x"87",x"87",x"87",x"BF",
	x"BF",x"BF",x"00",x"00",x"00",x"00",x"00",x"00",
	x"80",x"80",x"80",x"BF",x"BF",x"BF",x"BF",x"BF",
	x"BF",x"BF",x"00",x"00",x"00",x"00",x"00",x"00",
	x"B8",x"B8",x"B8",x"BF",x"BF",x"BF",x"BF",x"BF",
	x"BF",x"BF",x"00",x"00",x"00",x"00",x"00",x"00",
	x"87",x"87",x"87",x"BF",x"BF",x"BF",x"BF",x"BF",
	x"BF",x"BF",x"00",x"00",x"00",x"00",x"00",x"00",
	x"BF",x"BF",x"BF",x"BF",x"BF",x"BF",x"BF",x"BF",
	x"BF",x"BF",x"00",x"00",x"00",x"00",x"00",x"00");

 begin
 
    process(clock) is
    begin
        if (rising_edge(clock)) then
            QA <= std_logic_vector(mem(to_integer(unsigned(addressA))));
        end if;
    end process;

    process(clock) is
    begin
        if (rising_edge(clock)) then    
            QB <= std_logic_vector(mem(to_integer(unsigned(addressB))));
        end if;
    end process;
end RTL;
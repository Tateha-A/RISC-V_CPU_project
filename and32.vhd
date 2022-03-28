library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity and32 is
	port(
		data0: in std_logic_vector(31 downto 0);
		data1: in std_logic_vector(31 downto 0);
		output : out std_logic_vector(31 downto 0)	
	);
end entity and32;

architecture logic of and32 is
begin
	output <= std_logic_vector(signed(data0 and data1));
end architecture logic;
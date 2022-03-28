library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity or32 is
	port(
		data0: in std_logic_vector(31 downto 0);
		data1: in std_logic_vector(31 downto 0);
		output : out std_logic_vector(31 downto 0)	
	);
end entity or32;

architecture logic of or32 is
begin
	output <= std_logic_vector(signed(data0 or data1));
end architecture logic;
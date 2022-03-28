library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity not32 is
	port(
		data: in std_logic_vector(31 downto 0);
		output : out std_logic_vector(31 downto 0)	
	);
end entity not32;

architecture logic of not32 is
begin
	output <= std_logic_vector(signed(not data));
end architecture logic;
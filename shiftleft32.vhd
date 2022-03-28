library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity shiftleft32 is
	port(
		data : in std_logic_vector(31 downto 0);	
		interval : in std_logic_vector(31 downto 0);	
		output : out std_logic_vector(31 downto 0)
	);
end entity shiftleft32;

architecture logic of shiftleft32 is
begin
	output <= std_logic_vector(shift_left(unsigned(data), to_integer(signed(interval))));
end architecture logic;

--library ieee;
--use ieee.std_logic_1164.all;
--use ieee.std_logic_unsigned.all;
--use ieee.numeric_std.all;
--
--
--entity shiftleft32 is
--	port(
--		data : in std_logic_vector(31 downto 0);	
--		interval : in std_logic_vector(31 downto 0);	
--		output : out std_logic_vector(31 downto 0)
--	);
--end entity shiftleft32;
--
--architecture logic of shiftleft32 is
--begin
--	process(data, interval)
--	variable temp : INTEGER;
--	begin	
--		temp := TO_INTEGER(unsigned(interval));
--		
--			if(temp = 0) then
--				output <= std_logic_vector(data(31 downto 0));
--			elsif(temp = 1) then
--				output <= std_logic_vector(data(30 downto 0) & ('0'));
--			elsif(temp = 2) then
--				output <= std_logic_vector(data(29 downto 0) & (1 downto 0 => '0'));
--			elsif(temp = 3) then
--				output <= std_logic_vector(data(28 downto 0) & (2 downto 0 => '0'));
--			elsif(temp = 4) then
--				output <= std_logic_vector(data(27 downto 0) & (3 downto 0 => '0'));
--			elsif(temp = 5) then
--				output <= std_logic_vector(data(26 downto 0) & (4 downto 0 => '0'));
--			elsif(temp = 6) then
--				output <= std_logic_vector(data(25 downto 0) & (5 downto 0 => '0'));
--			elsif(temp = 7) then
--				output <= std_logic_vector(data(24 downto 0) & (6 downto 0 => '0'));
--			elsif(temp = 8) then
--				output <= std_logic_vector(data(23 downto 0) & (7 downto 0 => '0'));
--			elsif(temp = 9) then
--				output <= std_logic_vector(data(22 downto 0) & (8 downto 0 => '0'));
--			elsif(temp = 10) then
--				output <= std_logic_vector(data(21 downto 0) & (9 downto 0 => '0'));
--			elsif(temp = 11) then
--				output <= std_logic_vector(data(20 downto 0) & (10 downto 0 => '0'));
--			elsif(temp = 12) then
--				output <= std_logic_vector(data(19 downto 0) & (11 downto 0 => '0'));
--			elsif(temp = 13) then
--				output <= std_logic_vector(data(18 downto 0) & (12 downto 0 => '0'));
--			elsif(temp = 14) then
--				output <= std_logic_vector(data(17 downto 0) & (13 downto 0 => '0'));
--			elsif(temp = 15) then
--				output <= std_logic_vector(data(16 downto 0) & (14 downto 0 => '0'));
--			elsif(temp = 16) then
--				output <= std_logic_vector(data(15 downto 0) & (15 downto 0 => '0'));
--			elsif(temp = 17) then
--				output <= std_logic_vector(data(14 downto 0) & (16 downto 0 => '0'));
--			elsif(temp = 18) then
--				output <= std_logic_vector(data(13 downto 0) & (17 downto 0 => '0'));
--			elsif(temp = 19) then
--				output <= std_logic_vector(data(12 downto 0) & (18 downto 0 => '0'));
--			elsif(temp = 20) then
--				output <= std_logic_vector(data(11 downto 0) & (19 downto 0 => '0'));
--			elsif(temp = 21) then
--				output <= std_logic_vector(data(10 downto 0) & (20 downto 0 => '0'));
--			elsif(temp = 22) then
--				output <= std_logic_vector(data(9 downto 0) & (21 downto 0 => '0'));
--			elsif(temp = 23) then
--				output <= std_logic_vector(data(8 downto 0) & (22 downto 0 => '0'));
--			elsif(temp = 24) then
--				output <= std_logic_vector(data(7 downto 0) & (23 downto 0 => '0'));
--			elsif(temp = 25) then
--				output <= std_logic_vector(data(6 downto 0) & (24 downto 0 => '0'));
--			elsif(temp = 26) then
--				output <= std_logic_vector(data(5 downto 0) & (25 downto 0 => '0'));
--			elsif(temp = 27) then
--				output <= std_logic_vector(data(4 downto 0) & (26 downto 0 => '0'));
--			elsif(temp = 28) then
--				output <= std_logic_vector(data(3 downto 0) & (27 downto 0 => '0'));
--			elsif(temp = 29) then
--				output <= std_logic_vector(data(2 downto 0) & (28 downto 0 => '0'));
--			elsif(temp = 30) then
--				output <= std_logic_vector(data(1 downto 0) & (29 downto 0 => '0'));
--			elsif(temp = 31) then
--				output <= std_logic_vector(data(0 downto 0) & (30 downto 0 => '0'));
--			else
--				output <= std_logic_vector(data(31 downto 0));
--end if;
--end process;
--end architecture logic;
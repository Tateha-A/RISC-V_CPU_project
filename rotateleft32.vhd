library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity rotateleft32 is
	port(
		data : in std_logic_vector(31 downto 0);	
		interval : in std_logic_vector(31 downto 0);	
		output : out std_logic_vector(31 downto 0)
	);
end entity rotateleft32;

architecture logic of rotateleft32 is
begin
	output <= std_logic_vector(rotate_left(unsigned(data), to_integer(signed(interval))));
end architecture logic;

--library ieee;
--use ieee.std_logic_1164.all;
--use ieee.std_logic_unsigned.all;
--use ieee.numeric_std.all;


--entity rotateleft32 is
--	port(
--		data : in std_logic_vector(31 downto 0);	
--		interval : in std_logic_vector(31 downto 0);	
--		output : out std_logic_vector(31 downto 0)
--	);
--end entity rotateleft32;
--
--architecture logic of rotateleft32 is
--begin
--	process(data, interval)
--	variable temp : INTEGER;
--	begin	
--		temp := TO_INTEGER(unsigned(interval));
--		
--			if(temp = 0) then
--				output <= std_logic_vector(data(31 downto 0));
--			elsif(temp = 1) then
--				output <= std_logic_vector(data(0 downto 0) & data(31 downto 1));
--			elsif(temp = 2) then
--				output <= std_logic_vector(data(1 downto 0)& data(31 downto 2));
--			elsif(temp = 3) then
--				output <= std_logic_vector(data(2 downto 0)& data(31 downto 3));
--			elsif(temp = 4) then
--				output <= std_logic_vector(data(3 downto 0)& data(31 downto 4));
--			elsif(temp = 5) then
--				output <= std_logic_vector(data(4 downto 0)& data(31 downto 5));
--			elsif(temp = 6) then
--				output <= std_logic_vector(data(5 downto 0)& data(31 downto 6));
--			elsif(temp = 7) then
--				output <= std_logic_vector(data(6 downto 0)& data(31 downto 7));
--			elsif(temp = 8) then
--				output <= std_logic_vector(data(7 downto 0)& data(31 downto 8));
--			elsif(temp = 9) then
--				output <= std_logic_vector(data(8 downto 0)& data(31 downto 9));
--			elsif(temp = 10) then
--				output <= std_logic_vector(data(9 downto 0)& data(31 downto 10));
--			elsif(temp = 11) then
--				output <= std_logic_vector(data(10 downto 0)& data(31 downto 11));
--			elsif(temp = 12) then
--				output <= std_logic_vector(data(11 downto 0)& data(31 downto 12));
--			elsif(temp = 13) then
--				output <= std_logic_vector(data(12 downto 0)& data(31 downto 13));
--			elsif(temp = 14) then
--				output <= std_logic_vector(data(13 downto 0)& data(31 downto 14));
--			elsif(temp = 15) then
--				output <= std_logic_vector(data(14 downto 0)& data(31 downto 15));
--			elsif(temp = 16) then
--				output <= std_logic_vector(data(15 downto 0)& data(31 downto 16));
--			elsif(temp = 17) then
--				output <= std_logic_vector(data(16 downto 0)& data(31 downto 17));
--			elsif(temp = 18) then
--				output <= std_logic_vector(data(17 downto 0)& data(31 downto 18));
--			elsif(temp = 19) then
--				output <= std_logic_vector(data(18 downto 0)& data(31 downto 19));
--			elsif(temp = 20) then
--				output <= std_logic_vector(data(19 downto 0)& data(31 downto 20));
--			elsif(temp = 21) then
--				output <= std_logic_vector(data(20 downto 0)& data(31 downto 21));
--			elsif(temp = 22) then
--				output <= std_logic_vector(data(21 downto 0)& data(31 downto 22));
--			elsif(temp = 23) then
--				output <= std_logic_vector(data(22 downto 0)& data(31 downto 23));
--			elsif(temp = 24) then
--				output <= std_logic_vector(data(23 downto 0)& data(31 downto 24));
--			elsif(temp = 25) then
--				output <= std_logic_vector(data(24 downto 0)& data(31 downto 25));
--			elsif(temp = 26) then
--				output <= std_logic_vector(data(25 downto 0)& data(31 downto 26));
--			elsif(temp = 27) then
--				output <= std_logic_vector(data(26 downto 0)& data(31 downto 27));
--			elsif(temp = 28) then
--				output <= std_logic_vector(data(27 downto 0)& data(31 downto 28));
--			elsif(temp = 29) then
--				output <= std_logic_vector(data(28 downto 0)& data(31 downto 29));
--			elsif(temp = 30) then
--				output <= std_logic_vector(data(29 downto 0)& data(31 downto 30));
--			elsif(temp = 31) then
--				output <= std_logic_vector(data(30 downto 0)& data(31 downto 31));
--			else
--				output <= std_logic_vector(data(31 downto 0));
--end if;
--end process;
--end architecture logic;
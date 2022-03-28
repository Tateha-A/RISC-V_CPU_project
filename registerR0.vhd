library ieee;
use ieee.std_logic_1164.all;

entity registerR0 is 
port(
	BusMuxOutR0:	in std_logic_vector (31 downto 0);
	R0in: 			in std_logic;
	clr: 				in std_logic;
	clk: 				in std_logic;
	BAout: 			in std_logic;
	BusMuxInR0 : 	out std_logic_vector (31 downto 0));
end entity registerR0;

architecture logic of registerR0 is 
signal q: std_logic_vector (31 downto 0);
begin 

	process(clk, clr)
	begin
		if clr = '0' then 
			q <= (others=>'0');
		elsif (clk'event and clk='1') then
			if (R0in = '1') then
				q <= BusMuxOutR0;
			end if;
		end if;
	end process;
	 
	BusMuxInR0(0) <= q(0) and (not BAout);
	BusMuxInR0(1) <= q(1) and (not BAout);
	BusMuxInR0(2) <= q(2) and (not BAout);
	BusMuxInR0(3) <= q(3) and (not BAout);
	BusMuxInR0(4) <= q(4) and (not BAout);
	BusMuxInR0(5) <= q(5) and (not BAout);
	BusMuxInR0(6) <= q(6) and (not BAout);
	BusMuxInR0(7) <= q(7) and (not BAout);
	BusMuxInR0(8) <= q(8) and (not BAout);
	BusMuxInR0(9) <= q(9) and (not BAout);
	BusMuxInR0(10) <= q(10) and (not BAout);
	BusMuxInR0(11) <= q(11) and (not BAout);
	BusMuxInR0(12) <= q(12) and (not BAout);
	BusMuxInR0(13) <= q(13) and (not BAout);
	BusMuxInR0(14) <= q(14) and (not BAout);
	BusMuxInR0(15) <= q(15) and (not BAout);
	BusMuxInR0(16) <= q(16) and (not BAout);
	BusMuxInR0(17) <= q(17) and (not BAout);
	BusMuxInR0(18) <= q(18) and (not BAout);
	BusMuxInR0(19) <= q(19) and (not BAout);
	BusMuxInR0(20) <= q(20) and (not BAout);
	BusMuxInR0(21) <= q(21) and (not BAout);
	BusMuxInR0(22) <= q(22) and (not BAout);
	BusMuxInR0(23) <= q(23) and (not BAout);
	BusMuxInR0(24) <= q(24) and (not BAout);
	BusMuxInR0(25) <= q(25) and (not BAout);
	BusMuxInR0(26) <= q(26) and (not BAout);
	BusMuxInR0(27) <= q(27) and (not BAout);
	BusMuxInR0(28) <= q(28) and (not BAout);
	BusMuxInR0(29) <= q(29) and (not BAout);
	BusMuxInR0(30) <= q(30) and (not BAout);
	BusMuxInR0(31) <= q(31) and (not BAout);
end architecture logic;
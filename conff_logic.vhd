library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity conff_logic is 
port (
	clk:	 	in std_logic;
	clr:	 	in std_logic;
	C2: 		in std_logic_vector(1 downto 0);	-- only first 2 bits
	BusMuxIn: in std_logic_vector(31 downto 0);
	Con_in:	in std_logic;
	Q: 		out std_logic);
end entity conff_logic;


architecture logic of conff_logic is 

signal decoder_out: std_logic_vector(3 downto 0);
-- equal, not equal, greater equal, less than
signal eq, neq, gte, lt: std_logic;
signal nor_out: std_logic;
signal Con_D: std_logic; 

begin 

	decoder_out <= "0001" when (C2 = "00") else
						"0010" when (C2 = "01") else
						"0100" when (C2 = "10") else
						"1000" when (C2 = "11");
				 
	nor_out <= (not (BusMuxIn(0) or BusMuxIn(1) or BusMuxIn(2) or BusMuxIn(3) 
						or BusMuxIn(4) or BusMuxIn(5) or BusMuxIn(6) or BusMuxIn(7)
						or BusMuxIn(8) or BusMuxIn(9)	or BusMuxIn(10) or BusMuxIn(11)
						or BusMuxIn(12) or BusMuxIn(13) or BusMuxIn(14) or BusMuxIn(15)
						or BusMuxIn(16) or BusMuxIn(17) or BusMuxIn(18) or BusMuxIn(19)
						or BusMuxIn(20) or BusMuxIn(21) or BusMuxIn(22) or BusMuxIn(23)
						or BusMuxIn(24) or BusMuxIn(25) or BusMuxIn(26) or BusMuxIn(27)
						or BusMuxIn(28) or BusMuxIn(29) or BusMuxIn(30) or BusMuxIn(31))
					);
	 
	eq <= decoder_out(0) and (nor_out);
	neq <= decoder_out(1) and (not (nor_out));
	gte <= decoder_out(2) and (not BusMuxIn(31));
	lt <= decoder_out(3) and BusMuxIn(31);

	Con_D <= (eq or neq or gte or lt);

	Conff: process(clk, Con_in, clr)
	begin 
		if clr = '0' then 
			Q <= '0';
		elsif clk'event and clk = '1' then 
			if Con_in = '1' then 
				Q <= Con_D;
			end if;
		end if;	
	end process;
	
end architecture logic;
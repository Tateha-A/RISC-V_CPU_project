library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

use ieee.numeric_std.all;

entity booth_alu is 
	generic (
		base_bit : integer := 32
		);
		
	port(
		mutiplicant : in std_logic_vector(31 downto 0);
		multiplier : in std_logic_vector(31 downto 0);
		result : out std_logic_vector(63 downto 0)
	);
end entity booth_alu;

architecture logic of booth_alu is
begin
	process (mutiplicant, multiplier)
	variable sum : signed(63 downto 0);
	variable M : signed(31 downto 0);
	variable Q : signed(32 downto 0);
		begin
		sum := (others => '0');
		M := resize(signed(mutiplicant),  M'length);
		
		Q(0) := '0'; -- implicit 0
		Q(32 downto 1) := signed(multiplier);
		for i in 0 to (base_bit - 1) loop
			if ((Q(2) = '0' and Q(1) = '0' and Q(0) = '1')) then
				sum := sum + (M sll (2 * i)); -- +1
				
			elsif ((Q(2) = '0' and Q(1) = '1' and Q(0) = '0')) then
				sum := sum + (M sll (2 * i)); -- +1
				
			elsif ((Q(2) = '0' and Q(1) = '1' and Q(0) = '1')) then 
				sum := sum + (2 * (M sll (2 * i))); -- +2
				
			elsif ((Q(2) = '1' and Q(1) = '0' and Q(0) = '0')) then 
				sum := sum - (2 * (M sll (2 * i))); -- -2
				
			elsif ((Q(2) = '1' and Q(1) = '0' and Q(0) = '1')) then
				sum := sum - (M sll (2 * i)); -- -1
				
			elsif ((Q(2) = '1' and Q(1) = '1' and Q(0) = '0')) then
				sum := sum - (M sll (2 * i)); -- -1
				
			end if;
			Q := Q srl 2; -- recode shiftRight
		end loop;
		result <= std_logic_vector(sum((base_bit * 2 - 1) downto 0));
		sum := (others => '0');
		
	end process;
end architecture logic;
	
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.componentLib.all;

entity MDR is
	port(
		MDMux_read: in std_logic; 
		MDRin: in std_logic; -- enable
		clr: in std_logic;
		clk: in std_logic;
		MDR_BusMuxOut: in std_logic_vector(31 downto 0);  -- from bus
		MDR_Mdatain: in std_logic_vector(31 downto 0); -- from memory 
		MDR_out: out std_logic_vector(31 downto 0) -- data ouput Q
	);
end entity MDR;

architecture behavior of MDR is 

signal MDMux_out: std_logic_vector(31 downto 0);

begin 
	MDMux_out <= MDR_BusMuxOut when MDMux_read = '0' else MDR_Mdatain;-- '0' from bus, '1' from memory
					 
	MDR_instance: register32bit port map(
    clk => clk,
	 clr => clr,
    R1in => MDRin,
    BusMuxOut => MDMux_out,
    BusMuxIn => MDR_out
	);

end architecture behavior;
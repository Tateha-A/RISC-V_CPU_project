library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.components_all.all;

entity MDR is port(
MDMux_read: in std_logic; 
MDR_enable: in std_logic; 
clr: in std_logic;
clk: in std_logic;
MDR_in1:in std_logic_vector(31 downto 0); 
MDR_in2: in std_logic_vector(31 downto 0); --1 is from bus, 2 is from memory 
MDR_out: out std_logic_vector(31 downto 0)
);
end entity MDR;

architecture behav of MDR is 
signal MDMux_out: std_logic_vector(31 downto 0);
begin 
MDMux_out <= MDR_in2 when MDMux_read = '1' else -- '0' from bus, '1' from memory
				 MDR_in1;
The_MDR: register32bit port map(MDMux_out, MDR_enable, clr, clk, MDR_out);

end architecture behav;
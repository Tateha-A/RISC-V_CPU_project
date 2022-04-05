library ieee;
use ieee.std_logic_1164.all;
use work.componentLib.all;

entity P4_DE0_interface is
end;

architecture logic of P4_DE0_interface is
signal clk_tb: std_logic;
signal clr_tb: std_logic;
signal inport_tb: std_logic_vector(31 downto 0);
signal outport_tb: std_logic_vector(31 downto 0);
signal seven_segment_out_tb: std_logic_vector (31 downto 0);
signal reset_tb: std_logic;
signal stop_tb	: std_logic;
signal run_tb: std_logic;

component DE0_interface is
port(
		clk: in std_logic;
		reset	: in std_logic;
		stop	: in std_logic;
		run	: out std_logic;
		in_port: in std_logic_vector (31 downto 0);
		out_port: out std_logic_vector (31 downto 0);
		seven_segment_out_IO: out std_logic_vector (31 downto 0));
		-- LED ([5] run/halt)
		-- switch (in_port[0...8])
		-- PB[0] reset
		-- PB[1] stop
end component;

begin
interfaceTest : DE0_interface port map 
									(
									clk_tb,
									reset_tb,
									stop_tb,
									run_tb,
									inport_tb,
									outport_tb,
									seven_segment_out_tb);

clk_process: process
begin
	clk_tb <= '1', '0' after 10 ns;
	wait for 20 ns;
end process clk_process;

main: process
begin
	inport_tb <= x"00000088";
	stop_tb <= '1';
	reset_tb <= '1';
	wait for 5000 ns;
	reset_tb <= '0';
	wait for 15 ns;
	reset_tb <= '1';
	wait for 5000000 ns;
end process;
end architecture;	



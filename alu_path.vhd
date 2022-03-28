library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use work.componentLib.all;

entity alu_path is
	port(
		clk: in std_logic;
		clr: in std_logic; 
		Y_enable: in std_logic; 
		Z_enable: in std_logic;
		Ain: in std_logic_vector(31 downto 0);
		Bin: in std_logic_vector(31 downto 0);
		PC_plus: in std_logic;
		alu_sel: in std_logic_vector(4 downto 0);
		overflow: out std_logic;
		Zlow: out std_logic_vector(31 downto 0); --BusMuxIn_Zlow
		Zhigh: out std_logic_vector(31 downto 0) --BusMuxIn_Zhigh
	);
end entity alu_path;

architecture behavior of alu_path is 
	signal Yout: std_logic_vector(31 downto 0);
	signal Zin: std_logic_vector(63 downto 0);
	signal ALU_out: std_logic_vector(63 downto 0);
	signal PCinc: std_logic_vector(63 downto 0);

begin 
	register_Y : register32bit port map (clr, clk, Y_enable, Ain, Yout);
	alu_unit : alu port map(Yout, Bin, alu_sel, overflow, ALU_out);
	register_Z : register64bit port map(clr, clk, Z_enable, Zin, Zlow, Zhigh);

	PCinc(31 downto 0)<= std_logic_vector(unsigned(Ain)+1); -- increment PC
	PCinc(63 downto 32)<= (others=>'0');

	Zin <= PCinc when PC_plus = '1' else 
			ALU_out; --mux Y

end architecture behavior;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.all;
use work.componentLib.all;


entity DE0_interface is
port(
		clk: in std_logic;
		reset	: in std_logic;
		stop	: in std_logic;
		run	: out std_logic;
		in_port: in std_logic_vector (31 downto 0);
		out_port: out std_logic_vector (31 downto 0);
		seven_segment_out: out std_logic_vector (31 downto 0));
		-- LED ([5] run/halt)
		-- switch (in_port[0...8])
		-- PB[0] reset
		-- PB[1] stop
end entity;

architecture behavior of DE0_interface is

signal clk_DE0: std_logic;
signal clr_DE0: std_logic;
signal inport_DE0: std_logic_vector(31 downto 0);
signal outport_DE0: std_logic_vector(31 downto 0);
signal seven_segment_out_DE0: std_logic_vector (31 downto 0);
signal R0out_DE0: std_logic_vector(31 downto 0);
signal R1out_DE0: std_logic_vector(31 downto 0);
signal R2out_DE0: std_logic_vector(31 downto 0);
signal R3out_DE0: std_logic_vector(31 downto 0);
signal R4out_DE0: std_logic_vector(31 downto 0);
signal R5out_DE0: std_logic_vector(31 downto 0);
signal R6out_DE0: std_logic_vector(31 downto 0);
signal R7out_DE0: std_logic_vector(31 downto 0);
signal R8out_DE0: std_logic_vector(31 downto 0);
signal R9out_DE0: std_logic_vector(31 downto 0);
signal R10out_DE0: std_logic_vector(31 downto 0);
signal R11out_DE0: std_logic_vector(31 downto 0);
signal R12out_DE0: std_logic_vector(31 downto 0);
signal R13out_DE0: std_logic_vector(31 downto 0);
signal R14out_DE0: std_logic_vector(31 downto 0);
signal R15out_DE0: std_logic_vector(31 downto 0);
signal BusMuxOut_DE0: std_logic_vector(31 downto 0);
signal HIout_DE0: std_logic_vector(31 downto 0);
signal LOout_DE0: std_logic_vector(31 downto 0);
signal IRout_DE0: std_logic_vector(31 downto 0);
signal PCval_DE0 : std_logic_vector(31 downto 0);
signal Zout_DE0	: std_logic_vector(63 downto 0);
signal MDRval_DE0: std_logic_vector(31 downto 0);
signal MARval_DE0: std_logic_vector(31 downto 0);
signal RAM_out: std_logic_vector(31 downto 0);
signal reset_DE0: std_logic;
signal stop_DE0	: std_logic;
signal run_DE0: std_logic;

-- clock modifier
signal prescaler : unsigned(23 downto 0);

component datapath is 
	port (
		clk: in std_logic;
		reset	: in std_logic;
		stop	: in std_logic;
		run	: out std_logic;
		in_port: in std_logic_vector (31 downto 0);
		out_port: out std_logic_vector (31 downto 0);
		seven_segment_out: out std_logic_vector (31 downto 0);
		R0out	: out std_logic_vector(31 downto 0);
		R1out	: out std_logic_vector(31 downto 0);
		R2out	: out std_logic_vector(31 downto 0);
		R3out	: out std_logic_vector(31 downto 0);
		R4out	: out std_logic_vector(31 downto 0);
		R5out	: out std_logic_vector(31 downto 0);
		R6out	: out std_logic_vector(31 downto 0);
		R7out	: out std_logic_vector(31 downto 0);
		R8out	: out std_logic_vector(31 downto 0);
		R9out	: out std_logic_vector(31 downto 0);
		R10out : out std_logic_vector(31 downto 0);
		R11out : out std_logic_vector(31 downto 0);
		R12out : out std_logic_vector(31 downto 0);
		R13out : out std_logic_vector(31 downto 0);
		R14out : out std_logic_vector(31 downto 0);
		R15out : out std_logic_vector(31 downto 0);
		BusMuxOut: out std_logic_vector(31 downto 0);
		MAR_out : out std_logic_vector (31 downto 0);
		MDR_out : out std_logic_vector (31 downto 0);
		PCout: out std_logic_vector (31 downto 0);
		HIout	: out std_logic_vector(31 downto 0);
		LOout	: out std_logic_vector(31 downto 0);
		IRout	: out std_logic_vector(31 downto 0);
		Zout: out std_logic_vector(63 downto 0);
		ram_pop : out std_logic_vector(31 downto 0));
end component datapath;

begin

	gen_clk : process (clk, reset)
	begin  -- process gen_clk
    if reset = '1' then
      clk_DE0 <= '0';
      prescaler <= (others => '0');
    elsif rising_edge(clk) then   -- rising clock edge
		if prescaler = X"4" then     -- 50MHz / 4 = 12.5MHz
        prescaler <= (others => '0');
        clk_DE0 <= not clk_DE0;
      else
        prescaler <= prescaler + "1";
      end if;
    end if;
	end process gen_clk;

	DE0_map : datapath port map 
									(
									clk, 
									reset, 
									stop, 
									run, 
									in_port, 
									out_port,
									seven_segment_out,
									R0out_DE0, 
									R1out_DE0, 
									R2out_DE0,
									R3out_DE0, 
									R4out_DE0,
									R5out_DE0, 
									R6out_DE0, 
									R7out_DE0, 
									R8out_DE0, 
									R9out_DE0, 
									R10out_DE0,
									R11out_DE0, 
									R12out_DE0, 
									R13out_DE0, 
									R14out_DE0,
									R15out_DE0,
									BusMuxOut_DE0,
									MARval_DE0,
									MDRval_DE0, 
									PCval_DE0, 
									HIout_DE0, 
									LOout_DE0, 
									IRout_DE0,
									Zout_DE0,
									RAM_out);

end architecture behavior;
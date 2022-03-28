library ieee;
use ieee.std_logic_1164.all;

entity p1_datapath_shiftright32_tb is
end;

architecture logic of p1_datapath_shiftright32_tb is

signal clk_tb : std_logic;
signal PC_plus_tb	: std_logic;
signal MDR_read_tb	: std_logic;
signal alu_sel_tb		: std_logic_vector(4 downto 0); 
signal encoderIn_tb	: std_logic_vector(31 downto 0);
signal RegEnable_tb	: std_logic_vector(31 downto 0);
signal Mdatain_tb	:	std_logic_vector(31 downto 0);

signal BusMuxOut_tb:		std_logic_vector(31 downto 0);
signal IRout_tb:	std_logic_vector(31 downto 0);
signal Zout_tb:	std_logic_vector(63 downto 0);
signal R2out_tb: std_logic_vector(31 downto 0);
signal R4out_tb: std_logic_vector(31 downto 0);
signal R5out_tb: std_logic_vector(31 downto 0);

TYPE	state is(default, Reg_load1a, Reg_load1b, Reg_load2a, Reg_load2b, Reg_load3a, Reg_load3b, T0, T1, T2, T3, T4, T5, T6);
signal	present_state: State := default;

component datapath is 
	port (
		clk: in std_logic;
		Mdatain: in std_logic_vector(31 downto 0);
		MDR_read: in std_logic;
		PC_plus: in std_logic;
		register_enable: std_logic_vector(31 downto 0);
		alu_sel	: std_logic_vector(4 downto 0);
		encoderIn: std_logic_vector(31 downto 0);
		
		BusMuxOut: out std_logic_vector(31 downto 0);
		
		R2out	: out std_logic_vector(31 downto 0);
		R4out	: out std_logic_vector(31 downto 0);
		R5out	: out std_logic_vector(31 downto 0);

		IRout	: out std_logic_vector(31 downto 0);
		Zout: out std_logic_vector(63 downto 0)
);
end component;

begin
Test : datapath port map 
(clk_tb,
Mdatain_tb,
MDR_read_tb,
PC_plus_tb,
RegEnable_tb,
alu_sel_tb,
encoderIn_tb,

BusMuxOut_tb,

R2out_tb, 
R4out_tb, 
R5out_tb, 

IRout_tb, 
Zout_tb);

Clock_process: process is
begin
	clk_tb <= '1', '0' after 10 ns;
	wait for 20 ns;
end process Clock_process;

process(clk_tb)	--finite state machine
begin
	if(clk_tb' event and clk_tb = '1') then	-- rising edge
		case present_state is
			when default =>
				present_state <= Reg_load1a;
			when Reg_load1a =>
				present_state <= Reg_load1b;
			when Reg_load1b =>
				present_state <= Reg_load2a;
			when Reg_load2a =>
				present_state <= Reg_load2b;
			when Reg_load2b =>
				present_state <= Reg_load3a;
			when Reg_load3a =>
				present_state <= Reg_load3b;
			when Reg_load3b =>
				present_state <= T0;
			when T0 =>
				present_state <= T1;
			when T1 =>
				present_state <= T2;
			when T2 =>
				present_state <= T3;
			when T3 =>
				present_state <= T4;
			when T4 =>
				present_state <= T5;
			when T5 =>
				present_state <= T6;
			when others =>
		end case;
	end if;
end process;


process (present_state)
begin
	case present_state is
		when default =>
			PC_plus_tb <= '0';
			MDR_read_tb <= '0';
			alu_sel_tb <= (others => '0');
			Mdatain_tb <= (others => '0');
			encoderIn_tb <= (others => '0');
			RegEnable_tb <= (others => '0');
		when Reg_load1a =>
			Mdatain_tb <= x"0000000F"; -- d6,b1111
			MDR_read_tb <= '0', '1' after 10 ns, '0' after 25 ns; -- MRD read (mem)
			RegEnable_tb <= (others=>'0'), (20=>'1', others=>'0') after 10 ns, (others=>'0') after 25 ns;	-- MDRin enable bit20
			
		when Reg_load1b =>
			encoderIn_tb <= (others=>'0'), (21 => '1', others => '0') after 10 ns, (others=>'0') after 25 ns;	-- BusMuxIn_MDR (BUS)
			RegEnable_tb <= (others=>'0'), (2 => '1', others => '0') after 10 ns, (others=>'0') after 25 ns;	-- R2
			
		when Reg_load2a =>
			Mdatain_tb <= x"00000003"; -- d3,b0011
			MDR_read_tb <= '0', '1' after 10 ns, '0' after 25 ns; -- MDR read (mem)
			RegEnable_tb <= (others=>'0'), (20=>'1', others=>'0') after 10 ns, (others=>'0') after 25 ns;	-- MDRin enable bit20
			
		when Reg_load2b =>
			encoderIn_tb <= (others=>'0'), (21 => '1', others => '0')after 10 ns, (others=>'0') after 25 ns;	-- BusMuxIn_MDR (BUS)
			RegEnable_tb <= (others=>'0'), (4 => '1', others => '0')after 10 ns, (others=>'0') after 25 ns;	-- R4
			
		when Reg_load3a =>
			Mdatain_tb <= x"00000000"; -- initialize R5 d0
			MDR_read_tb <= '0', '1' after 10 ns, '0' after 25 ns; -- MDR read (mem)
			RegEnable_tb <= (others=>'0'), (20=>'1', others=>'0') after 10 ns, (others=>'0') after 25 ns; -- MDRin enable bit20
			
		when Reg_load3b =>
			encoderIn_tb <= (others=>'0'), (21 => '1', others => '0')after 10 ns, (others=>'0') after 25 ns; -- BusMuxIn_MDR (BUS)
			RegEnable_tb <= (others=>'0'), (5 => '1', others => '0')after 10 ns, (others=>'0') after 25 ns;	-- R5

---------------------------------------------------------------------------------------------

--T0 PCout, MARin, IncPC, Zin
--T1 Zlowout, PCin, Read, Mdatain[31..0], MDRin
--T2 MDRout, IRin
--T3 R2out, Yin
--T4 shiftright, Zin
--T5 Zlowout, R5in
---------------------------------------------------------------------------------------------
			
		when T0 =>
			encoderIn_tb <= (20 => '1', others => '0');	-- BusMuxIn_PC (BUS)
			RegEnable_tb <= (21 => '1', 23 => '1', others => '0');	-- MAR, Z_enable
			PC_plus_tb <= '1'; -- increment PC
			
		when T1 =>
			encoderIn_tb <= (19 => '1', others => '0'); -- BusMuxIn_Zlow (BUS)
			RegEnable_tb <= (18 => '1', 20 => '1', others => '0'); -- PC, MDR
			PC_plus_tb <= '0';
			MDR_read_tb <= '1';
			Mdatain_tb <= x"0A920000";	-- opcode for 'shiftleft R5, R2, R4' 
							--01001 0101 0010 010 0000 0000 0000 0000
							--01010 0101 0010 010 0000 0000 0000 0000
		when T2 =>
			MDR_read_tb <= '0';
			Mdatain_tb <= (others => '0');
			encoderIn_tb <= (21 => '1', others => '0');	-- BusMuxIn_MDR (BUS)
			RegEnable_tb <= (19 => '1', others => '0');	-- IR
			
		when T3 =>
			encoderIn_tb <= (2 => '1', others => '0');	-- R2 encoder input
			RegEnable_tb <= (22 => '1', others => '0');	-- RY
			
		when T4 =>
			encoderIn_tb <= (4 => '1', others => '0');	-- R4 encoder input
			alu_sel_tb <= "00101";	
			RegEnable_tb <= (23 => '1', others => '0');	-- RZ
			
		when T5 =>
			encoderIn_tb <= (19 => '1', others => '0');	-- Zlow encoder
			RegEnable_tb <= (5 => '1', 17=>'1', others => '0');	-- R5, LO
			
		when T6 =>
			encoderIn_tb <= (18 => '1', others => '0');	-- Zhigh encoder
			RegEnable_tb <= (16 => '1', others=>'0');	-- HI
		when others =>
	end case;
end process;
end architecture;
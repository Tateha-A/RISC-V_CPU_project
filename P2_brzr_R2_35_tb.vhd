library ieee;
use ieee.std_logic_1164.all;

entity P2_brzr_R2_35_tb is 
end;

architecture logic of P2_brzr_R2_35_tb is
signal clk_tb : std_logic;
signal clr_tb : std_logic;
signal IncPC_tb	: std_logic;
signal MDRRead_tb	: std_logic;
signal MDRWrite_tb : std_logic;
signal Baout_tb	: std_logic;
signal Gra_tb		: std_logic;
signal Grb_tb		: std_logic;
signal Grc_tb		: std_logic;
signal Rin_tb		: std_logic;
signal Rout_tb		: std_logic;
signal inport_tb	: std_logic_vector(31 downto 0);
signal outport_tb	: std_logic_vector(31 downto 0);
signal conffout_tb	: std_logic;
signal alu_sel_tb			: std_logic_vector(4 downto 0);
signal encoderIn_tb	: std_logic_vector(15 downto 0);
signal RegEnable_tb	: std_logic_vector(15 downto 0);
signal BusMuxOut_tb	: std_logic_vector(31 downto 0);
signal R0out_tb		: std_logic_vector(31 downto 0);
signal R1out_tb		: std_logic_vector(31 downto 0);
signal R2out_tb		: std_logic_vector(31 downto 0);
signal HIout_tb		: std_logic_vector(31 downto 0);
signal LOout_tb		: std_logic_vector(31 downto 0);
signal IRout_tb		: std_logic_vector(31 downto 0);
signal Zout_tb			: std_logic_vector(63 downto 0);
signal dIn_instruction_addr_tb : std_logic_vector(31 downto 0);
signal in_port_out_tb : std_logic_vector(31 downto 0);
signal PCout_tb : std_logic_vector (31 downto 0);
signal ram_pop_tb : std_logic_vector(31 downto 0);

type	state is(default, Reg_load1, Reg_load2, Reg_load3,Reg_load4, T0, T1, T1_5, T2, T3, T3_5, T4, T5, T6, T7);
signal	present_state: State := default;

component datapath
	PORT (
		clk: in std_logic;
		clr: in std_logic;
		PC_plus: in std_logic;
		encoder_31_16_In: in std_logic_vector(15 downto 0);
		reg_31_16_en: in std_logic_vector(15 downto 0);
		dInput	: in std_logic_vector(31 downto 0);
		MDR_read: in std_logic;
		MDR_write: in std_logic;
		baout: in std_logic;
		Gra: in std_logic;
		Grb: in std_logic;
		Grc: in std_logic;
		Rin: in std_logic;
		Rout:in std_logic;
		alu_sel: in std_logic_vector(4 downto 0);
		in_port: in std_logic_vector (31 downto 0);
		in_port_out: in std_logic_vector(31 downto 0);
		out_port: out std_logic_vector (31 downto 0);
		conff_out: out std_logic;
		BusMuxOut: out std_logic_vector(31 downto 0);
		R0out	: out std_logic_vector(31 downto 0);
		R1out	: out std_logic_vector(31 downto 0);
		R2out	: out std_logic_vector(31 downto 0);
		HIout	: out std_logic_vector(31 downto 0);
		LOout	: out std_logic_vector(31 downto 0);
		IRout	: out std_logic_vector(31 downto 0);
		PCout : out std_logic_vector (31 downto 0);
		ram_pop : out std_logic_vector(31 downto 0);
		Zout: out std_logic_vector(63 downto 0)
	);
end component;

begin
P2Test : datapath port map (
	clk_tb, 
	clr_tb,
	IncPC_tb,
	encoderIn_tb,
	RegEnable_tb,
	dIn_instruction_addr_tb,
	MDRRead_tb,
	MDRWrite_tb,
	Baout_tb,
	Gra_tb,
	Grb_tb, 
	Grc_tb,
	Rin_tb,
	Rout_tb,
	alu_sel_tb,
	inport_tb,
	in_port_out_tb,
	outport_tb,
	conffout_tb,
	BusMuxOut_tb,
	R0out_tb,
	R1out_tb,
	R2out_tb,
	HIout_tb,
	LOout_tb,
	IRout_tb,
	PCout_tb,
	ram_pop_tb,
	Zout_tb);

clk_process: process
begin
	clk_tb <= '1', '0' after 10 ns;--10
	wait for 20 ns;--20
end process clk_process;

process(clk_tb)
begin
	if(clk_tb'EVENT and clk_tb = '1') then
		case present_state is
			when default =>
				present_state <= Reg_load1;
			when Reg_load1 =>
				present_state <= Reg_load2;
			when Reg_load2 =>
				present_state <= Reg_load3;
			when Reg_load3 =>
				present_state <= T0;
			when T0 =>
				present_state <= T1;
			when T1 =>
				present_state <= T1_5;
			when T1_5 =>
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
			clr_tb <= '1';
			IncPC_tb <= '0';
			MDRRead_tb <= '0';
			MDRWrite_tb <= '0';
			Baout_tb <= '0';
			Gra_tb <= '0';
			Grb_tb <= '0';
			Grc_tb <= '0';
			Rin_tb <= '0';
			Rout_tb <= '0';
			inport_tb <= (others => '0');
			outport_tb <= (others => '0');
			alu_sel_tb <= (others => '0');
			encoderIn_tb <= (others => '0');
			RegEnable_tb <= (others => '0');
			
		when Reg_load1 =>
			dIn_instruction_addr_tb <= x"0000000B"; 
			RegEnable_tb <= (2  => '1', others => '0');-- pc enable 
			encoderIn_tb <= (8 => '1', others => '0'); 
			
		when Reg_load2 =>
			dIn_instruction_addr_tb <= x"01000000"; --R2
			RegEnable_tb <= (3  => '1', others => '0'); -- IR
			encoderIn_tb <= (8 => '1', others => '0');
			
		when Reg_load3 =>
			dIn_instruction_addr_tb <= x"00000000"; -- put a number in R2
			RegEnable_tb <= (others => '0');
			encoderIn_tb <= (8 => '1', others => '0');
			Rin_tb <= '1';
			Gra_tb <= '1';
			
		when T0 =>
			encoderIn_tb <= (4 => '1', others => '0');
			RegEnable_tb <= (5 => '1', 7 => '1', others => '0');
			IncPC_tb <= '1';
			Gra_tb <= '0';
			Rin_tb <= '0';
			
		when T1 =>
			encoderIn_tb <= (3 => '1', others => '0');
			RegEnable_tb <= (2 => '1', 4 => '1', others => '0');
			IncPC_tb <= '0';
			MDRRead_tb <= '1';
			
		when T1_5 =>
		when T2 =>
			MDRRead_tb <= '0';
			encoderIn_tb <= (5 => '1', others => '0');--MDRout
			RegEnable_tb <= (3 => '1', others => '0');--IR in
			
		when T3 =>
			Gra_tb <= '1';
			Rout_tb <= '1';
			encoderIn_tb <= (others => '0');
			RegEnable_tb <= (1=>'1', 10 => '1', others => '0'); -- conff enable 
--		when T3_5 =>
		when T4 =>
			Gra_tb <= '0';
			Rout_tb <= '0';
			encoderIn_tb <= (4 => '1', others => '0'); --PCout 
			RegEnable_tb <= (6 => '1', others => '0'); -- Yin 
			
		when T5=>
			encoderIn_tb <= (7 => '1', others => '0');-- Cout (take C extended as input)
			alu_sel_tb <= "00011"; -- in this case is add
			RegEnable_tb <= (7 => '1', others => '0');--Zin 
			
		when T6=>
			encoderIn_tb <= (3 => '1', others => '0');--Zlow 
			
			if(conffout_tb = '1') then
				RegEnable_tb <= (0 => '1', 2 => '1', others => '0');-- PC enable-- hi for testing 
			else 
				RegEnable_tb <= (others=>'0');
			end if;
		when others =>

	end case;
end process;
end architecture;
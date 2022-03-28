library ieee;
use ieee.std_logic_1164.all;

entity ldi_r0_35r1_tb is
end;

architecture logic of ldi_r0_35r1_tb is
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
signal in_port_out_tb : std_logic_vector(31 downto 0); --
signal PCout_tb : std_logic_vector (31 downto 0);--
signal ram_pop_tb : std_logic_vector(31 downto 0);--

type	state is(default, Reg_load1, load_buffer1, Reg_load2, Reg_load3, T0, T1, T1_5, T2, T3, T4, T5, T6, T7);
signal	present_state: State := default;

component datapath
	PORT (
		clk: in std_logic;
		clr: in std_logic;
		PC_plus: in std_logic;
		encoder_31_16_In: in std_logic_vector(15 downto 0); --
		reg_31_16_en: in std_logic_vector(15 downto 0); --
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
		in_port_out: in std_logic_vector(31 downto 0);--
		out_port: out std_logic_vector (31 downto 0);
		conff_out: out std_logic;
		BusMuxOut: out std_logic_vector(31 downto 0);
		R0out	: out std_logic_vector(31 downto 0);
		R1out	: out std_logic_vector(31 downto 0);
		R2out	: out std_logic_vector(31 downto 0);
		HIout	: out std_logic_vector(31 downto 0);
		LOout	: out std_logic_vector(31 downto 0);
		IRout	: out std_logic_vector(31 downto 0);
		PCout : out std_logic_vector (31 downto 0);--
		ram_pop : out std_logic_vector(31 downto 0);--
		Zout: out std_logic_vector(63 downto 0)
	);
end component;

--entity datapath is 
--	port (
--		clk: in std_logic;
--		clr: in std_logic;
--		PC_plus: in std_logic;
--		encoder_31_16_In: in std_logic_vector(15 downto 0); -- upper register (exclude general)
--		reg_31_16_en: in std_logic_vector(15 downto 0); -- upper register (exclude general)
--		dInput:  in std_logic_vector(31 downto 0);
--		MDR_read: in std_logic;
--		MDR_write: in std_logic;
--		BAout: in std_logic;
--		Gra: in std_logic;
--		Grb: in std_logic;
--		Grc: in std_logic;
--		Rin: in std_logic;
--		Rout: in std_logic;
--		alu_sel: in std_logic_vector(4 downto 0);
--		in_port: in std_logic_vector(31 downto 0);
--		in_port_out: in std_logic_vector(31 downto 0);--
--		out_port: out std_logic_vector(31 downto 0);
--		conff_out: out std_logic;
--		BusMuxOut: out std_logic_vector(31 downto 0);		
--		R0out	: out std_logic_vector(31 downto 0);
--		R1out	: out std_logic_vector(31 downto 0);
--		R2out	: out std_logic_vector(31 downto 0);
--		HIout	: out std_logic_vector (31 downto 0);
--		LOout : out std_logic_vector (31 downto 0);
--		IRout	: out std_logic_vector(31 downto 0);
--		PCout : out std_logic_vector (31 downto 0);--
--		ram_pop : out std_logic_vector(31 downto 0);--
--		Zout: out std_logic_vector(63 downto 0)
--);
--end entity;

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
	if(rising_edge (clk_tb)) then --
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
			conffout_tb <= '0';
			alu_sel_tb <= (others => '0');
			encoderIn_tb <= (others => '0');
			RegEnable_tb <= (others => '0');
			
		when Reg_load1 =>
			dIn_instruction_addr_tb <= x"00000001"; -- ldi R0, 35(R1)
			RegEnable_tb <= (2  => '1', others => '0');-- pc enable 
			encoderIn_tb <= (8 => '1', others => '0');
		when load_buffer1 =>
		when Reg_load2 =>
			dIn_instruction_addr_tb <= x"00800000";
			RegEnable_tb <= (3  => '1', others => '0'); -- IR enable
			encoderIn_tb <= (8 => '1', others => '0');
		when Reg_load3 =>
			-- put 1 in R1 for load immidiate
			dIn_instruction_addr_tb <= x"00000001";
			RegEnable_tb <= (others => '0');
			encoderIn_tb <= (8 => '1', others => '0');
			Rout_tb <= '0';
			Rin_tb <= '1';
			Gra_tb <= '1';
			
--T0 PCout, MARin, IncPC, Zin
--T1 Zlowout, PCin, Read, Mdatain[31..0], MDRin
--T2 MDRout, IRin
--T3 Grb, BAout, Yin
--T4 Cout, ADD, Zin
--T5 Zlowout, Gra, Rin

		when T0 =>
			Rin_tb <= '0';
			Gra_tb <= '0';
			encoderIn_tb <= (4 => '1', others => '0'); --PCout
			RegEnable_tb <= (5 => '1', 7 => '1', others => '0'); -- MAR/Z enable 
			IncPC_tb <= '1'; -- increment pc 
		when T1 =>
			encoderIn_tb <= (3 => '1', others => '0'); -- incremented pc in Zlow
			RegEnable_tb <= (2 => '1', 4 => '1', others => '0'); --PC/MDR  
			IncPC_tb <= '0';
			MDRRead_tb <= '1'; -- read instruction from the memory
		
		when T1_5 =>
			-- need an extra empty stage for sync ram to propogate data
			
		when T2 =>
			MDRRead_tb <= '0';
			encoderIn_tb <= (5 => '1', others => '0');--MDR out 
			RegEnable_tb <= (3 => '1', others => '0');-- IR (instruction OP code)
		when T3 =>
			Grb_tb <= '1';
			Baout_tb <= '1';
			encoderIn_tb <= (others => '0'); 
			RegEnable_tb <= (6 => '1', others => '0'); -- Yin
		when T4 =>
			Grb_tb <= '0';
			Baout_tb <= '0';
			encoderIn_tb <= (7 => '1', others => '0');-- Cout (input C_extended)
			alu_sel_tb <= "00011";
			RegEnable_tb <= (7 => '1', others => '0');--Zin (load the C+R0 in to Z)
		when T5 =>
			Gra_tb <= '1'; -- destination register
			Rin_tb <= '1';
			encoderIn_tb <= (3 => '1', others => '0');--Zlow
			RegEnable_tb <= (others=>'0');
		when others =>

	end case;
end process;
end architecture;
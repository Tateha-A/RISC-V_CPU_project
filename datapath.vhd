library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.componentLib.all;
use work.ram_initialization.all;

entity datapath is 
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
end entity;

--entity alu_path is
--	port(
--		clk: in;
--		clr: in; 
--		Y_enable: in; 
--		Z_enable: in;
--		Ain: in(31 downto 0);
--		Bin: in(31 downto 0);
--		PC_plus: in;
--		alu_sel: in(4 downto 0);
--		overflow: out;
--		Zlow: out(31 downto 0); --BusMuxIn_Zlow
--		Zhigh: out--BusMuxIn_Zhigh
--	);
--end entity alu_path;

architecture behavior of datapath is

signal BusMuxIn_R0: std_logic_vector(31 downto 0);
signal BusMuxIn_R1: std_logic_vector(31 downto 0);
signal BusMuxIn_R2: std_logic_vector(31 downto 0);
signal BusMuxIn_R3: std_logic_vector(31 downto 0);
signal BusMuxIn_R4: std_logic_vector(31 downto 0);
signal BusMuxIn_R5: std_logic_vector(31 downto 0);
signal BusMuxIn_R6: std_logic_vector(31 downto 0);
signal BusMuxIn_R7: std_logic_vector(31 downto 0);
signal BusMuxIn_R8: std_logic_vector(31 downto 0);
signal BusMuxIn_R9: std_logic_vector(31 downto 0);
signal BusMuxIn_R10: std_logic_vector(31 downto 0);
signal BusMuxIn_R11: std_logic_vector(31 downto 0);
signal BusMuxIn_R12: std_logic_vector(31 downto 0);
signal BusMuxIn_R13: std_logic_vector(31 downto 0);
signal BusMuxIn_R14: std_logic_vector(31 downto 0);
signal BusMuxIn_R15: std_logic_vector(31 downto 0);

signal BusMuxIn_HI: std_logic_vector(31 downto 0);
signal BusMuxIn_LO: std_logic_vector(31 downto 0);

signal BusMuxIn_Zhigh: std_logic_vector(31 downto 0);
signal BusMuxIn_Zlow: std_logic_vector(31 downto 0);

signal BusMuxIn_PC: std_logic_vector(31 downto 0);

signal BusMuxIn_MDR: std_logic_vector(31 downto 0);

signal BusMuxIn_Inport: std_logic_vector(31 downto 0);
signal C_sign_extended: std_logic_vector(31 downto 0);

signal internalBusMuxOut: std_logic_vector(31 downto 0);

signal clr: std_logic;
signal default_zeros: std_logic_vector(31 downto 0);
signal overflow: std_logic;
signal MARout: std_logic_vector(31 downto 0);
signal SIRout: std_logic_vector(31 downto 0);
signal register_enable: std_logic_vector(31 downto 0);
signal alu_sel	: std_logic_vector(4 downto 0);
signal PC_plus	: std_logic;

signal MDR_read: std_logic;
signal MDR_write: std_logic;
signal Mdatain: std_logic_vector(31 downto 0);
signal encoderIn: std_logic_vector(31 downto 0);

signal BAout: std_logic;
signal Gra: std_logic;
signal Grb: std_logic;
signal Grc: std_logic;
signal Rin: std_logic;
signal Rout	: std_logic;

signal conff_out: std_logic;
--signal ram_pop :  std_logic_vector(31 downto 0);
--signal mem_access: memory;



begin
	default_zeros <= (others =>'0');
--	clr <= '1';
--	encoderIn(31 downto 16) <= encoder_31_16_In;
--	register_enable(31 downto 16) <= reg_31_16_en;

	R0 : registerR0 port map (internalBusMuxOut, register_enable(0), clr, clk, BAout, BusMuxIn_R0);
	R1	: register32bit port map (clr, clk, register_enable(1), internalBusMuxOut, BusMuxIn_R1); 
	R2 : register32bit port map (clr, clk, register_enable(2), internalBusMuxOut, BusMuxIn_R2); 
	R3 : register32bit port map (clr, clk, register_enable(3), internalBusMuxOut, BusMuxIn_R3);
	R4 : register32bit port map (clr, clk, register_enable(4), internalBusMuxOut, BusMuxIn_R4);
	R5 : register32bit port map (clr, clk, register_enable(5), internalBusMuxOut, BusMuxIn_R5);
	R6 : register32bit port map (clr, clk, register_enable(6), internalBusMuxOut, BusMuxIn_R6);
	R7 : register32bit port map (clr, clk, register_enable(7), internalBusMuxOut, BusMuxIn_R7);
	R8 : register32bit port map (clr, clk, register_enable(8), internalBusMuxOut, BusMuxIn_R8);
	R9 : register32bit port map (clr, clk, register_enable(9), internalBusMuxOut, BusMuxIn_R9);
	R10: register32bit port map (clr, clk, register_enable(10), internalBusMuxOut, BusMuxIn_R10);
	R11: register32bit port map (clr, clk, register_enable(11), internalBusMuxOut, BusMuxIn_R11);
	R12: register32bit port map (clr, clk, register_enable(12), internalBusMuxOut, BusMuxIn_R12);
	R13: register32bit port map (clr, clk, register_enable(13), internalBusMuxOut, BusMuxIn_R13);
	R14: register32bit port map (clr, clk, register_enable(14), internalBusMuxOut, BusMuxIn_R14);
	R15: register32bit port map (clr, clk, register_enable(15), internalBusMuxOut, BusMuxIn_R15);
	---------------------------------------------------------------------------------------------
	HI : register32bit port map (clr, clk, register_enable(16), internalBusMuxOut, BusMuxIn_HI);
	LO : register32bit port map (clr, clk, register_enable(17), internalBusMuxOut, BusMuxIn_LO);
	PC : register32bit port map (clr, clk, register_enable(18), internalBusMuxOut, BusMuxIn_PC);
	IR	: register32bit port map (clr, clk, register_enable(19), internalBusMuxOut, SIRout);
	-- (MDMux_read, MDRinEnable, clr, clk,  from bus, from memory, data ouput Q)
	MDR_register: MDR port map (MDR_read, register_enable(20), clr, clk, internalBusMuxOut, Mdatain, BusMuxIn_MDR);
	MAR: register32bit port map (clr, clk, register_enable(21), internalBusMuxOut, MARout);

---------------------------------------------------------------------------------------------
	alu_datapath : alu_path port map(
		clk,
		clr,
		register_enable(22),
		register_enable(23),
		internalBusMuxOut,
		internalBusMuxOut,
		PC_plus,
		alu_sel,
		overflow,
		BusMuxIn_Zlow,
		BusMuxIn_Zhigh);
---------------------------------------------------------------------------------------------
	inport_register: register32bit port map (clr, clk, register_enable(24), in_port, BusMuxIn_Inport);
	outport_register: register32bit port map (clr, clk, register_enable(25), internalBusMuxOut, out_port);
	-- use of register_enable(25) to select and encode seven_seg_display
	sevenSegDiplay_port: Seven_Seg_Display port map (clk, register_enable(25), internalBusMuxOut, seven_segment_out);
---------------------------------------------------------------------------------------------
	conff: conff_logic port map (
								clk, 
								clr, 
								SIRout(20 downto 19), 
								internalBusMuxOut, 
								register_enable(26), 
								conff_out);--10 
---------------------------------------------------------------------------------------------
	select_and_encode: sel_and_encode port map (
													SIRout, 
													Gra, 
													Grb, 
													Grc, 
													Rin,
													Rout, 
													BAout, 
													C_sign_extended, 
													register_enable(15 downto 0), 
													encoderin(15 downto 0));
--	port (
--	IR_in: 	in std_logic_vector(31 downto 0);
--	Gra: 		in std_logic;
--	Grb: 		in std_logic;
--	Grc: 		in std_logic;
--	Rin: 		in std_logic;	-- in enable
--	Rout: 	in std_logic;	-- out enable
--	BAout: 	in std_logic;	-- base register
--	C_sign_extended: out std_logic_vector(31 downto 0);
--	R_in: 	out std_logic_vector(15 downto 0);
--	R_out: 	out std_logic_vector(15 downto 0));
---------------------------------------------------------------------------------------------
--Ram: RAM_sync_512x32 port map (
--								clk, 
--								BusMuxIn_MDR, 
--								MARout, 
--								MDR_write, 
--								MDR_read, 
--								Mdatain,
--								mem_access);

Ram: ram_function_512x32 port map(
									MARout(8 downto 0),
									clk,
									BusMuxIn_MDR,
									MDR_write,
									Mdatain);
									
--component ram_function_512x32 IS
--	PORT
--	(
--		address		: IN STD_LOGIC_VECTOR (8 DOWNTO 0);
--		clock		: IN STD_LOGIC  := '1';
--		data		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
--		wren		: IN STD_LOGIC ;
--		q		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
--	);
--END component ram_function_512x32;

---------------------------------------------------------------------------------------------

Control: control_unit port map 
								(
								clk, 
								reset, 
								stop, 
								SIRout, 
								conff_out, 
								Rin, 
								Rout, 
								Gra, 
								Grb, 
								Grc, 
								BAout, 
								encoderin(31 downto 16), 
								register_enable(31 downto 16),
								PC_plus,
								MDR_read, 
								MDR_write, 
								run,
								clr, 
								alu_sel);

--component control_unit is 
--port
--(
--	clk: in std_logic;
--	reset: in std_logic;
--	stop: in std_logic;
--	IR: in std_logic_vector (31 downto 0);
--	con_ff: in std_logic; 
--	Rin: out std_logic;
--	Rout: out std_logic; 
--	Gra: out std_logic;
--	Grb: out std_logic;
--	Grc: out std_logic;
--	BAout: out std_logic;
--	encoder_in: out std_logic_vector (15 downto 0);
--	register_enable: out std_logic_vector (15 downto 0);
--	IncPC: out std_logic;
--	MDR_read: out std_logic;
--	MDR_write: out std_logic;
--	run: out std_logic;
--	clear: out std_logic;
--	OP_code: out std_logic_vector (4 downto 0) -- for alu selection
--);
--end component control_unit;
	
	datapathBus : P1_bus port map	(
				BusMuxIn_R0,	--0
				BusMuxIn_R1,	--1
				BusMuxIn_R2,	--2
				BusMuxIn_R3,	--3
				BusMuxIn_R4,	--4
				BusMuxIn_R5,	--5
				BusMuxIn_R6,	--6
				BusMuxIn_R7,	--7
				BusMuxIn_R8,	--8
				BusMuxIn_R9,	--9
				BusMuxIn_R10, 	--10
				BusMuxIn_R11,	--11
				BusMuxIn_R12,	--12
				BusMuxIn_R13,	--13
				BusMuxIn_R14,	--14
				BusMuxIn_R15,	--15
				BusMuxIn_HI,	--16 --0
				BusMuxIn_LO, 	--17 --1
				BusMuxIn_Zhigh,	--18 --2
				BusMuxIn_Zlow,	--19 --3
				BusMuxIn_PC,	--20 --4
				BusMuxIn_MDR,	--21 --5
				BusMuxIn_Inport,	--22 --6
				C_sign_extended, 	--23 --7
				default_zeros, 	--24 --8
				default_zeros,		--25
				default_zeros,		--26
				default_zeros,		--27
				default_zeros, 	--28
				default_zeros,		--29
				default_zeros,		--30
				default_zeros,		--31
				encoderIn,			--encoder32In, BusMuxOut
				internalBusMuxOut);

				
	--port output assignment
	R0out <= BusMuxIn_R0;
	R1out <= BusMuxIn_R1;
	R2out <= BusMuxIn_R2;
	R3out <= BusMuxIn_R3;
	R4out <= BusMuxIn_R4;
	R5out <= BusMuxIn_R5;
	R6out <= BusMuxIn_R6;
	R7out <= BusMuxIn_R7;
	R8out <= BusMuxIn_R8;
	R9out <= BusMuxIn_R9;
	R10out <= BusMuxIn_R10;
	R11out <= BusMuxIn_R11;
	R12out <= BusMuxIn_R12;
	R13out <= BusMuxIn_R13;
	R14out <= BusMuxIn_R14;
	R15out <= BusMuxIn_R15;
	
	MAR_out <= MARout;
	MDR_out <= BusMuxIn_MDR;
	
	PCout <= BusMuxIn_PC;
	HIout <= BusMuxIn_HI;
	LOout <= BusMuxIn_LO;
	IRout <= SIRout;
	
	Zout(63 downto 32) <= BusMuxIn_Zhigh;
	Zout(31 downto 0) <= BusMuxIn_Zlow;
	ram_pop <= Mdatain;
	BusMuxOut <= internalBusMuxOut;

end architecture behavior;
library ieee;
use ieee.std_logic_1164.all;
use work.ram_initialization.all;

package componentLib is

--------------------------------------------------

component register32bit is
  port (
    clr     : in std_logic;
	 clk		: in std_logic;
    R1in      : in std_logic; -- write/enable ld
    BusMuxOut       : in std_logic_vector(31 downto 0); -- input D
    BusMuxIn       : out std_logic_vector(31 downto 0) -- output Q
  );
end component register32bit;

--------------------------------------------------

component encoder32to5 is 
	port(
		input : in std_logic_vector(31 downto 0);
		output: out std_logic_vector(4 downto 0)
	);
end component encoder32to5;

--------------------------------------------------

component booth_alu is 
	generic (
		base_bit : integer := 32
		);
		
	port(
		mutiplicant : in std_logic_vector(31 downto 0);
		multiplier : in std_logic_vector(31 downto 0);
		result : out std_logic_vector(63 downto 0)
	);
end component booth_alu;

--------------------------------------------------

component MDR is 
	port(
		MDMux_read: in std_logic; 
		MDRin: in std_logic; -- enable
		clr: in std_logic;
		clk: in std_logic;
		MDR_BusMuxOut: in std_logic_vector(31 downto 0);  -- from bus
		MDR_Mdatain: in std_logic_vector(31 downto 0); -- from memory 
		MDR_out: out std_logic_vector(31 downto 0) -- data ouput Q
	);
end component MDR;

--------------------------------------------------

component shiftleft32 is
	port(
		data : in std_logic_vector(31 downto 0);	
		interval : in std_logic_vector(31 downto 0);	
		output : out std_logic_vector(31 downto 0)
	);
end component shiftleft32;

--------------------------------------------------

component shiftright32 is
	port(
		data : in std_logic_vector(31 downto 0);	
		interval : in std_logic_vector(31 downto 0);	
		output : out std_logic_vector(31 downto 0)
	);
end component shiftright32;

--------------------------------------------------

component negate32 is
	port(
		data: in std_logic_vector(31 downto 0);
		output : out std_logic_vector(31 downto 0)	
	);
end component negate32;

--------------------------------------------------

component not32 is
	port(
		data: in std_logic_vector(31 downto 0);
		output : out std_logic_vector(31 downto 0)	
	);
end component not32;

--------------------------------------------------

component or32 is
	port(
		data0: in std_logic_vector(31 downto 0);
		data1: in std_logic_vector(31 downto 0);
		output : out std_logic_vector(31 downto 0)
	);
end component or32;

--------------------------------------------------

component and32 is
	port(
		data0: in std_logic_vector(31 downto 0);
		data1: in std_logic_vector(31 downto 0);
		output : out std_logic_vector(31 downto 0)	
	);
end component and32;

--------------------------------------------------

component rotateleft32 is
	port(
		data : in std_logic_vector(31 downto 0);	
		interval : in std_logic_vector(31 downto 0);	
		output : out std_logic_vector(31 downto 0)
	);
end component rotateleft32;

--------------------------------------------------

component rotateright32 is
	port(
		data : in std_logic_vector(31 downto 0);	
		interval : in std_logic_vector(31 downto 0);	
		output : out std_logic_vector(31 downto 0)
	);
end component rotateright32;

--------------------------------------------------

component register64bit is
  port (
    clr     : in std_logic;
	 clk		: in std_logic;
    R1in      : in std_logic; -- write/enable ld
    BusMuxOut       : in std_logic_vector(63 downto 0); -- input D
    BusMuxIn0       : out std_logic_vector(31 downto 0); -- output Q0
	 BusMuxIn1       : out std_logic_vector(31 downto 0) -- output Q1
  );
end component register64bit;

--------------------------------------------------

component P1_bus is 
	port (
		muxIn0		: in std_logic_vector (31 downto 0);
		muxIn1		: in std_logic_vector (31 downto 0);
		muxIn2		: in std_logic_vector (31 downto 0);
		muxIn3		: in std_logic_vector (31 downto 0);
		muxIn4		: in std_logic_vector (31 downto 0);
		muxIn5		: in std_logic_vector (31 downto 0);
		muxIn6		: in std_logic_vector (31 downto 0);
		muxIn7		: in std_logic_vector (31 downto 0);
		muxIn8		: in std_logic_vector (31 downto 0);
		muxIn9		: in std_logic_vector (31 downto 0);
		muxIn10		: in std_logic_vector (31 downto 0);
		muxIn11		: in std_logic_vector (31 downto 0);
		muxIn12		: in std_logic_vector (31 downto 0);
		muxIn13		: in std_logic_vector (31 downto 0);
		muxIn14		: in std_logic_vector (31 downto 0);
		muxIn15		: in std_logic_vector (31 downto 0);
		muxIn16		: in std_logic_vector (31 downto 0);
		muxIn17		: in std_logic_vector (31 downto 0);
		muxIn18		: in std_logic_vector (31 downto 0);
		muxIn19		: in std_logic_vector (31 downto 0);
		muxIn20		: in std_logic_vector (31 downto 0);
		muxIn21		: in std_logic_vector (31 downto 0);
		muxIn22		: in std_logic_vector (31 downto 0);
		muxIn23		: in std_logic_vector (31 downto 0);
		muxIn24		: in std_logic_vector (31 downto 0);
		muxIn25		: in std_logic_vector (31 downto 0);
		muxIn26		: in std_logic_vector (31 downto 0);
		muxIn27		: in std_logic_vector (31 downto 0);
		muxIn28		: in std_logic_vector (31 downto 0);
		muxIn29		: in std_logic_vector (31 downto 0);
		muxIn30		: in std_logic_vector (31 downto 0);
		muxIn31		: in std_logic_vector (31 downto 0);
		
		encoder32In	: in std_logic_vector(31 downto 0);
		
		BusMuxOut	: out std_logic_vector(31 downto 0)
);
end component P1_bus;

--------------------------------------------------

component mux32to1 is
	port(
		data0in		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		data1in		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		data2in		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		data3in		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		data4in		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		data5in		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		data6in		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		data7in		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		data8in		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		data9in		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		data10in		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		data11in		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		data12in		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		data13in		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		data14in		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		data15in		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		data16in		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		data17in		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		data18in		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		data19in		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		data20in		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		data21in		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		data22in		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		data23in		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		data24in		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		data25in		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		data26in		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		data27in		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		data28in		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		data29in		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		data30in		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		data31in		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);

		sel		: IN STD_LOGIC_VECTOR (4 DOWNTO 0);
		
		result		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
end component mux32to1;

--------------------------------------------------
component lpm_add_sub0 IS
	PORT
	(
		add_sub		: IN STD_LOGIC ;
		dataa		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		datab		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		overflow		: OUT STD_LOGIC ;
		result		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
END component lpm_add_sub0;
--------------------------------------------------
component lpm_divide0 IS
	PORT
	(
		denom		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		numer		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		quotient		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
		remain		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
END component lpm_divide0;
--------------------------------------------------

component alu is 
	port(
		A : in std_logic_vector(31 downto 0);	
		B : in std_logic_vector(31 downto 0);	
		alu_sel : in std_logic_vector(4 downto 0);
		overflow : out std_logic;	
		C : out std_logic_vector(63 downto 0)	
	);
end component alu; 

--------------------------------------------------

component alu_path is
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
end component alu_path;

--------------------------------------------------
component registerR0 is 
port(
	BusMuxOutR0:	in std_logic_vector (31 downto 0);
	R0in: 			in std_logic;
	clr: 				in std_logic;
	clk: 				in std_logic;
	BAout: 			in std_logic;
	BusMuxInR0 : 	out std_logic_vector (31 downto 0));
end component registerR0;
--------------------------------------------------

component RAM_sync_512x32 is 
port(
		clk	: in std_logic;
      data	: in std_logic_vector(31 downto 0);
      address	: in std_logic_vector(31 downto 0);
      wren	: in std_logic;
		rden	: in std_logic;
      q		: out std_logic_vector(31 downto 0);
		mem_out: out memory
);
end component RAM_sync_512x32;
--------------------------------------------------

component sel_and_encode is 
port (
	IR_in: 	in std_logic_vector(31 downto 0);
	Gra: 		in std_logic;
	Grb: 		in std_logic;
	Grc: 		in std_logic;
	Rin: 		in std_logic;	-- in enable
	Rout: 	in std_logic;	-- out enable
	BAout: 	in std_logic;	-- base register
	C_sign_extended: out std_logic_vector(31 downto 0);
	R_in: 	out std_logic_vector(15 downto 0);
	R_out: 	out std_logic_vector(15 downto 0));
end component sel_and_encode;

--------------------------------------------------

component conff_logic is 
port (
	clk:	 	in std_logic;
	clr:	 	in std_logic;
	C2: 		in std_logic_vector(1 downto 0);	-- only first 2 bits
	BusMuxIn: in std_logic_vector(31 downto 0);
	Con_in:	in std_logic;
	Q: 		out std_logic);
end component conff_logic;

--------------------------------------------------

component ram_function_512x32 IS
	PORT
	(
		address		: IN STD_LOGIC_VECTOR (8 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		wren		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
END component ram_function_512x32;

--------------------------------------------------

component control_unit is 
port
(
	clk: in std_logic;
	reset: in std_logic;
	stop: in std_logic;
	
	IR: in std_logic_vector (31 downto 0);
	
	con_ff: in std_logic; 
	
	Rin: out std_logic;
	Rout: out std_logic; 
	Gra: out std_logic;
	Grb: out std_logic;
	Grc: out std_logic;
	BAout: out std_logic;
	
	encoder_in: out std_logic_vector (15 downto 0);
	register_enable: out std_logic_vector (15 downto 0);
	
	IncPC: out std_logic;
	MDR_read: out std_logic;
	MDR_write: out std_logic;
	
	run: out std_logic;
	clear: out std_logic;
	OP_code: out std_logic_vector (4 downto 0) -- for alu selection
);
end component control_unit;

--------------------------------------------------

component Seven_Seg_Display IS
PORT 
	(clk: IN STD_LOGIC;
	outport_enable: in std_logic;
	 inputData: IN STD_LOGIC_VECTOR(31 DOWNTO 0); -- 4 digits 16 bits used -- 4 * 8 => 32 bits out
	 outputSegment: OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
END component Seven_Seg_Display;

--------------------------------------------------

end package;
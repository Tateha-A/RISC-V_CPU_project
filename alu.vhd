library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.componentLib.all;

entity alu is 
	port(
		A : in std_logic_vector(31 downto 0);	
		B : in std_logic_vector(31 downto 0);	
		alu_sel : in std_logic_vector(4 downto 0);
		overflow : out std_logic;	
		C : out std_logic_vector(63 downto 0)	
	);
end entity alu; 


architecture behavior of alu is 
	signal boothout: std_logic_vector(63 downto 0);
	signal divout: std_logic_vector(63 downto 0);
	
	signal addorsub: std_logic;
	signal addsuboverflow: std_logic;
	signal addsubout: std_logic_vector(31 downto 0);
	
	signal rorout:std_logic_vector(31 downto 0);
	signal rolout:std_logic_vector(31 downto 0);
	signal shrout: std_logic_vector(31 downto 0);
	signal shlout: std_logic_vector(31 downto 0);
	signal negout: std_logic_vector(31 downto 0);
	signal notout: std_logic_vector(31 downto 0);
	signal orout: std_logic_vector(31 downto 0);
	signal andout: std_logic_vector(31 downto 0);

	begin
	
	aluMul: booth_alu port map (A, B, boothout);
	aluDiv: lpm_divide0 port map(B, A, divout(31 downto 0), divout(63 downto 32));
	aluAddSub: lpm_add_sub0 port map (addorsub, A, B, addsuboverflow, addsubout);
	aluShl: shiftleft32 port map (A, B, shlout);
	aluShr: shiftright32 port map (A, B, shrout);
	aluNeg: negate32 port map(B, negout);
	aluNot: not32 port map(B, notout);
	aluOr: or32 port map(A, B, orout);
	aluAnd: and32 port map(A, B, andout);
	aluRol: rotateleft32 port map (A, B, rolout); --40
	aluRor: rotateright32 port map (A, B, rorout); --40
	

	process(A, B, alu_sel, boothout, divout, addorsub, addsuboverflow, addsubout,
	shlout, shrout, negout, notout, orout, andout, rolout, rorout) is

	begin
		addorsub <= '0';
		overflow <= '0';
			
		if (alu_sel ="00011") then -- add
			addorsub <= '1';
			C(31 downto 0) <= addsubout;
			C(63 downto 32) <= (others => '0');
			overflow <= addsuboverflow;
			
		elsif (alu_sel ="00100") then --sub
			addorsub <= '0';
			C(31 downto 0) <= addsubout;
			C(63 downto 32) <= (others => '0');
			overflow <= addsuboverflow;
			
		elsif (alu_sel = "00110") then --shift left
			C(31 downto 0)<= shlout;
			C(63 downto 32)<=(others=>'0');
			
		elsif (alu_sel = "00101") then --shift right
			C(31 downto 0)<= shrout;
			C(63 downto 32)<=(others=>'0');
			
		elsif (alu_sel = "00111") then --rotate right
			C(31 downto 0)<= rorout;
			C(63 downto 32)<=(others=>'0');
			
		elsif (alu_sel = "01000") then --rotate left
			C(31 downto 0)<= rolout;
			C(63 downto 32)<=(others=>'0');
			
		elsif(alu_sel = "01001")then --and
			C(31 downto 0)<= andout;
			C(63 downto 32)<=(others=>'0');
			
		elsif (alu_sel = "01010") then --or
			C(31 downto 0)<= orout;
			C(63 downto 32)<=(others=>'0');
			
		elsif (alu_sel = "10001") then --not
			C(31 downto 0)<= notout;
			C(63 downto 32)<=(others=>'0');
			
		elsif (alu_sel = "01110") then --multiply
			C <= boothout;
			
		elsif (alu_sel = "01111") then --divide
			C <= divout;
			
		elsif (alu_sel = "10000") then --negate
			C(31 downto 0)<= negout;
			C(63 downto 32)<=(others=>'0');
			
		elsif (alu_sel = "10000") then --not
			C(31 downto 0)<= notout;
			C(63 downto 32)<=(others=>'0');

		else
			C <= (others=>'0');
			
		end if;
	end process;
end architecture behavior;
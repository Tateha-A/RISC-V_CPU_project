library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sel_and_encode is 
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
end entity sel_and_encode;

architecture logic of sel_and_encode is
-- register
signal a, b, c : std_logic_vector(3 downto 0);
signal decoder_in: std_logic_vector (3 downto 0);
signal decoder_out: std_logic_vector (15 downto 0);

begin

	a(3)<= IR_in(26) and Gra;
	a(2)<= IR_in(25) and Gra;
	a(1)<= IR_in(24) and Gra;
	a(0)<= IR_in(23) and Gra;

	b(3)<= IR_in(22) and Grb;
	b(2)<= IR_in(21) and Grb;
	b(1)<= IR_in(20) and Grb;
	b(0)<= IR_in(19) and Grb;

	c(3)<= IR_in(18) and Grc;
	c(2)<= IR_in(17) and Grc;
	c(1)<= IR_in(16) and Grc;
	c(0)<= IR_in(15) and Grc;

	decoder_in(3)<= a(3) or b(3) or c(3);
	decoder_in(2)<= a(2) or b(2) or c(2);
	decoder_in(1)<= a(1) or b(1) or c(1);
	decoder_in(0)<= a(0) or b(0) or c(0);

	with decoder_in select 
	decoder_out <= "0000000000000001" when "0000",
						"0000000000000010" when "0001", 
						"0000000000000100" when "0010",
						"0000000000001000" when "0011",
						"0000000000010000" when "0100",
						"0000000000100000" when "0101",
						"0000000001000000" when "0110",
						"0000000010000000" when "0111",
						"0000000100000000" when "1000",
						"0000001000000000" when "1001",
						"0000010000000000" when "1010",
						"0000100000000000" when "1011",
						"0001000000000000" when "1100",
						"0010000000000000" when "1101", 
						"0100000000000000" when "1110",
						"1000000000000000" when others; 

	R_in(15) <= Rin and decoder_out(15);
	R_in(14) <= Rin and decoder_out(14);
	R_in(13) <= Rin and decoder_out(13);
	R_in(12) <= Rin and decoder_out(12);
	R_in(11) <= Rin and decoder_out(11);
	R_in(10) <= Rin and decoder_out(10);
	R_in(9) <= Rin and decoder_out(9);
	R_in(8) <= Rin and decoder_out(8);
	R_in(7) <= Rin and decoder_out(7);
	R_in(6) <= Rin and decoder_out(6);
	R_in(5) <= Rin and decoder_out(5);
	R_in(4) <= Rin and decoder_out(4);
	R_in(3) <= Rin and decoder_out(3);
	R_in(2) <= Rin and decoder_out(2);
	R_in(1) <= Rin and decoder_out(1);
	R_in(0) <= Rin and decoder_out(0);

	R_out(15) <= decoder_out(15) and (Rout or BAout);
	R_out(14) <= decoder_out(14) and (Rout or BAout);
	R_out(13) <= decoder_out(13) and (Rout or BAout);
	R_out(12) <= decoder_out(12) and (Rout or BAout);
	R_out(11) <= decoder_out(11) and (Rout or BAout);
	R_out(10) <= decoder_out(10) and (Rout or BAout);
	R_out(9) <= decoder_out(9) and (Rout or BAout);
	R_out(8) <= decoder_out(8) and (Rout or BAout);
	R_out(7) <= decoder_out(7) and (Rout or BAout);
	R_out(6) <= decoder_out(6) and (Rout or BAout);
	R_out(5) <= decoder_out(5) and (Rout or BAout);
	R_out(4) <= decoder_out(4) and (Rout or BAout);
	R_out(3) <= decoder_out(3) and (Rout or BAout);
	R_out(2) <= decoder_out(2) and (Rout or BAout);
	R_out(1) <= decoder_out(1) and (Rout or BAout);
	R_out(0) <= decoder_out(0) and (Rout or BAout);

	C_sign_extended <= std_logic_vector(resize(signed(IR_in(18 downto 0)), C_sign_extended'length));

end architecture logic;
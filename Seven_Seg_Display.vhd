LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.componentLib.all;

ENTITY Seven_Seg_Display IS
PORT 
	(clk: IN STD_LOGIC;
	outport_enable: in std_logic;
	inputData: IN STD_LOGIC_VECTOR(31 DOWNTO 0); -- 4 digits 16 bits used -- 4 * 8 => 32 bits out
	outputSegment: OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
END ENTITY;


ARCHITECTURE Behavior of Seven_Seg_Display IS

function singleDigit(signal singleHex: in STD_LOGIC_VECTOR(3 DOWNTO 0))
    return std_logic_vector is
    variable seven_seg_out : std_logic_vector(7 downto 0);
BEGIN
	CASE singleHex(3 DOWNTO 0) IS
	WHEN "0000" =>
		seven_seg_out := "11000000";
	WHEN "0001" =>
		seven_seg_out := "11111001";
	WHEN "0010" =>
		seven_seg_out := "10100100";
	WHEN "0011" =>
		seven_seg_out := "10110000";
	WHEN "0100" =>
		seven_seg_out := "10011001";
	WHEN "0101" =>
		seven_seg_out := "10010010";
	WHEN "0110" =>
		seven_seg_out := "10000010";
	WHEN "0111" =>
		seven_seg_out := "11111000";
	WHEN "1000" =>
		seven_seg_out := "10000000";
	WHEN "1001" =>
		seven_seg_out := "10010000";
	WHEN "1010" =>
		seven_seg_out := "10001000";
	WHEN "1011" =>
		seven_seg_out := "10000011";
	WHEN "1100" =>
		seven_seg_out := "11000110";
	WHEN "1101" =>
		seven_seg_out := "10100001";
	WHEN "1110" =>
		seven_seg_out := "10000110";
	WHEN "1111" =>
		seven_seg_out := "10001110";
	WHEN OTHERS =>
		seven_seg_out := "11111111";
	END CASE;
	return std_logic_vector(seven_seg_out);
END singleDigit;

BEGIN
	PROCESS (clk, outport_enable)
		BEGIN
		 IF (falling_edge(clk)) THEN
			if (outport_enable = '1') then
				outputSegment(7 downto 0) <= singleDigit(inputData(3 downto 0));
				outputSegment(15 downto 8) <= singleDigit(inputData(7 downto 4));
				outputSegment(23 downto 16) <= singleDigit(inputData(11 downto 8));
				outputSegment(31 downto 24) <= singleDigit(inputData(15 downto 12));
			end if;
		 END IF;
	END PROCESS;
END Behavior;
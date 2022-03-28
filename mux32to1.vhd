library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity mux32to1 is
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
end mux32to1;


architecture behavior of mux32to1 is
  -- declarative part: empty
begin
  with sel select
    result <=	 data0in when "00000",
					 data1in when "00001",
					 data2in when "00010",
					 data3in when "00011",
					 data4in when "00100",
					 data5in when "00101",
					 data6in when "00110",
					 data7in when "00111",
					 data8in when "01000",
					 data9in when "01001",
					data10in when "01010",
					data11in when "01011",
					data12in when "01100",
					data13in when "01101",
					data14in when "01110",
					data15in when "01111",
					data16in when "10000",
					data17in when "10001",
					data18in when "10010",
					data19in when "10011",
					data20in when "10100",
					data21in when "10101",
					data22in when "10110",
					data23in when "10111",
					data24in when "11000",
					data25in when "11001",
					data26in when "11010",
					data27in when "11011",
					data28in when "11100",
					data29in when "11101",
					data30in when "11110",
					 
					data31in when others;
end architecture;
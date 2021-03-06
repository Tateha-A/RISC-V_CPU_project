Library ieee;
Use ieee.std_logic_1164.ALL;
Use ieee.std_logic_arith.ALL;
Use ieee.std_logic_unsigned.ALL;

entity register64bit is
  port (
    clr     : in std_logic;
	 clk		: in std_logic;
    R1in      : in std_logic; -- write/enable ld
    BusMuxOut       : in std_logic_vector(63 downto 0); -- input D
    BusMuxIn0       : out std_logic_vector(31 downto 0); -- output Q0
	 BusMuxIn1       : out std_logic_vector(31 downto 0) -- output Q1
  );
end entity;

-- ------------------------------------------------------

architecture behavior of register64bit is
begin
  process (clk, clr)
    begin
      if (clr = '0') then
        BusMuxIn0 <= (others => '0');
		  BusMuxIn1 <= (others => '0');
      elsif (rising_edge(clk)) then
        if (R1in = '1') then
          BusMuxIn0 <= BusMuxOut(31 downto 0);
				BusMuxIn1 <= BusMuxOut(63 downto 32);
        end if;
      end if;
    end process;
end architecture;
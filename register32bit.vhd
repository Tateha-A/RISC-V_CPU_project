Library ieee;
Use ieee.std_logic_1164.ALL;
Use ieee.std_logic_arith.ALL;
Use ieee.std_logic_unsigned.ALL;

entity register32bit is
  port (
    clr     : in std_logic;
	 clk		: in std_logic;
    R1in      : in std_logic; -- write/enable ld
    BusMuxOut       : in std_logic_vector(31 downto 0); -- input D
    BusMuxIn       : out std_logic_vector(31 downto 0) -- output Q
  );
end entity;

-- ------------------------------------------------------

architecture behavior of register32bit is
begin
  process (clk, clr)
    begin
      if (clr = '0') then
        BusMuxIn <= (others => '0');
      elsif (rising_edge(clk)) then
        if (R1in = '1') then
          BusMuxIn <= BusMuxOut;
        end if;
      end if;
    end process;  
end architecture;
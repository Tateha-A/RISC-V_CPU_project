library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.componentLib.all;
use work.ram_initialization.all;

-- the module is an async design
-- sync RAM is 'ram_function_512x32' by megafunction
entity RAM_sync_512x32 is
port(
		clk	: in std_logic;
      data	: in std_logic_vector(31 downto 0);
      address	: in std_logic_vector(31 downto 0);
      wren	: in std_logic;
		rden	: in std_logic;
      q		: out std_logic_vector(31 downto 0);
		mem_out:	out memory);
end entity RAM_sync_512x32;

architecture logic of RAM_sync_512x32 is
-- type memory is array (0 to 511) of std_logic_vector(31 downto 0);

signal ram_cell : memory := initial_mem;

-- 

--attribute ram_init_file : string;
--attribute ram_init_file of ram_cell : signal is "phase2_ram_init.mif";

begin
	process (wren, rden, address, data)
	begin
		q <= (others => '0');
		mem_out <= ram_cell;
		-- write
		if wren = '1' then
			ram_cell(to_integer(unsigned(address))) <= data;
		-- read
		elsif rden = '1' then
			q <= ram_cell(to_integer(unsigned(address)));
		end if;
	end process;

end architecture logic;
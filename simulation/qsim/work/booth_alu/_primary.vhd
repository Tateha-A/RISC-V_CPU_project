library verilog;
use verilog.vl_types.all;
entity booth_alu is
    port(
        mutiplicant     : in     vl_logic_vector(31 downto 0);
        multiplier      : in     vl_logic_vector(31 downto 0);
        result          : out    vl_logic_vector(63 downto 0)
    );
end booth_alu;

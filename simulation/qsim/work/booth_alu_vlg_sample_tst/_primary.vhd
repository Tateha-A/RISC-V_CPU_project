library verilog;
use verilog.vl_types.all;
entity booth_alu_vlg_sample_tst is
    port(
        multiplier      : in     vl_logic_vector(31 downto 0);
        mutiplicant     : in     vl_logic_vector(31 downto 0);
        sampler_tx      : out    vl_logic
    );
end booth_alu_vlg_sample_tst;

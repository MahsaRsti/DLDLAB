library verilog;
use verilog.vl_types.all;
entity full_wave is
    port(
        sine            : in     vl_logic_vector(7 downto 0);
        full_wave_out   : out    vl_logic_vector(7 downto 0)
    );
end full_wave;

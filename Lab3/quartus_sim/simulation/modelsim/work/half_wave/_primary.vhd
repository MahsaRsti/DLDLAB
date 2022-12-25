library verilog;
use verilog.vl_types.all;
entity half_wave is
    port(
        sine            : in     vl_logic_vector(7 downto 0);
        half_wave_out   : out    vl_logic_vector(7 downto 0)
    );
end half_wave;

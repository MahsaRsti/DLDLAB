library verilog;
use verilog.vl_types.all;
entity Amplitude_selector is
    port(
        amp_sel         : in     vl_logic_vector(1 downto 0);
        amp_in          : in     vl_logic_vector(7 downto 0);
        amp_out         : out    vl_logic_vector(7 downto 0)
    );
end Amplitude_selector;

library verilog;
use verilog.vl_types.all;
entity Frequency_selector is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        ld_value        : in     vl_logic_vector(2 downto 0);
        freq_out        : out    vl_logic
    );
end Frequency_selector;

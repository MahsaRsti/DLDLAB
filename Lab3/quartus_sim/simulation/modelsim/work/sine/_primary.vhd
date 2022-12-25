library verilog;
use verilog.vl_types.all;
entity sine is
    port(
        ld_reg          : in     vl_logic;
        rst             : in     vl_logic;
        clk             : in     vl_logic;
        sine_out_offset : out    vl_logic_vector(7 downto 0)
    );
end sine;

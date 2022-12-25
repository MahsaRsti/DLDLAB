library verilog;
use verilog.vl_types.all;
entity wave_gen_core is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        sel_func        : in     vl_logic_vector(2 downto 0);
        phase_cntrl     : in     vl_logic_vector(1 downto 0);
        \out\           : out    vl_logic_vector(7 downto 0)
    );
end wave_gen_core;

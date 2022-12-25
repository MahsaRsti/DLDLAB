library verilog;
use verilog.vl_types.all;
entity DDS is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        ld_reg          : in     vl_logic;
        phase_cntrl     : in     vl_logic_vector(1 downto 0);
        DDS_out         : out    vl_logic_vector(7 downto 0)
    );
end DDS;

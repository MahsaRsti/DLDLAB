library verilog;
use verilog.vl_types.all;
entity quartus_sim is
    port(
        DAC_out         : out    vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        SW              : in     vl_logic_vector(9 downto 0);
        amp             : out    vl_logic_vector(7 downto 0);
        wave            : out    vl_logic_vector(7 downto 0)
    );
end quartus_sim;

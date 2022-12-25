library verilog;
use verilog.vl_types.all;
entity Reciprocal is
    port(
        clk             : in     vl_logic;
        cnt             : in     vl_logic_vector(7 downto 0);
        reciprocal_out  : out    vl_logic_vector(7 downto 0)
    );
end Reciprocal;

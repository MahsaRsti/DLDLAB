library verilog;
use verilog.vl_types.all;
entity triangle is
    port(
        clk             : in     vl_logic;
        cnt             : in     vl_logic_vector(7 downto 0);
        triangle_out    : out    vl_logic_vector(7 downto 0)
    );
end triangle;

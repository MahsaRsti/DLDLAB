library verilog;
use verilog.vl_types.all;
entity square is
    port(
        clk             : in     vl_logic;
        cnt             : in     vl_logic_vector(7 downto 0);
        square_out      : out    vl_logic_vector(7 downto 0)
    );
end square;

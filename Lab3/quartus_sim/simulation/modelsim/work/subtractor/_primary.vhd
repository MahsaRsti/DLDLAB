library verilog;
use verilog.vl_types.all;
entity subtractor is
    port(
        a               : in     vl_logic_vector(15 downto 0);
        b               : in     vl_logic_vector(15 downto 0);
        res             : out    vl_logic_vector(15 downto 0)
    );
end subtractor;

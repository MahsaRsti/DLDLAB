library verilog;
use verilog.vl_types.all;
entity \Register\ is
    generic(
        n               : integer := 16
    );
    port(
        d_in            : in     vl_logic_vector;
        rst             : in     vl_logic;
        ld              : in     vl_logic;
        clk             : in     vl_logic;
        init            : in     vl_logic_vector(15 downto 0);
        d_out           : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of n : constant is 1;
end \Register\;

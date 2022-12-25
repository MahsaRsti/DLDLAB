library verilog;
use verilog.vl_types.all;
entity counter_with_ld is
    generic(
        n               : integer := 8
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        inc_cnt         : in     vl_logic;
        ld              : in     vl_logic;
        ld_value        : in     vl_logic_vector;
        co              : out    vl_logic;
        count_out       : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of n : constant is 1;
end counter_with_ld;

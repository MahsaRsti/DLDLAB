library verilog;
use verilog.vl_types.all;
entity Adder is
    generic(
        n               : integer := 16
    );
    port(
        a               : in     vl_logic_vector;
        b               : in     vl_logic_vector;
        cout            : out    vl_logic;
        sum             : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of n : constant is 1;
end Adder;

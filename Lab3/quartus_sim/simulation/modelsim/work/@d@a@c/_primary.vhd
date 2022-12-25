library verilog;
use verilog.vl_types.all;
entity DAC is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        in_data         : in     vl_logic_vector(7 downto 0);
        out_pwm         : out    vl_logic
    );
end DAC;

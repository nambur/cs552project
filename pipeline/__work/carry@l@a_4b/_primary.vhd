library verilog;
use verilog.vl_types.all;
entity carryla_4b is
    port(
        a               : in     vl_logic_vector(3 downto 0);
        b               : in     vl_logic_vector(3 downto 0);
        sum             : out    vl_logic_vector(3 downto 0);
        ci              : in     vl_logic;
        co              : out    vl_logic;
        ofl             : out    vl_logic
    );
end carryla_4b;

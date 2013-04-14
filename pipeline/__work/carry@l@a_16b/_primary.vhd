library verilog;
use verilog.vl_types.all;
entity carryla_16b is
    port(
        a               : in     vl_logic_vector(15 downto 0);
        b               : in     vl_logic_vector(15 downto 0);
        sum             : out    vl_logic_vector(15 downto 0);
        ci              : in     vl_logic;
        co              : out    vl_logic;
        ofl             : out    vl_logic
    );
end carryla_16b;

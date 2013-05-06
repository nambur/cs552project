library verilog;
use verilog.vl_types.all;
entity quadmux2_1 is
    port(
        ina             : in     vl_logic_vector(3 downto 0);
        inb             : in     vl_logic_vector(3 downto 0);
        s               : in     vl_logic;
        \Out\           : out    vl_logic_vector(3 downto 0)
    );
end quadmux2_1;

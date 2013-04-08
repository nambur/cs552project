library verilog;
use verilog.vl_types.all;
entity carryla is
    port(
        g               : in     vl_logic;
        p               : in     vl_logic;
        c               : in     vl_logic;
        \Out\           : out    vl_logic
    );
end carryla;

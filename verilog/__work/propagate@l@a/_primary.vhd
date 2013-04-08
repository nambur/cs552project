library verilog;
use verilog.vl_types.all;
entity propagatela is
    port(
        a               : in     vl_logic;
        b               : in     vl_logic;
        \Out\           : out    vl_logic
    );
end propagatela;

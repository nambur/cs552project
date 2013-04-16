library verilog;
use verilog.vl_types.all;
entity dff_en is
    port(
        \in\            : in     vl_logic;
        \out\           : out    vl_logic;
        en              : in     vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic
    );
end dff_en;

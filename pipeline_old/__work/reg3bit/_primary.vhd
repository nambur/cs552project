library verilog;
use verilog.vl_types.all;
entity reg3bit is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        en              : in     vl_logic;
        \in\            : in     vl_logic_vector(2 downto 0);
        \out\           : out    vl_logic_vector(2 downto 0)
    );
end reg3bit;

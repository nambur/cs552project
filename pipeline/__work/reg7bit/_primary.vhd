library verilog;
use verilog.vl_types.all;
entity reg7bit is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        en              : in     vl_logic;
        \in\            : in     vl_logic_vector(6 downto 0);
        \out\           : out    vl_logic_vector(6 downto 0)
    );
end reg7bit;

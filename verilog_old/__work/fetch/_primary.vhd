library verilog;
use verilog.vl_types.all;
entity fetch is
    port(
        pcnext          : in     vl_logic_vector(15 downto 0);
        jump            : in     vl_logic;
        branch          : in     vl_logic;
        dump            : in     vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        halt            : in     vl_logic;
        pc2             : out    vl_logic_vector(15 downto 0);
        instr           : out    vl_logic_vector(15 downto 0);
        err             : out    vl_logic
    );
end fetch;

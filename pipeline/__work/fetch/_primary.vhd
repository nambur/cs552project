library verilog;
use verilog.vl_types.all;
entity fetch is
    port(
        pcs             : in     vl_logic_vector(15 downto 0);
        jump            : in     vl_logic;
        dump            : in     vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        halt            : in     vl_logic;
        pc2_ifid        : out    vl_logic_vector(15 downto 0);
        instr_ifid      : out    vl_logic_vector(15 downto 0);
        takebranch_exmem: in     vl_logic;
        stallctrl       : in     vl_logic;
        err             : out    vl_logic
    );
end fetch;

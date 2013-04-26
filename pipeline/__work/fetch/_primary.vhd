library verilog;
use verilog.vl_types.all;
entity fetch is
    port(
        pcs             : in     vl_logic_vector(15 downto 0);
        pc_idex         : in     vl_logic_vector(15 downto 0);
        dump            : in     vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        pc_ifid         : out    vl_logic_vector(15 downto 0);
        pc2_ifid        : out    vl_logic_vector(15 downto 0);
        instr_ifid      : out    vl_logic_vector(15 downto 0);
        takebranch      : in     vl_logic;
        takebranch_exmem: in     vl_logic;
        stallctrl       : in     vl_logic;
        halt_ifid       : out    vl_logic;
        err             : out    vl_logic;
        startstall      : in     vl_logic
    );
end fetch;

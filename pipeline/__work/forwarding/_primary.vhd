library verilog;
use verilog.vl_types.all;
entity forwarding is
    port(
        rd1addr_idex    : in     vl_logic_vector(2 downto 0);
        rd2addr_idex    : in     vl_logic_vector(2 downto 0);
        wrr_memwb       : in     vl_logic_vector(2 downto 0);
        wrr_exmem       : in     vl_logic_vector(2 downto 0);
        takebranch      : in     vl_logic;
        loaddetect_exmem: in     vl_logic;
        storedetect_idex: in     vl_logic;
        forwarda        : out    vl_logic_vector(1 downto 0);
        forwardb        : out    vl_logic_vector(1 downto 0);
        regwrite_exmem  : in     vl_logic;
        regwrite_memwb  : in     vl_logic;
        takebranch_exmem: in     vl_logic;
        halt_ifid       : in     vl_logic;
        halt_idex       : in     vl_logic
    );
end forwarding;

library verilog;
use verilog.vl_types.all;
entity hazarddetect is
    port(
        takebranch      : in     vl_logic;
        takebranch_exmem: in     vl_logic;
        regwrite_idex   : in     vl_logic;
        regwrite_exmem  : in     vl_logic;
        wrr_idex        : in     vl_logic_vector(2 downto 0);
        wrr_exmem       : in     vl_logic_vector(2 downto 0);
        rd1addr_ifid    : in     vl_logic_vector(2 downto 0);
        rd2addr_ifid    : in     vl_logic_vector(2 downto 0);
        stallctrl       : out    vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        wrr_memwb       : in     vl_logic_vector(2 downto 0);
        regwrite_memwb  : out    vl_logic;
        startstall      : out    vl_logic;
        mstallinstr     : in     vl_logic;
        mstalldata      : in     vl_logic;
        freeze          : out    vl_logic;
        loaddetect_idex : in     vl_logic;
        loaddetect_exmem: in     vl_logic;
        loaddetect      : in     vl_logic
    );
end hazarddetect;

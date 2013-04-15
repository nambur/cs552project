library verilog;
use verilog.vl_types.all;
entity hazarddetect is
    port(
        regwrite_idex   : in     vl_logic;
        regwrite_exmem  : in     vl_logic;
        wrr_idex        : in     vl_logic_vector(2 downto 0);
        wrr_exmem       : in     vl_logic_vector(2 downto 0);
        rd1addr_ifid    : in     vl_logic_vector(2 downto 0);
        rd2addr_ifid    : in     vl_logic_vector(2 downto 0);
        stallctrl       : out    vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic
    );
end hazarddetect;
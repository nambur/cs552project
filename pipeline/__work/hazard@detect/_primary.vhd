library verilog;
use verilog.vl_types.all;
entity hazarddetect is
    port(
        memread_idex    : in     vl_logic;
        rd2addr_idex    : in     vl_logic_vector(2 downto 0);
        rd1addr_ifid    : in     vl_logic_vector(2 downto 0);
        rd2addr_ifid    : in     vl_logic_vector(2 downto 0);
        stallctrl       : out    vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic
    );
end hazarddetect;

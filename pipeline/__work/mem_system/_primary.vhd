library verilog;
use verilog.vl_types.all;
entity mem_system is
    generic(
        mem_type        : integer := 0;
        idle            : integer := 0;
        wr_cmpcache     : integer := 1;
        wr_wrdirty0     : integer := 2;
        wr_wrdirty1     : integer := 3;
        wr_wrdirty2     : integer := 4;
        wr_wrdirty3     : integer := 5;
        wr_wrmem        : integer := 6;
        rdmemwait       : integer := 7;
        wr_wrcache0     : integer := 8;
        wr_wrcache1     : integer := 9;
        wr_wrcache2     : integer := 10;
        wr_wrcache3     : integer := 11;
        wr_wrcache3wr   : integer := 12;
        rd_cmpcache     : integer := 13;
        rd_wrdirty0     : integer := 14;
        rd_wrdirty1     : integer := 15;
        rd_wrdirty2     : integer := 16;
        rd_wrdirty3     : integer := 17;
        rd_rdmem0       : integer := 18;
        rd_rdmem1       : integer := 19;
        rd_rdmem2       : integer := 20;
        rd_rdmem3       : integer := 21;
        rd_rdmem3wr     : integer := 22;
        rd_rdmemdone    : integer := 23
    );
    port(
        dataout         : out    vl_logic_vector(15 downto 0);
        done            : out    vl_logic;
        stall           : out    vl_logic;
        cachehit        : out    vl_logic;
        err             : out    vl_logic;
        addr            : in     vl_logic_vector(15 downto 0);
        datain          : in     vl_logic_vector(15 downto 0);
        rd              : in     vl_logic;
        wr              : in     vl_logic;
        createdump      : in     vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic
    );
end mem_system;

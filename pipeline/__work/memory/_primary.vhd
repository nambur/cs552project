library verilog;
use verilog.vl_types.all;
entity memory is
    port(
        aluo_exmem      : in     vl_logic_vector(15 downto 0);
        aluo_memwb      : out    vl_logic_vector(15 downto 0);
        rd2_exmem       : in     vl_logic_vector(15 downto 0);
        takebranch_exmem: in     vl_logic;
        memwrite_exmem  : in     vl_logic;
        regwrite_exmem  : in     vl_logic;
        regwrite_memwb  : out    vl_logic;
        memread_exmem   : in     vl_logic;
        dump_exmem      : in     vl_logic;
        rdd_memwb       : out    vl_logic_vector(15 downto 0);
        memtoreg_exmem  : in     vl_logic;
        memtoreg_memwb  : out    vl_logic;
        wrr_exmem       : in     vl_logic_vector(2 downto 0);
        wrr_memwb       : out    vl_logic_vector(2 downto 0);
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        halt_exmem      : in     vl_logic;
        halt_memwb      : out    vl_logic
    );
end memory;

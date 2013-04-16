library verilog;
use verilog.vl_types.all;
entity decode is
    port(
        instr_ifid      : in     vl_logic_vector(15 downto 0);
        pc2_ifid        : in     vl_logic_vector(15 downto 0);
        size            : in     vl_logic_vector(1 downto 0);
        zeroex          : in     vl_logic;
        wrr_memwb       : in     vl_logic_vector(2 downto 0);
        writedata       : in     vl_logic_vector(15 downto 0);
        regdst          : in     vl_logic_vector(1 downto 0);
        regwrite        : in     vl_logic;
        regwrite_memwb  : in     vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        err             : out    vl_logic;
        pc2_idex        : out    vl_logic_vector(15 downto 0);
        rd1_idex        : out    vl_logic_vector(15 downto 0);
        rd2_idex        : out    vl_logic_vector(15 downto 0);
        imm_idex        : out    vl_logic_vector(15 downto 0);
        aluop_idex      : out    vl_logic_vector(4 downto 0);
        regdst_idex     : out    vl_logic_vector(1 downto 0);
        aluf_idex       : out    vl_logic_vector(1 downto 0);
        alusrc_idex     : out    vl_logic;
        branch_idex     : out    vl_logic;
        regwrite_idex   : out    vl_logic;
        dump_idex       : out    vl_logic;
        memtoreg_idex   : out    vl_logic;
        memwrite_idex   : out    vl_logic;
        memread_idex    : out    vl_logic;
        aluop           : in     vl_logic_vector(4 downto 0);
        aluf            : in     vl_logic_vector(1 downto 0);
        alusrc          : in     vl_logic;
        branch          : in     vl_logic;
        dump            : in     vl_logic;
        memtoreg        : in     vl_logic;
        memwrite        : in     vl_logic;
        memread         : in     vl_logic;
        rd2addr_idex    : out    vl_logic_vector(2 downto 0);
        wrr_idex        : out    vl_logic_vector(2 downto 0);
        stallctrl       : in     vl_logic;
        takebranch      : in     vl_logic;
        takebranch_exmem: in     vl_logic;
        halt_ifid       : in     vl_logic;
        halt_idex       : out    vl_logic;
        jump            : in     vl_logic;
        jump_idex       : out    vl_logic;
        pc_ifid         : in     vl_logic_vector(15 downto 0);
        pc_idex         : out    vl_logic_vector(15 downto 0);
        jumpflush       : in     vl_logic;
        jumpandlink_idex: out    vl_logic
    );
end decode;

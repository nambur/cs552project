library verilog;
use verilog.vl_types.all;
entity control is
    generic(
        \HALT\          : integer := 0;
        nop             : integer := 1;
        addi            : integer := 8;
        subi            : integer := 9;
        xori            : integer := 10;
        andni           : integer := 11;
        roli            : integer := 20;
        slli            : integer := 21;
        rori            : integer := 22;
        srli            : integer := 23;
        st              : integer := 16;
        ld              : integer := 17;
        stu             : integer := 19;
        btr             : integer := 25;
        add_thru_andn   : integer := 27;
        rol_thru_srl    : integer := 26;
        seq             : integer := 28;
        slt             : integer := 29;
        sle             : integer := 30;
        sco             : integer := 31;
        beqz            : integer := 12;
        bnez            : integer := 13;
        bltz            : integer := 14;
        bgez            : integer := 15;
        lbi             : integer := 24;
        slbi            : integer := 18;
        j               : integer := 4;
        jr              : integer := 5;
        jal             : integer := 6;
        jalr            : integer := 7;
        siic            : integer := 2;
        nop_rti         : integer := 3
    );
    port(
        inst            : in     vl_logic_vector(15 downto 0);
        size            : out    vl_logic_vector(1 downto 0);
        halt            : out    vl_logic;
        zeroex          : out    vl_logic;
        regdst          : out    vl_logic_vector(1 downto 0);
        jump            : out    vl_logic;
        branch          : out    vl_logic;
        memread         : out    vl_logic;
        memwrite        : out    vl_logic;
        aluop           : out    vl_logic_vector(4 downto 0);
        aluf            : out    vl_logic_vector(1 downto 0);
        memtoreg        : out    vl_logic;
        alusrc          : out    vl_logic;
        regwrite        : out    vl_logic;
        dump            : out    vl_logic;
        rst             : in     vl_logic
    );
end control;

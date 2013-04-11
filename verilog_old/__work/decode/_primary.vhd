library verilog;
use verilog.vl_types.all;
entity decode is
    port(
        instr           : in     vl_logic_vector(15 downto 0);
        size            : in     vl_logic_vector(1 downto 0);
        zeroex          : in     vl_logic;
        writedata       : in     vl_logic_vector(15 downto 0);
        regdst          : in     vl_logic_vector(1 downto 0);
        regwrite        : in     vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        rd1             : out    vl_logic_vector(15 downto 0);
        rd2             : out    vl_logic_vector(15 downto 0);
        err             : out    vl_logic;
        imm             : out    vl_logic_vector(15 downto 0)
    );
end decode;

library verilog;
use verilog.vl_types.all;
entity mem_access is
    port(
        aluresult       : in     vl_logic_vector(15 downto 0);
        writedata       : in     vl_logic_vector(15 downto 0);
        rdd             : out    vl_logic_vector(15 downto 0);
        memwrite        : in     vl_logic;
        memread         : in     vl_logic;
        dump            : in     vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic
    );
end mem_access;

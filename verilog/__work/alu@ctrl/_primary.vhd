library verilog;
use verilog.vl_types.all;
entity aluctrl is
    port(
        aluop           : in     vl_logic_vector(4 downto 0);
        aluf            : in     vl_logic_vector(1 downto 0);
        opout           : out    vl_logic_vector(3 downto 0);
        invb            : out    vl_logic;
        immpass         : out    vl_logic;
        dosle           : out    vl_logic;
        doseq           : out    vl_logic;
        dosco           : out    vl_logic;
        dobtr           : out    vl_logic;
        doslbi          : out    vl_logic;
        doslt           : out    vl_logic;
        dostu           : out    vl_logic
    );
end aluctrl;

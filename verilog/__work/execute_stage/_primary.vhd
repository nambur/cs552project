library verilog;
use verilog.vl_types.all;
entity execute_stage is
    port(
        pc2             : in     vl_logic_vector(15 downto 0);
        alusrc          : in     vl_logic;
        aluop           : in     vl_logic_vector(4 downto 0);
        rd1             : in     vl_logic_vector(15 downto 0);
        rd2             : in     vl_logic_vector(15 downto 0);
        imm             : in     vl_logic_vector(15 downto 0);
        aluf            : in     vl_logic_vector(1 downto 0);
        branch          : in     vl_logic;
        pcs             : out    vl_logic_vector(15 downto 0);
        flag            : out    vl_logic_vector(2 downto 0);
        aluo            : out    vl_logic_vector(15 downto 0);
        err             : out    vl_logic
    );
end execute_stage;

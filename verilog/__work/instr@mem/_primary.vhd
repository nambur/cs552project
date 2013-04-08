library verilog;
use verilog.vl_types.all;
entity instrmem is
    port(
        data_out        : out    vl_logic_vector(15 downto 0);
        addr            : in     vl_logic_vector(15 downto 0);
        clk             : in     vl_logic;
        rst             : in     vl_logic
    );
end instrmem;

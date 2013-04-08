library verilog;
use verilog.vl_types.all;
entity b16mux8_1 is
    port(
        \in\            : in     vl_logic_vector(127 downto 0);
        s               : in     vl_logic_vector(2 downto 0);
        \out\           : out    vl_logic_vector(15 downto 0)
    );
end b16mux8_1;

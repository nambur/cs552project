library verilog;
use verilog.vl_types.all;
entity branchctrl is
    port(
        branch          : in     vl_logic;
        branchtype      : in     vl_logic_vector(1 downto 0);
        flag            : in     vl_logic_vector(2 downto 0);
        takebranch      : out    vl_logic
    );
end branchctrl;

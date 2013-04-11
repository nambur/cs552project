library verilog;
use verilog.vl_types.all;
entity shift_right_ar is
    port(
        \In\            : in     vl_logic_vector(15 downto 0);
        cnt             : in     vl_logic_vector(3 downto 0);
        \Out\           : out    vl_logic_vector(15 downto 0)
    );
end shift_right_ar;

library verilog;
use verilog.vl_types.all;
entity writeback is
    port(
        rdd             : in     vl_logic_vector(15 downto 0);
        wrd             : out    vl_logic_vector(15 downto 0);
        aluo            : in     vl_logic_vector(15 downto 0);
        memtoreg        : in     vl_logic
    );
end writeback;

library verilog;
use verilog.vl_types.all;
entity writeback is
    port(
        rdd_memwb       : in     vl_logic_vector(15 downto 0);
        wrd             : out    vl_logic_vector(15 downto 0);
        aluo_memwb      : in     vl_logic_vector(15 downto 0);
        memtoreg_memwb  : in     vl_logic
    );
end writeback;

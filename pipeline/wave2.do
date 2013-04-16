onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/fetch0/clk
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/fetch0/rst
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/fetch0/Dump
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/fetch0/stallCtrl
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/fetch0/takeBranch_EXMEM
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/fetch0/halt_IFID
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/fetch0/err
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/fetch0/dummy1
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/fetch0/halt
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/fetch0/haltTemp
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/fetch0/PC2
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/fetch0/instr
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/fetch0/pcCurrent
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/fetch0/PC_FF_in
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/fetch0/PC_IFID
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/fetch0/PC2_IFID
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/fetch0/instr_IFID
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/fetch0/PCS
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/memory0/MemWrite_EXMEM
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/memory0/RegWrite_EXMEM
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/memory0/jumpAndLink_EXMEM
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/memory0/RegWrIn
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/memory0/MemWrIn
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/wb/WrD
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/wb/ALUO_MEMWB
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/wb/RdD_MEMWB
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/ex/immPass
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/ex/RegWrIn
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/ALUO
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/hD/stallCtrl
add wave -noupdate -format Literal /proc_hier_pbench/DUT/p0/hD/Rd2Addr_IFID
add wave -noupdate -format Literal /proc_hier_pbench/DUT/p0/hD/Rd1Addr_IFID
add wave -noupdate -format Literal /proc_hier_pbench/DUT/p0/hD/WrR_IDEX
add wave -noupdate -format Literal /proc_hier_pbench/DUT/p0/hD/WrR_EXMEM
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/ex/ALUSrc_IDEX
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/ex/Branch_IDEX
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/Rd1_IDEX
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/bin
add wave -noupdate -format Literal /proc_hier_pbench/DUT/p0/memory0/WrR_MEMWB
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/memory0/RegWrite_MEMWB
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {3572 ns} 0}
WaveRestoreZoom {3076 ns} {4786 ns}
configure wave -namecolwidth 435
configure wave -valuecolwidth 43
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0

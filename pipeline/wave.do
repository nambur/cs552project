onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/fetch0/clk
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/fetch0/rst
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/fetch0/stallCtrl
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/fetch0/startStall
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/fetch0/takeBranch_EXMEM
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/fetch0/instr
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/fetch0/PC_FF_in
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/wb/WrD
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/memory0/RegWrite_MEMWB
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/fetch0/pcCurrent
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/fetch0/PCS
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/ex/halt_IDEX
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/memory0/halt_EXMEM
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/memory0/halt_MEMWB
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {23554 ns} 0}
WaveRestoreZoom {21673 ns} {23702 ns}
configure wave -namecolwidth 358
configure wave -valuecolwidth 38
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

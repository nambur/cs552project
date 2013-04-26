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
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/fetch0/halt
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/fetch0/halt_IFID
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/ex/halt_IDEX
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/memory0/halt_EXMEM
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/memory0/halt_MEMWB
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/fetch0/err
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/fetch0/dummy1
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/fetch0/haltTemp
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/fetch0/haltTemp2
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/fetch0/pcCurrTemp
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/fetch0/startStall
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/fetch0/halt_IFID
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/fetch0/err
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/fetch0/dummy1
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/fetch0/halt
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/fetch0/haltTemp
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/fetch0/haltTemp2
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/outALU
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/bin
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/fetch0/pcCurrTemp
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/fetch0/PC_IDEX
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/fetch0/pcCurrent
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/decode0/instr_IFID
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/ALUO
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/exerr
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/claIn
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/btrOut
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/sltOut
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/slbiOut
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/scoOut
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/seqOut
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/sleOut
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/outCLA
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/temp
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/stuOut
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/PCS
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/flag
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/opOut
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/WrR_EXMEM
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/Rd2_EXMEM
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/ALUO_EXMEM
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/PCS_EXMEM
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/WrR_IDEX
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/ALUF_IDEX
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/ALUOp_IDEX
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/Imm_IDEX
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/Rd2_IDEX
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/Rd1_IDEX
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/PC_IDEX
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/PC2_IDEX
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {7062 ns} 0}
WaveRestoreZoom {6406 ns} {8156 ns}
configure wave -namecolwidth 358
configure wave -valuecolwidth 40
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

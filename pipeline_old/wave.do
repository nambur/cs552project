onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/rst
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/clk
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/fetch0/stallCtrl
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/fetch0/takeBranch_EXMEM
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/fetch0/halt_IFID
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/fetch0/halt
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/fetch0/haltTemp
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/fetch0/PC2
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/fetch0/instr
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/fetch0/pcCurrent
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/fetch0/PC_FF_in
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/fetch0/PC2_IFID
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/fetch0/instr_IFID
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/fetch0/PCS
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/decode0/RegWrite
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/decode0/RegWrite_MEMWB
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/decode0/Jump
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/decode0/stallCtrl
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/decode0/takeBranch_EXMEM
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/decode0/ALUSrc
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/decode0/halt_IFID
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/decode0/Branch
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/decode0/MemRead
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/decode0/Branch_IDEX
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/decode0/MemRead_IDEX
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/decode0/RegWrite_IDEX
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/decode0/halt_IDEX
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/decode0/Jump_IDEX
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/decode0/WrR
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/decode0/RegWrIn
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/decode0/MemWrIn
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/decode0/haltTemp
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/decode0/Imm
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/decode0/Rd2
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/decode0/Rd1
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/decode0/Imm_IDEX
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/decode0/Rd2_IDEX
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/decode0/Rd1_IDEX
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/decode0/PC2_IDEX
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/decode0/WrR_IDEX
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/decode0/Rd2Addr_IDEX
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/decode0/WrR_MEMWB
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/decode0/PC2_IFID
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/decode0/writeData
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/decode0/instr_IFID
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/Branch_IDEX
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/RegWrite_IDEX
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/halt_IDEX
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/Jump_IDEX
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/MemRead_EXMEM
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/RegWrite_EXMEM
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/takeBranch_EXMEM
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/halt_EXMEM
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/haltTemp
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/RegWrIn
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/MemWrIn
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/takeBranch
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/MemReadIn
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/bin
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/ALUO
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/claTemp
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/claIn
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/outCLA
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/outALU
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/PCS
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/WrR_EXMEM
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/Rd2_EXMEM
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/ALUO_EXMEM
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/PCS_EXMEM
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/WrR_IDEX
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/Imm_IDEX
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/Rd2_IDEX
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/Rd1_IDEX
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/PC2_IDEX
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {7455 ns} 0}
WaveRestoreZoom {7181 ns} {7983 ns}
configure wave -namecolwidth 409
configure wave -valuecolwidth 107
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

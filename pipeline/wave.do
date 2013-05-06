onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/clk
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/rst
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/halt_EXMEM
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/freeze
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/takeBranch
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/takeBranch_EXMEM
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/MemtoReg_EXMEM
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/MemWrite_EXMEM
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/RegWrite_EXMEM
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/MemRead_EXMEM
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/Dump_EXMEM
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/mStallInstr
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/MemtoReg_MEMWB
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/RegWrite_MEMWB
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/mStallData
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/memReadorWrite
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/MemReadIn
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/MemWriteActual
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/MemReadActual
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/testBenchRead
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/testBenchWrite
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/RegWrIn
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/MemWrIn
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/RdD
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/WrR_MEMWB
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/ALUO_MEMWB
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/RdD_MEMWB
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/WrR_EXMEM
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/Rd2_EXMEM
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/ALUO_EXMEM
add wave -noupdate -divider forwarding
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/unit/RegWrite_EXMEM
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/unit/RegWrite_MEMWB
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/unit/takeBranch_EXMEM
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/unit/takeBranch
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/unit/loadDetect_EXMEM
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/unit/forwardB
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/unit/forwardA
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/unit/Rd2Addr_IDEX
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/unit/Rd1Addr_IDEX
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/unit/WrR_MEMWB
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/unit/WrR_EXMEM
add wave -noupdate -divider halts
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/fetch0/halt_IFID
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {761 ns} 0}
WaveRestoreZoom {0 ns} {1674 ns}
configure wave -namecolwidth 381
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

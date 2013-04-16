onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/clk
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/err
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/rst
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/fetch0/Dump
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/fetch0/stallCtrl
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/fetch0/takeBranch_EXMEM
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/fetch0/takeBranch
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/fetch0/halt_IFID
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/fetch0/err
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/fetch0/dummy1
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/fetch0/halt
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/fetch0/haltTemp
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/fetch0/PC2
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/fetch0/instr
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/fetch0/pcCurrent
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/fetch0/PC_FF_in
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/fetch0/PC_IFID
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/fetch0/PC2_IFID
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/fetch0/instr_IFID
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/fetch0/PCS
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/hD/RegWrite_IDEX
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/hD/RegWrite_EXMEM
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/hD/takeBranch_EXMEM
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/hD/stallCtrl
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/hD/jumpFlush
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/hD/RegWrite_MEMWB
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/hD/stall2
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/hD/stall3
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/hD/a
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/hD/b
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/hD/c
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/hD/d
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/hD/e
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/hD/f
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/hD/stall1
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/hD/checkSt3
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/hD/checkSt3Out
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/hD/checkJump
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/hD/checkTemp
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/hD/checkSt2Out
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/hD/checkTemp1
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/hD/checkTemp2
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/hD/Rd2Addr_IFID
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/hD/Rd1Addr_IFID
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/hD/WrR_MEMWB
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/hD/WrR_EXMEM
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/hD/WrR_IDEX
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/decode0/RegWrite
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/decode0/RegWrite_MEMWB
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/decode0/writeData
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/decode0/Jump
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/decode0/jumpFlush
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/decode0/stallCtrl
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/decode0/takeBranch_EXMEM
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/decode0/halt_IFID
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/decode0/Branch
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/decode0/MemWrite
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/decode0/MemRead
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/decode0/Branch_IDEX
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/decode0/MemWrite_IDEX
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/decode0/MemRead_IDEX
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/decode0/RegWrite_IDEX
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/decode0/halt_IDEX
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/decode0/Jump_IDEX
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/decode0/jumpAndLink_IDEX
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/decode0/WrR
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/decode0/RegWrIn
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/decode0/MemWrIn
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/decode0/MemReadIn
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/decode0/haltTemp
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/decode0/jumpTemp
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/decode0/jumpAndLinkTemp
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/decode0/Imm
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/decode0/Rd2
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/decode0/Rd1
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/decode0/PC_IDEX
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/decode0/Imm_IDEX
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/decode0/Rd2_IDEX
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/decode0/Rd1_IDEX
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/decode0/PC2_IDEX
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/decode0/WrR_IDEX
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/decode0/Rd2Addr_IDEX
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/decode0/WrR_MEMWB
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/decode0/PC_IFID
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/decode0/PC2_IFID
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/decode0/instr_IFID
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/Branch_IDEX
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/jumpAndLink_IDEX
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/MemWrite_IDEX
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/MemRead_IDEX
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/RegWrite_IDEX
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/halt_IDEX
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/Jump_IDEX
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/MemWrite_EXMEM
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/MemRead_EXMEM
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/RegWrite_EXMEM
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/takeBranch_EXMEM
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/halt_EXMEM
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/jumpAndLink_EXMEM
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/haltTemp
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/RegWrIn
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/MemWrIn
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/takeBranch
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/MemReadIn
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/bin
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/ALUO
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/PC2Temp
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/claIn
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/outALU
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/PCS
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/WrR_EXMEM
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/Rd2_EXMEM
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/ALUO_EXMEM
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/WrR_IDEX
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/Imm_IDEX
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/Rd2_IDEX
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/Rd1_IDEX
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/PC_IDEX
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/PC2_IDEX
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/wb/WrD
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/wb/ALUO_MEMWB
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/wb/RdD_MEMWB
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/clk
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/rst
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/halt_EXMEM
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/haltTemp
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/takeBranch_EXMEM
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/takeBranch
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/halt_MEMWB
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/MemtoReg_EXMEM
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/MemWrite_EXMEM
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/RegWrite_EXMEM
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/MemRead_EXMEM
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/Dump_EXMEM
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/jumpAndLink_EXMEM
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/MemtoReg_MEMWB
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/RegWrite_MEMWB
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/memReadorWrite
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/MemReadIn
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/RegWrIn
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/MemWrIn
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/RdD
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/WrR_MEMWB
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/ALUO_MEMWB
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/RdD_MEMWB
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/WrR_EXMEM
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/Rd2_EXMEM
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/ALUO_EXMEM
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {3144 ns} 0}
WaveRestoreZoom {1753 ns} {3697 ns}
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

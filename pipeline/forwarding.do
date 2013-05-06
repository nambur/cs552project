onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/ex/err
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/ex/clk
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/ex/rst
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/ex/MemtoReg_IDEX
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/ex/loadDetect_IDEX
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/ex/MemWrite_IDEX
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/ex/MemRead_IDEX
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/ex/RegWrite_IDEX
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/ex/halt_IDEX
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/ex/Jump_IDEX
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/ex/storeDetect_IDEX
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/ex/MemtoReg_EXMEM
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/ex/MemWrite_EXMEM
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/ex/MemRead_EXMEM
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/ex/RegWrite_EXMEM
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/ex/storeDetect_EXMEM
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/ex/Dump_EXMEM
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/ex/takeBranch_EXMEM
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/ex/halt_EXMEM
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/ex/takeBranch
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/ex/loadDetect_EXMEM
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/ex/haltTemp
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/ex/invB
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/ex/immPass
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/ex/doSLE
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/ex/doSEQ
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/ex/doSCO
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/ex/doBTR
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/ex/doSTU
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/ex/RegWrIn
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/ex/MemWrIn
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/ex/doSLBI
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/ex/doSLT
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/ex/CO
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/ex/ofl
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/aluerr
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/dummy
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/dummy2
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/MemReadIn
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/bin
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/ALUO
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/exerr
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/Rd2in
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/Rd1in
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
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/outALU
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/PCS
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/flag
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/opOut
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/WrR_EXMEM
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/Rd2_EXMEM
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/ALUO_EXMEM
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/PCS_EXMEM
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/WrR_IDEX
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/forwardB
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/forwardA
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/ALUF_IDEX
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/ALUOp_IDEX
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/WrD
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/Imm_IDEX
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/Rd2_IDEX
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/Rd1_IDEX
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/PC_IDEX
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/ex/PC2_IDEX
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/unit/RegWrite_EXMEM
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/unit/RegWrite_MEMWB
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/unit/takeBranch_EXMEM
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/unit/takeBranch
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/unit/loadDetect_EXMEM
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/unit/halt_IFID
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/unit/halt_IDEX
add wave -noupdate -format Logic -radix hexadecimal /proc_hier_pbench/DUT/p0/unit/storeDetect_IDEX
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/unit/forwardB
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/unit/forwardA
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/unit/Rd2Addr_IDEX
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/unit/Rd1Addr_IDEX
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/unit/WrR_MEMWB
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/unit/WrR_EXMEM
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1553 ns} 0}
WaveRestoreZoom {0 ns} {1979 ns}
configure wave -namecolwidth 355
configure wave -valuecolwidth 72
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

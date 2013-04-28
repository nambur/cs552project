onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/memory0/clk
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/memory0/rst
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/memory0/halt_EXMEM
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/memory0/freeze
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/memory0/MemtoReg_EXMEM
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/memory0/MemWrite_EXMEM
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/memory0/MemWriteActual
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/memory0/MemWrIn
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/memory0/RegWrite_EXMEM
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/memory0/RegWrite_MEMWB
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/memory0/RegWrIn
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/memory0/MemRead_EXMEM
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/memory0/MemReadActual
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/memory0/MemReadIn
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/memory0/Done
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/RdD
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/RdD_MEMWB
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/WrR_EXMEM
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/WrR_MEMWB
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/Rd2_EXMEM
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/ALUO_EXMEM
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/ALUO_MEMWB
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/fetch0/Done
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/fetch0/pcCurrTemp
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/fetch0/instrTempIn
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/fetch0/PC2_out
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/fetch0/PC2
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/fetch0/instr
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/fetch0/instrTemp
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/fetch0/pcCurrent
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/fetch0/PC_FF_in
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/fetch0/PC_IFID
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/fetch0/PC2_IFID
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/fetch0/instr_IFID
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/fetch0/PC_IDEX
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/fetch0/PCS
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/memory0/mem/Rd
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/memory0/mem/Wr
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/memory0/mem/Done
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/memory0/mem/Stall
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/memory0/mem/CacheHit
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/memory0/mem/cDirty
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/memory0/mem/cValid
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/memory0/mem/cHit
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/mem/cDataIn
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/mem/cOffset
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/memory0/mem/cValidIn
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/memory0/mem/cEnable
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/memory0/mem/cEnable2
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/memory0/mem/cComp
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/memory0/mem/cWrite
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/memory0/mem/mStall
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/memory0/mem/mWr
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/memory0/mem/mRd
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/mem/mAddr
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/mem/nxState
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/memory0/mem/nxStall_IDLE
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/memory0/mem/startWait
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/memory0/mem/nxDone
add wave -noupdate -format Logic /proc_hier_pbench/DUT/p0/memory0/mem/nxDone_WR_CMPCACHE
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/mem/waitStNxt
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/mem/mDataOut
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/mem/cDataOut2
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/mem/cDataOut
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/mem/DataOut
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/mem/DataIn
add wave -noupdate -format Literal -radix hexadecimal /proc_hier_pbench/DUT/p0/memory0/mem/Addr
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {20964 ns} 0}
WaveRestoreZoom {19882 ns} {23688 ns}
configure wave -namecolwidth 435
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

onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group dp /system_tb/DUT/CPU/DP/dpif/halt
add wave -noupdate -group dp /system_tb/DUT/CPU/DP/dpif/ihit
add wave -noupdate -group dp /system_tb/DUT/CPU/DP/dpif/imemREN
add wave -noupdate -group dp /system_tb/DUT/CPU/DP/dpif/imemload
add wave -noupdate -group dp /system_tb/DUT/CPU/DP/dpif/imemaddr
add wave -noupdate -group dp /system_tb/DUT/CPU/DP/dpif/dhit
add wave -noupdate -group dp /system_tb/DUT/CPU/DP/dpif/datomic
add wave -noupdate -group dp /system_tb/DUT/CPU/DP/dpif/dmemREN
add wave -noupdate -group dp /system_tb/DUT/CPU/DP/dpif/dmemWEN
add wave -noupdate -group dp /system_tb/DUT/CPU/DP/dpif/flushed
add wave -noupdate -group dp /system_tb/DUT/CPU/DP/dpif/dmemload
add wave -noupdate -group dp /system_tb/DUT/CPU/DP/dpif/dmemstore
add wave -noupdate -group dp /system_tb/DUT/CPU/DP/dpif/dmemaddr
add wave -noupdate -group cu /system_tb/DUT/CPU/DP/cuif/branch
add wave -noupdate -group cu /system_tb/DUT/CPU/DP/cuif/RegWr
add wave -noupdate -group cu /system_tb/DUT/CPU/DP/cuif/ExtOp
add wave -noupdate -group cu /system_tb/DUT/CPU/DP/cuif/iREN
add wave -noupdate -group cu /system_tb/DUT/CPU/DP/cuif/dREN
add wave -noupdate -group cu /system_tb/DUT/CPU/DP/cuif/dWEN
add wave -noupdate -group cu /system_tb/DUT/CPU/DP/cuif/jump
add wave -noupdate -group cu /system_tb/DUT/CPU/DP/cuif/jal
add wave -noupdate -group cu /system_tb/DUT/CPU/DP/cuif/mem2reg
add wave -noupdate -group cu /system_tb/DUT/CPU/DP/cuif/halt
add wave -noupdate -group cu /system_tb/DUT/CPU/DP/cuif/lui
add wave -noupdate -group cu /system_tb/DUT/CPU/DP/cuif/jr
add wave -noupdate -group cu /system_tb/DUT/CPU/DP/cuif/zero
add wave -noupdate -group cu /system_tb/DUT/CPU/DP/cuif/overflow
add wave -noupdate -group cu /system_tb/DUT/CPU/DP/cuif/ALUSrc
add wave -noupdate -group cu /system_tb/DUT/CPU/DP/cuif/RegDst
add wave -noupdate -group cu /system_tb/DUT/CPU/DP/cuif/ALUop
add wave -noupdate -group cu /system_tb/DUT/CPU/DP/cuif/Instruct
add wave -noupdate -group cu /system_tb/DUT/CPU/DP/cuif/funct
add wave -noupdate -group alu /system_tb/DUT/CPU/DP/aluif/ALUOP
add wave -noupdate -group alu /system_tb/DUT/CPU/DP/aluif/port_A
add wave -noupdate -group alu /system_tb/DUT/CPU/DP/aluif/port_B
add wave -noupdate -group alu /system_tb/DUT/CPU/DP/aluif/output_port
add wave -noupdate -group alu /system_tb/DUT/CPU/DP/aluif/negative
add wave -noupdate -group alu /system_tb/DUT/CPU/DP/aluif/overflow
add wave -noupdate -group alu /system_tb/DUT/CPU/DP/aluif/zero
add wave -noupdate -group rf /system_tb/DUT/CPU/DP/rfif/WEN
add wave -noupdate -group rf /system_tb/DUT/CPU/DP/rfif/wsel
add wave -noupdate -group rf /system_tb/DUT/CPU/DP/rfif/rsel1
add wave -noupdate -group rf /system_tb/DUT/CPU/DP/rfif/rsel2
add wave -noupdate -group rf /system_tb/DUT/CPU/DP/rfif/wdat
add wave -noupdate -group rf /system_tb/DUT/CPU/DP/rfif/rdat1
add wave -noupdate -group rf /system_tb/DUT/CPU/DP/rfif/rdat2
add wave -noupdate -group ifid /system_tb/DUT/CPU/DP/ifid/imemload_if
add wave -noupdate -group ifid /system_tb/DUT/CPU/DP/ifid/pc_nextstate_if
add wave -noupdate -group ifid /system_tb/DUT/CPU/DP/ifid/pc_nextstate_id
add wave -noupdate -group ifid /system_tb/DUT/CPU/DP/ifid/imemload_id
add wave -noupdate -group ifid /system_tb/DUT/CPU/DP/ifid/ihit
add wave -noupdate -group ifid /system_tb/DUT/CPU/DP/ifid/flush_ifid
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/ihit
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/flush_idex
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/pc_nextstate_id
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/pc_nextstate_ex
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/rdat1_id
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/rdat1_ex
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/rdat2_id
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/rdat2_ex
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/imm16_extend_ex
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/ALUop_id
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/ALUop_ex
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/Rd_id
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/Rd_ex
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/Rt_id
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/Rt_ex
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/shamt_ex
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/imm16_ex
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/imm16_id
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/ALUSrc_id
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/RegDst_id
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/ALUSrc_ex
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/RegDst_ex
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/RegWr_id
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/RegWr_ex
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/halt_id
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/halt_ex
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/lui_id
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/lui_ex
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/dREN_id
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/dREN_ex
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/dWEN_id
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/dWEN_ex
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/branch_id
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/branch_ex
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/jump_id
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/jump_ex
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/jal_id
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/jal_ex
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/jr_id
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/jr_ex
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/mem2reg_id
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/mem2reg_ex
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/ExtOp_id
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/ExtOp_ex
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/jumpaddr_id
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/idex/jumpaddr_ex
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/ihit
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/flush_exmem
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/zero_ex
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/zero_mem
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/branch_ex
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/branch_mem
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/jr_ex
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/jr_mem
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/jal_ex
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/jal_mem
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/jump_ex
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/jump_mem
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/mem2reg_ex
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/mem2reg_mem
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/halt_ex
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/halt_mem
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/lui_ex
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/lui_mem
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/dREN_ex
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/dmemren
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/dWEN_ex
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/dmemwen
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/RegWr_ex
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/RegWr_mem
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/RegDst_ex
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/RegDst_mem
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/rdat1_ex
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/rdat2_ex
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/rdat1_mem
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/pc_nextstate_ex
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/pc_nextstate_mem
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/dmemaddr
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/dmemstore
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/wdat_ex
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/wdat_mem
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/branch_target_ex
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/branch_target_mem
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/jumpaddr_ex
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/jumpaddr_mem
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/jumpoffset_ex
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/jumpoffset_mem
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/imm16_ex
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/exmem/imm16_mem
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/memwb/ihit
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/memwb/dhit
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/memwb/flush_memwb
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/memwb/mem2reg_mem
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/memwb/mem2reg_wb
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/memwb/jal_mem
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/memwb/jal_wb
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/memwb/lui_mem
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/memwb/lui_wb
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/memwb/RegWr_mem
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/memwb/RegWr_wb
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/memwb/RegDst_mem
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/memwb/RegDst_wb
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/memwb/wdat_mem
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/memwb/wdat_wb
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/memwb/dmemload
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/memwb/pc_nextstate_mem
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/memwb/pc_nextstate_wb
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/memwb/dmemload_wb
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/memwb/imm16_mem
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/memwb/imm16_wb
TreeUpdate [SetDefaultTree]
quietly WaveActivateNextPane
WaveRestoreCursors {{Cursor 1} {347748 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {498716 ps}

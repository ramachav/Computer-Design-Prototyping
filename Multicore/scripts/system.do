onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /system_tb/CLK
add wave -noupdate /system_tb/nRST
add wave -noupdate -group ramif /system_tb/DUT/RAM/BAD
add wave -noupdate -group ramif /system_tb/DUT/RAM/LAT
add wave -noupdate -group ramif /system_tb/DUT/RAM/count
add wave -noupdate -group ramif /system_tb/DUT/RAM/rstate
add wave -noupdate -group ramif /system_tb/DUT/RAM/q
add wave -noupdate -group ramif /system_tb/DUT/RAM/addr
add wave -noupdate -group ramif /system_tb/DUT/RAM/wren
add wave -noupdate -group ramif /system_tb/DUT/RAM/en
add wave -noupdate -group ramif /system_tb/DUT/RAM/ramif/ramREN
add wave -noupdate -group ramif /system_tb/DUT/RAM/ramif/ramWEN
add wave -noupdate -group ramif /system_tb/DUT/RAM/ramif/ramaddr
add wave -noupdate -group ramif /system_tb/DUT/RAM/ramif/ramstore
add wave -noupdate -group ramif /system_tb/DUT/RAM/ramif/ramload
add wave -noupdate -group ramif /system_tb/DUT/RAM/ramif/ramstate
add wave -noupdate -group ramif /system_tb/DUT/RAM/ramif/memREN
add wave -noupdate -group ramif /system_tb/DUT/RAM/ramif/memWEN
add wave -noupdate -group ramif /system_tb/DUT/RAM/ramif/memaddr
add wave -noupdate -group ramif /system_tb/DUT/RAM/ramif/memstore
add wave -noupdate -group ccif /system_tb/DUT/CPU/CC/bus_state
add wave -noupdate -group ccif /system_tb/DUT/CPU/CC/bus_nextstate
add wave -noupdate -group ccif /system_tb/DUT/CPU/CC/snooper
add wave -noupdate -group ccif /system_tb/DUT/CPU/CC/snooped
add wave -noupdate -group ccif /system_tb/DUT/CPU/CC/nextstate_snooper
add wave -noupdate -group ccif /system_tb/DUT/CPU/CC/nextstate_snooped
add wave -noupdate -group ccif /system_tb/DUT/CPU/ccif/iwait
add wave -noupdate -group ccif /system_tb/DUT/CPU/ccif/dwait
add wave -noupdate -group ccif /system_tb/DUT/CPU/ccif/iREN
add wave -noupdate -group ccif /system_tb/DUT/CPU/ccif/dREN
add wave -noupdate -group ccif /system_tb/DUT/CPU/ccif/dWEN
add wave -noupdate -group ccif /system_tb/DUT/CPU/ccif/iload
add wave -noupdate -group ccif /system_tb/DUT/CPU/ccif/dload
add wave -noupdate -group ccif /system_tb/DUT/CPU/ccif/dstore
add wave -noupdate -group ccif /system_tb/DUT/CPU/ccif/iaddr
add wave -noupdate -group ccif /system_tb/DUT/CPU/ccif/daddr
add wave -noupdate -group ccif /system_tb/DUT/CPU/ccif/ccwait
add wave -noupdate -group ccif /system_tb/DUT/CPU/ccif/ccinv
add wave -noupdate -group ccif /system_tb/DUT/CPU/ccif/ccwrite
add wave -noupdate -group ccif /system_tb/DUT/CPU/ccif/cctrans
add wave -noupdate -group ccif /system_tb/DUT/CPU/ccif/ccsnoopaddr
add wave -noupdate -group ccif /system_tb/DUT/CPU/ccif/ramWEN
add wave -noupdate -group ccif /system_tb/DUT/CPU/ccif/ramREN
add wave -noupdate -group ccif /system_tb/DUT/CPU/ccif/ramstate
add wave -noupdate -group ccif /system_tb/DUT/CPU/ccif/ramaddr
add wave -noupdate -group ccif /system_tb/DUT/CPU/ccif/ramstore
add wave -noupdate -group ccif /system_tb/DUT/CPU/ccif/ramload
add wave -noupdate -group {Core 0} /system_tb/DUT/CPU/DP0/ifid/imemload_if
add wave -noupdate -group {Core 0} /system_tb/DUT/CPU/DP0/ifid/imemload_id
add wave -noupdate -group {Core 0} /system_tb/DUT/CPU/DP0/idex/imemload_ex
add wave -noupdate -group {Core 0} /system_tb/DUT/CPU/DP0/exmem/imemload_mem
add wave -noupdate -group {Core 0} /system_tb/DUT/CPU/DP0/memwb/imemload_wb
add wave -noupdate -group {Core 0} /system_tb/DUT/CPU/DP0/ifid/imemaddr_if
add wave -noupdate -group {Core 0} /system_tb/DUT/CPU/DP0/ifid/imemaddr_id
add wave -noupdate -group {Core 0} /system_tb/DUT/CPU/DP0/exmem/imemaddr_ex
add wave -noupdate -group {Core 0} /system_tb/DUT/CPU/DP0/memwb/imemaddr_mem
add wave -noupdate -group {Core 0} /system_tb/DUT/CPU/DP0/memwb/imemaddr_wb
add wave -noupdate -group {Core 0} -group pcif0 /system_tb/DUT/CPU/DP0/pc_input
add wave -noupdate -group {Core 0} -group pcif0 /system_tb/DUT/CPU/DP0/pc_output
add wave -noupdate -group {Core 0} -group pcif0 /system_tb/DUT/CPU/DP0/pc_nextstate
add wave -noupdate -group {Core 0} -group pcif0 /system_tb/DUT/CPU/DP0/pc_wen
add wave -noupdate -group {Core 0} -group pcif0 /system_tb/DUT/CPU/DP0/PCSrc
add wave -noupdate -group {Core 0} -group dcif0 /system_tb/DUT/CPU/dcif0/halt
add wave -noupdate -group {Core 0} -group dcif0 /system_tb/DUT/CPU/dcif0/ihit
add wave -noupdate -group {Core 0} -group dcif0 /system_tb/DUT/CPU/dcif0/imemREN
add wave -noupdate -group {Core 0} -group dcif0 /system_tb/DUT/CPU/dcif0/imemload
add wave -noupdate -group {Core 0} -group dcif0 /system_tb/DUT/CPU/dcif0/imemaddr
add wave -noupdate -group {Core 0} -group dcif0 /system_tb/DUT/CPU/dcif0/dhit
add wave -noupdate -group {Core 0} -group dcif0 /system_tb/DUT/CPU/dcif0/datomic
add wave -noupdate -group {Core 0} -group dcif0 /system_tb/DUT/CPU/dcif0/dmemREN
add wave -noupdate -group {Core 0} -group dcif0 /system_tb/DUT/CPU/dcif0/dmemWEN
add wave -noupdate -group {Core 0} -group dcif0 /system_tb/DUT/CPU/dcif0/flushed
add wave -noupdate -group {Core 0} -group dcif0 /system_tb/DUT/CPU/dcif0/dmemload
add wave -noupdate -group {Core 0} -group dcif0 /system_tb/DUT/CPU/dcif0/dmemstore
add wave -noupdate -group {Core 0} -group dcif0 /system_tb/DUT/CPU/dcif0/dmemaddr
add wave -noupdate -group {Core 0} -group cif0 /system_tb/DUT/CPU/cif0/iwait
add wave -noupdate -group {Core 0} -group cif0 /system_tb/DUT/CPU/cif0/dwait
add wave -noupdate -group {Core 0} -group cif0 /system_tb/DUT/CPU/cif0/iREN
add wave -noupdate -group {Core 0} -group cif0 /system_tb/DUT/CPU/cif0/dREN
add wave -noupdate -group {Core 0} -group cif0 /system_tb/DUT/CPU/cif0/dWEN
add wave -noupdate -group {Core 0} -group cif0 /system_tb/DUT/CPU/cif0/iload
add wave -noupdate -group {Core 0} -group cif0 /system_tb/DUT/CPU/cif0/dload
add wave -noupdate -group {Core 0} -group cif0 /system_tb/DUT/CPU/cif0/dstore
add wave -noupdate -group {Core 0} -group cif0 /system_tb/DUT/CPU/cif0/iaddr
add wave -noupdate -group {Core 0} -group cif0 /system_tb/DUT/CPU/cif0/daddr
add wave -noupdate -group {Core 0} -group cif0 /system_tb/DUT/CPU/cif0/ccwait
add wave -noupdate -group {Core 0} -group cif0 /system_tb/DUT/CPU/cif0/ccinv
add wave -noupdate -group {Core 0} -group cif0 /system_tb/DUT/CPU/cif0/ccwrite
add wave -noupdate -group {Core 0} -group cif0 /system_tb/DUT/CPU/cif0/cctrans
add wave -noupdate -group {Core 0} -group cif0 /system_tb/DUT/CPU/cif0/ccsnoopaddr
add wave -noupdate -group {Core 0} -group dpif0 /system_tb/DUT/CPU/DP0/dpif/halt
add wave -noupdate -group {Core 0} -group dpif0 /system_tb/DUT/CPU/DP0/dpif/ihit
add wave -noupdate -group {Core 0} -group dpif0 /system_tb/DUT/CPU/DP0/dpif/imemREN
add wave -noupdate -group {Core 0} -group dpif0 /system_tb/DUT/CPU/DP0/dpif/imemload
add wave -noupdate -group {Core 0} -group dpif0 /system_tb/DUT/CPU/DP0/dpif/imemaddr
add wave -noupdate -group {Core 0} -group dpif0 /system_tb/DUT/CPU/DP0/dpif/dhit
add wave -noupdate -group {Core 0} -group dpif0 /system_tb/DUT/CPU/DP0/dpif/datomic
add wave -noupdate -group {Core 0} -group dpif0 /system_tb/DUT/CPU/DP0/dpif/dmemREN
add wave -noupdate -group {Core 0} -group dpif0 /system_tb/DUT/CPU/DP0/dpif/dmemWEN
add wave -noupdate -group {Core 0} -group dpif0 /system_tb/DUT/CPU/DP0/dpif/flushed
add wave -noupdate -group {Core 0} -group dpif0 /system_tb/DUT/CPU/DP0/dpif/dmemload
add wave -noupdate -group {Core 0} -group dpif0 /system_tb/DUT/CPU/DP0/dpif/dmemstore
add wave -noupdate -group {Core 0} -group dpif0 /system_tb/DUT/CPU/DP0/dpif/dmemaddr
add wave -noupdate -group {Core 0} -group cuif0 /system_tb/DUT/CPU/DP0/cuif/beq
add wave -noupdate -group {Core 0} -group cuif0 /system_tb/DUT/CPU/DP0/cuif/bne
add wave -noupdate -group {Core 0} -group cuif0 /system_tb/DUT/CPU/DP0/cuif/RegWr
add wave -noupdate -group {Core 0} -group cuif0 /system_tb/DUT/CPU/DP0/cuif/ExtOp
add wave -noupdate -group {Core 0} -group cuif0 /system_tb/DUT/CPU/DP0/cuif/iREN
add wave -noupdate -group {Core 0} -group cuif0 /system_tb/DUT/CPU/DP0/cuif/dREN
add wave -noupdate -group {Core 0} -group cuif0 /system_tb/DUT/CPU/DP0/cuif/dWEN
add wave -noupdate -group {Core 0} -group cuif0 /system_tb/DUT/CPU/DP0/cuif/jump
add wave -noupdate -group {Core 0} -group cuif0 /system_tb/DUT/CPU/DP0/cuif/jal
add wave -noupdate -group {Core 0} -group cuif0 /system_tb/DUT/CPU/DP0/cuif/mem2reg
add wave -noupdate -group {Core 0} -group cuif0 /system_tb/DUT/CPU/DP0/cuif/halt
add wave -noupdate -group {Core 0} -group cuif0 /system_tb/DUT/CPU/DP0/cuif/lui
add wave -noupdate -group {Core 0} -group cuif0 /system_tb/DUT/CPU/DP0/cuif/jr
add wave -noupdate -group {Core 0} -group cuif0 /system_tb/DUT/CPU/DP0/cuif/zero
add wave -noupdate -group {Core 0} -group cuif0 /system_tb/DUT/CPU/DP0/cuif/overflow
add wave -noupdate -group {Core 0} -group cuif0 /system_tb/DUT/CPU/DP0/cuif/ALUSrc
add wave -noupdate -group {Core 0} -group cuif0 /system_tb/DUT/CPU/DP0/cuif/RegDst
add wave -noupdate -group {Core 0} -group cuif0 /system_tb/DUT/CPU/DP0/cuif/ALUop
add wave -noupdate -group {Core 0} -group cuif0 /system_tb/DUT/CPU/DP0/cuif/Instruct
add wave -noupdate -group {Core 0} -group cuif0 /system_tb/DUT/CPU/DP0/cuif/funct
add wave -noupdate -group {Core 0} -group aluif0 /system_tb/DUT/CPU/DP0/aluif/ALUOP
add wave -noupdate -group {Core 0} -group aluif0 /system_tb/DUT/CPU/DP0/aluif/port_A
add wave -noupdate -group {Core 0} -group aluif0 /system_tb/DUT/CPU/DP0/aluif/port_B
add wave -noupdate -group {Core 0} -group aluif0 /system_tb/DUT/CPU/DP0/aluif/output_port
add wave -noupdate -group {Core 0} -group aluif0 /system_tb/DUT/CPU/DP0/aluif/negative
add wave -noupdate -group {Core 0} -group aluif0 /system_tb/DUT/CPU/DP0/aluif/overflow
add wave -noupdate -group {Core 0} -group aluif0 /system_tb/DUT/CPU/DP0/aluif/zero
add wave -noupdate -group {Core 0} -group rfif0 -expand /system_tb/DUT/CPU/DP0/REGISTER_FILE/register_array
add wave -noupdate -group {Core 0} -group rfif0 /system_tb/DUT/CPU/DP0/rfif/WEN
add wave -noupdate -group {Core 0} -group rfif0 /system_tb/DUT/CPU/DP0/rfif/wsel
add wave -noupdate -group {Core 0} -group rfif0 /system_tb/DUT/CPU/DP0/rfif/rsel1
add wave -noupdate -group {Core 0} -group rfif0 /system_tb/DUT/CPU/DP0/rfif/rsel2
add wave -noupdate -group {Core 0} -group rfif0 /system_tb/DUT/CPU/DP0/rfif/wdat
add wave -noupdate -group {Core 0} -group rfif0 /system_tb/DUT/CPU/DP0/rfif/rdat1
add wave -noupdate -group {Core 0} -group rfif0 /system_tb/DUT/CPU/DP0/rfif/rdat2
add wave -noupdate -group {Core 0} -group ifid0 /system_tb/DUT/CPU/DP0/ifid/imemload_if
add wave -noupdate -group {Core 0} -group ifid0 /system_tb/DUT/CPU/DP0/ifid/pc_nextstate_if
add wave -noupdate -group {Core 0} -group ifid0 /system_tb/DUT/CPU/DP0/ifid/pc_nextstate_id
add wave -noupdate -group {Core 0} -group ifid0 /system_tb/DUT/CPU/DP0/ifid/imemload_id
add wave -noupdate -group {Core 0} -group ifid0 /system_tb/DUT/CPU/DP0/ifid/imemaddr_if
add wave -noupdate -group {Core 0} -group ifid0 /system_tb/DUT/CPU/DP0/ifid/imemaddr_id
add wave -noupdate -group {Core 0} -group ifid0 /system_tb/DUT/CPU/DP0/ifid/enable_ifid
add wave -noupdate -group {Core 0} -group ifid0 /system_tb/DUT/CPU/DP0/ifid/flush_ifid
add wave -noupdate -group {Core 0} -group ifid0 /system_tb/DUT/CPU/DP0/ifid/branch_hit_if
add wave -noupdate -group {Core 0} -group ifid0 /system_tb/DUT/CPU/DP0/ifid/branch_hit_id
add wave -noupdate -group {Core 0} -group ifid0 /system_tb/DUT/CPU/DP0/ifid/target_address_if
add wave -noupdate -group {Core 0} -group ifid0 /system_tb/DUT/CPU/DP0/ifid/target_address_id
add wave -noupdate -group {Core 0} -group ifid0 /system_tb/DUT/CPU/DP0/ifid/branch_history_if
add wave -noupdate -group {Core 0} -group ifid0 /system_tb/DUT/CPU/DP0/ifid/branch_history_id
add wave -noupdate -group {Core 0} -group idex0 /system_tb/DUT/CPU/DP0/idex/enable_idex
add wave -noupdate -group {Core 0} -group idex0 /system_tb/DUT/CPU/DP0/idex/flush_idex
add wave -noupdate -group {Core 0} -group idex0 /system_tb/DUT/CPU/DP0/idex/pc_nextstate_id
add wave -noupdate -group {Core 0} -group idex0 /system_tb/DUT/CPU/DP0/idex/pc_nextstate_ex
add wave -noupdate -group {Core 0} -group idex0 /system_tb/DUT/CPU/DP0/idex/rdat1_id
add wave -noupdate -group {Core 0} -group idex0 /system_tb/DUT/CPU/DP0/idex/rdat1_ex
add wave -noupdate -group {Core 0} -group idex0 /system_tb/DUT/CPU/DP0/idex/rdat2_id
add wave -noupdate -group {Core 0} -group idex0 /system_tb/DUT/CPU/DP0/idex/rdat2_ex
add wave -noupdate -group {Core 0} -group idex0 /system_tb/DUT/CPU/DP0/idex/imm16_extend_ex
add wave -noupdate -group {Core 0} -group idex0 /system_tb/DUT/CPU/DP0/idex/imemaddr_id
add wave -noupdate -group {Core 0} -group idex0 /system_tb/DUT/CPU/DP0/idex/imemload_id
add wave -noupdate -group {Core 0} -group idex0 /system_tb/DUT/CPU/DP0/idex/imemaddr_ex
add wave -noupdate -group {Core 0} -group idex0 /system_tb/DUT/CPU/DP0/idex/imemload_ex
add wave -noupdate -group {Core 0} -group idex0 /system_tb/DUT/CPU/DP0/idex/ALUop_id
add wave -noupdate -group {Core 0} -group idex0 /system_tb/DUT/CPU/DP0/idex/ALUop_ex
add wave -noupdate -group {Core 0} -group idex0 /system_tb/DUT/CPU/DP0/idex/Rd_id
add wave -noupdate -group {Core 0} -group idex0 /system_tb/DUT/CPU/DP0/idex/Rd_ex
add wave -noupdate -group {Core 0} -group idex0 /system_tb/DUT/CPU/DP0/idex/Rt_id
add wave -noupdate -group {Core 0} -group idex0 /system_tb/DUT/CPU/DP0/idex/Rt_ex
add wave -noupdate -group {Core 0} -group idex0 /system_tb/DUT/CPU/DP0/idex/shamt_ex
add wave -noupdate -group {Core 0} -group idex0 /system_tb/DUT/CPU/DP0/idex/Rs_id
add wave -noupdate -group {Core 0} -group idex0 /system_tb/DUT/CPU/DP0/idex/Rs_ex
add wave -noupdate -group {Core 0} -group idex0 /system_tb/DUT/CPU/DP0/idex/imm16_ex
add wave -noupdate -group {Core 0} -group idex0 /system_tb/DUT/CPU/DP0/idex/imm16_id
add wave -noupdate -group {Core 0} -group idex0 /system_tb/DUT/CPU/DP0/idex/ALUSrc_id
add wave -noupdate -group {Core 0} -group idex0 /system_tb/DUT/CPU/DP0/idex/RegDst_id
add wave -noupdate -group {Core 0} -group idex0 /system_tb/DUT/CPU/DP0/idex/ALUSrc_ex
add wave -noupdate -group {Core 0} -group idex0 /system_tb/DUT/CPU/DP0/idex/RegDst_ex
add wave -noupdate -group {Core 0} -group idex0 /system_tb/DUT/CPU/DP0/idex/RegWr_id
add wave -noupdate -group {Core 0} -group idex0 /system_tb/DUT/CPU/DP0/idex/RegWr_ex
add wave -noupdate -group {Core 0} -group idex0 /system_tb/DUT/CPU/DP0/idex/halt_id
add wave -noupdate -group {Core 0} -group idex0 /system_tb/DUT/CPU/DP0/idex/halt_ex
add wave -noupdate -group {Core 0} -group idex0 /system_tb/DUT/CPU/DP0/idex/lui_id
add wave -noupdate -group {Core 0} -group idex0 /system_tb/DUT/CPU/DP0/idex/lui_ex
add wave -noupdate -group {Core 0} -group idex0 /system_tb/DUT/CPU/DP0/idex/dREN_id
add wave -noupdate -group {Core 0} -group idex0 /system_tb/DUT/CPU/DP0/idex/dREN_ex
add wave -noupdate -group {Core 0} -group idex0 /system_tb/DUT/CPU/DP0/idex/dWEN_id
add wave -noupdate -group {Core 0} -group idex0 /system_tb/DUT/CPU/DP0/idex/dWEN_ex
add wave -noupdate -group {Core 0} -group idex0 /system_tb/DUT/CPU/DP0/idex/beq_id
add wave -noupdate -group {Core 0} -group idex0 /system_tb/DUT/CPU/DP0/idex/beq_ex
add wave -noupdate -group {Core 0} -group idex0 /system_tb/DUT/CPU/DP0/idex/bne_id
add wave -noupdate -group {Core 0} -group idex0 /system_tb/DUT/CPU/DP0/idex/bne_ex
add wave -noupdate -group {Core 0} -group idex0 /system_tb/DUT/CPU/DP0/idex/jump_id
add wave -noupdate -group {Core 0} -group idex0 /system_tb/DUT/CPU/DP0/idex/jump_ex
add wave -noupdate -group {Core 0} -group idex0 /system_tb/DUT/CPU/DP0/idex/jal_id
add wave -noupdate -group {Core 0} -group idex0 /system_tb/DUT/CPU/DP0/idex/jal_ex
add wave -noupdate -group {Core 0} -group idex0 /system_tb/DUT/CPU/DP0/idex/jr_id
add wave -noupdate -group {Core 0} -group idex0 /system_tb/DUT/CPU/DP0/idex/jr_ex
add wave -noupdate -group {Core 0} -group idex0 /system_tb/DUT/CPU/DP0/idex/mem2reg_id
add wave -noupdate -group {Core 0} -group idex0 /system_tb/DUT/CPU/DP0/idex/mem2reg_ex
add wave -noupdate -group {Core 0} -group idex0 /system_tb/DUT/CPU/DP0/idex/ExtOp_id
add wave -noupdate -group {Core 0} -group idex0 /system_tb/DUT/CPU/DP0/idex/ExtOp_ex
add wave -noupdate -group {Core 0} -group idex0 /system_tb/DUT/CPU/DP0/idex/jumpaddr_id
add wave -noupdate -group {Core 0} -group idex0 /system_tb/DUT/CPU/DP0/idex/jumpaddr_ex
add wave -noupdate -group {Core 0} -group idex0 /system_tb/DUT/CPU/DP0/idex/jumpoffset_id
add wave -noupdate -group {Core 0} -group idex0 /system_tb/DUT/CPU/DP0/idex/branch_hit_id
add wave -noupdate -group {Core 0} -group idex0 /system_tb/DUT/CPU/DP0/idex/branch_hit_ex
add wave -noupdate -group {Core 0} -group idex0 /system_tb/DUT/CPU/DP0/idex/target_address_id
add wave -noupdate -group {Core 0} -group idex0 /system_tb/DUT/CPU/DP0/idex/target_address_ex
add wave -noupdate -group {Core 0} -group idex0 /system_tb/DUT/CPU/DP0/idex/branch_history_id
add wave -noupdate -group {Core 0} -group idex0 /system_tb/DUT/CPU/DP0/idex/branch_history_ex
add wave -noupdate -group {Core 0} -group exmem0 /system_tb/DUT/CPU/DP0/exmem/enable_exmem
add wave -noupdate -group {Core 0} -group exmem0 /system_tb/DUT/CPU/DP0/exmem/dhit
add wave -noupdate -group {Core 0} -group exmem0 /system_tb/DUT/CPU/DP0/exmem/flush_exmem
add wave -noupdate -group {Core 0} -group exmem0 /system_tb/DUT/CPU/DP0/exmem/zero_ex
add wave -noupdate -group {Core 0} -group exmem0 /system_tb/DUT/CPU/DP0/exmem/zero_mem
add wave -noupdate -group {Core 0} -group exmem0 /system_tb/DUT/CPU/DP0/exmem/beq_ex
add wave -noupdate -group {Core 0} -group exmem0 /system_tb/DUT/CPU/DP0/exmem/beq_mem
add wave -noupdate -group {Core 0} -group exmem0 /system_tb/DUT/CPU/DP0/exmem/bne_ex
add wave -noupdate -group {Core 0} -group exmem0 /system_tb/DUT/CPU/DP0/exmem/bne_mem
add wave -noupdate -group {Core 0} -group exmem0 /system_tb/DUT/CPU/DP0/exmem/jr_ex
add wave -noupdate -group {Core 0} -group exmem0 /system_tb/DUT/CPU/DP0/exmem/jal_ex
add wave -noupdate -group {Core 0} -group exmem0 /system_tb/DUT/CPU/DP0/exmem/jal_mem
add wave -noupdate -group {Core 0} -group exmem0 /system_tb/DUT/CPU/DP0/exmem/jump_ex
add wave -noupdate -group {Core 0} -group exmem0 /system_tb/DUT/CPU/DP0/exmem/mem2reg_ex
add wave -noupdate -group {Core 0} -group exmem0 /system_tb/DUT/CPU/DP0/exmem/mem2reg_mem
add wave -noupdate -group {Core 0} -group exmem0 /system_tb/DUT/CPU/DP0/exmem/halt_ex
add wave -noupdate -group {Core 0} -group exmem0 /system_tb/DUT/CPU/DP0/exmem/halt_mem
add wave -noupdate -group {Core 0} -group exmem0 /system_tb/DUT/CPU/DP0/exmem/lduse_hit_ex
add wave -noupdate -group {Core 0} -group exmem0 /system_tb/DUT/CPU/DP0/exmem/lduse_hit_mem
add wave -noupdate -group {Core 0} -group exmem0 /system_tb/DUT/CPU/DP0/exmem/lui_ex
add wave -noupdate -group {Core 0} -group exmem0 /system_tb/DUT/CPU/DP0/exmem/lui_mem
add wave -noupdate -group {Core 0} -group exmem0 /system_tb/DUT/CPU/DP0/exmem/dREN_ex
add wave -noupdate -group {Core 0} -group exmem0 /system_tb/DUT/CPU/DP0/exmem/dmemren
add wave -noupdate -group {Core 0} -group exmem0 /system_tb/DUT/CPU/DP0/exmem/dWEN_ex
add wave -noupdate -group {Core 0} -group exmem0 /system_tb/DUT/CPU/DP0/exmem/dmemwen
add wave -noupdate -group {Core 0} -group exmem0 /system_tb/DUT/CPU/DP0/exmem/RegWr_ex
add wave -noupdate -group {Core 0} -group exmem0 /system_tb/DUT/CPU/DP0/exmem/RegWr_mem
add wave -noupdate -group {Core 0} -group exmem0 /system_tb/DUT/CPU/DP0/exmem/RegDst_ex
add wave -noupdate -group {Core 0} -group exmem0 /system_tb/DUT/CPU/DP0/exmem/RegDst_mem
add wave -noupdate -group {Core 0} -group exmem0 /system_tb/DUT/CPU/DP0/exmem/rdat1_ex
add wave -noupdate -group {Core 0} -group exmem0 /system_tb/DUT/CPU/DP0/exmem/rdat2_ex
add wave -noupdate -group {Core 0} -group exmem0 /system_tb/DUT/CPU/DP0/exmem/pc_nextstate_ex
add wave -noupdate -group {Core 0} -group exmem0 /system_tb/DUT/CPU/DP0/exmem/pc_nextstate_mem
add wave -noupdate -group {Core 0} -group exmem0 /system_tb/DUT/CPU/DP0/exmem/dmemaddr
add wave -noupdate -group {Core 0} -group exmem0 /system_tb/DUT/CPU/DP0/exmem/dmemstore
add wave -noupdate -group {Core 0} -group exmem0 /system_tb/DUT/CPU/DP0/exmem/wdat_ex
add wave -noupdate -group {Core 0} -group exmem0 /system_tb/DUT/CPU/DP0/exmem/wdat_mem
add wave -noupdate -group {Core 0} -group exmem0 /system_tb/DUT/CPU/DP0/exmem/branch_target_mem
add wave -noupdate -group {Core 0} -group exmem0 /system_tb/DUT/CPU/DP0/exmem/imemaddr_ex
add wave -noupdate -group {Core 0} -group exmem0 /system_tb/DUT/CPU/DP0/exmem/imemload_ex
add wave -noupdate -group {Core 0} -group exmem0 /system_tb/DUT/CPU/DP0/exmem/imemaddr_mem
add wave -noupdate -group {Core 0} -group exmem0 /system_tb/DUT/CPU/DP0/exmem/imemload_mem
add wave -noupdate -group {Core 0} -group exmem0 /system_tb/DUT/CPU/DP0/exmem/jumpaddr_ex
add wave -noupdate -group {Core 0} -group exmem0 /system_tb/DUT/CPU/DP0/exmem/jumpoffset_ex
add wave -noupdate -group {Core 0} -group exmem0 /system_tb/DUT/CPU/DP0/exmem/imm16_ex
add wave -noupdate -group {Core 0} -group exmem0 /system_tb/DUT/CPU/DP0/exmem/imm16_mem
add wave -noupdate -group {Core 0} -group exmem0 /system_tb/DUT/CPU/DP0/exmem/branch_hit_mem
add wave -noupdate -group {Core 0} -group exmem0 /system_tb/DUT/CPU/DP0/exmem/branch_hit_ex
add wave -noupdate -group {Core 0} -group exmem0 /system_tb/DUT/CPU/DP0/exmem/target_address_mem
add wave -noupdate -group {Core 0} -group exmem0 /system_tb/DUT/CPU/DP0/exmem/target_address_ex
add wave -noupdate -group {Core 0} -group exmem0 /system_tb/DUT/CPU/DP0/exmem/branch_history_mem
add wave -noupdate -group {Core 0} -group exmem0 /system_tb/DUT/CPU/DP0/exmem/branch_history_ex
add wave -noupdate -group {Core 0} -group memwb0 /system_tb/DUT/CPU/DP0/memwb/enable_memwb
add wave -noupdate -group {Core 0} -group memwb0 /system_tb/DUT/CPU/DP0/memwb/dhit
add wave -noupdate -group {Core 0} -group memwb0 /system_tb/DUT/CPU/DP0/memwb/mem2reg_mem
add wave -noupdate -group {Core 0} -group memwb0 /system_tb/DUT/CPU/DP0/memwb/mem2reg_wb
add wave -noupdate -group {Core 0} -group memwb0 /system_tb/DUT/CPU/DP0/memwb/jal_mem
add wave -noupdate -group {Core 0} -group memwb0 /system_tb/DUT/CPU/DP0/memwb/jal_wb
add wave -noupdate -group {Core 0} -group memwb0 /system_tb/DUT/CPU/DP0/memwb/lui_mem
add wave -noupdate -group {Core 0} -group memwb0 /system_tb/DUT/CPU/DP0/memwb/lui_wb
add wave -noupdate -group {Core 0} -group memwb0 /system_tb/DUT/CPU/DP0/memwb/RegWr_mem
add wave -noupdate -group {Core 0} -group memwb0 /system_tb/DUT/CPU/DP0/memwb/RegWr_wb
add wave -noupdate -group {Core 0} -group memwb0 /system_tb/DUT/CPU/DP0/memwb/halt_mem
add wave -noupdate -group {Core 0} -group memwb0 /system_tb/DUT/CPU/DP0/memwb/halt_wb
add wave -noupdate -group {Core 0} -group memwb0 /system_tb/DUT/CPU/DP0/memwb/RegDst_mem
add wave -noupdate -group {Core 0} -group memwb0 /system_tb/DUT/CPU/DP0/memwb/RegDst_wb
add wave -noupdate -group {Core 0} -group memwb0 /system_tb/DUT/CPU/DP0/memwb/wdat_mem
add wave -noupdate -group {Core 0} -group memwb0 /system_tb/DUT/CPU/DP0/memwb/wdat_wb
add wave -noupdate -group {Core 0} -group memwb0 /system_tb/DUT/CPU/DP0/memwb/dmemload
add wave -noupdate -group {Core 0} -group memwb0 /system_tb/DUT/CPU/DP0/memwb/pc_nextstate_mem
add wave -noupdate -group {Core 0} -group memwb0 /system_tb/DUT/CPU/DP0/memwb/pc_nextstate_wb
add wave -noupdate -group {Core 0} -group memwb0 /system_tb/DUT/CPU/DP0/memwb/dmemload_wb
add wave -noupdate -group {Core 0} -group memwb0 /system_tb/DUT/CPU/DP0/memwb/imemaddr_mem
add wave -noupdate -group {Core 0} -group memwb0 /system_tb/DUT/CPU/DP0/memwb/imemload_mem
add wave -noupdate -group {Core 0} -group memwb0 /system_tb/DUT/CPU/DP0/memwb/imemaddr_wb
add wave -noupdate -group {Core 0} -group memwb0 /system_tb/DUT/CPU/DP0/memwb/imemload_wb
add wave -noupdate -group {Core 0} -group memwb0 /system_tb/DUT/CPU/DP0/memwb/imm16_mem
add wave -noupdate -group {Core 0} -group memwb0 /system_tb/DUT/CPU/DP0/memwb/imm16_wb
add wave -noupdate -group {Core 0} -group huif0 /system_tb/DUT/CPU/DP0/huif/flush_idex
add wave -noupdate -group {Core 0} -group huif0 /system_tb/DUT/CPU/DP0/huif/dREN_ex
add wave -noupdate -group {Core 0} -group huif0 /system_tb/DUT/CPU/DP0/huif/dWEN_ex
add wave -noupdate -group {Core 0} -group huif0 /system_tb/DUT/CPU/DP0/huif/stall_ifid
add wave -noupdate -group {Core 0} -group huif0 /system_tb/DUT/CPU/DP0/huif/flush_ifid
add wave -noupdate -group {Core 0} -group huif0 /system_tb/DUT/CPU/DP0/huif/jump_ex
add wave -noupdate -group {Core 0} -group huif0 /system_tb/DUT/CPU/DP0/huif/jump_id
add wave -noupdate -group {Core 0} -group huif0 /system_tb/DUT/CPU/DP0/huif/branch_mem
add wave -noupdate -group {Core 0} -group huif0 /system_tb/DUT/CPU/DP0/huif/dhit
add wave -noupdate -group {Core 0} -group huif0 /system_tb/DUT/CPU/DP0/huif/pc_wen
add wave -noupdate -group {Core 0} -group huif0 /system_tb/DUT/CPU/DP0/huif/lduse_hit
add wave -noupdate -group {Core 0} -group huif0 /system_tb/DUT/CPU/DP0/huif/RegWr_mem
add wave -noupdate -group {Core 0} -group huif0 /system_tb/DUT/CPU/DP0/huif/Rs_id
add wave -noupdate -group {Core 0} -group huif0 /system_tb/DUT/CPU/DP0/huif/Rt_id
add wave -noupdate -group {Core 0} -group huif0 /system_tb/DUT/CPU/DP0/huif/Rt_ex
add wave -noupdate -group {Core 0} -group fuif0 /system_tb/DUT/CPU/DP0/fuif/forward_A
add wave -noupdate -group {Core 0} -group fuif0 /system_tb/DUT/CPU/DP0/fuif/forward_B
add wave -noupdate -group {Core 0} -group fuif0 /system_tb/DUT/CPU/DP0/fuif/RegWr_wb
add wave -noupdate -group {Core 0} -group fuif0 /system_tb/DUT/CPU/DP0/fuif/RegWr_mem
add wave -noupdate -group {Core 0} -group fuif0 /system_tb/DUT/CPU/DP0/fuif/RegDst_wb
add wave -noupdate -group {Core 0} -group fuif0 /system_tb/DUT/CPU/DP0/fuif/RegDst_mem
add wave -noupdate -group {Core 0} -group fuif0 /system_tb/DUT/CPU/DP0/fuif/Rs_ex
add wave -noupdate -group {Core 0} -group fuif0 /system_tb/DUT/CPU/DP0/fuif/Rt_ex
add wave -noupdate -group {Core 0} -group btbif0 /system_tb/DUT/CPU/DP0/BRANCH_TARGET_BUFFER/buffer_0
add wave -noupdate -group {Core 0} -group btbif0 /system_tb/DUT/CPU/DP0/BRANCH_TARGET_BUFFER/buffer_1
add wave -noupdate -group {Core 0} -group btbif0 /system_tb/DUT/CPU/DP0/BRANCH_TARGET_BUFFER/buffer_2
add wave -noupdate -group {Core 0} -group btbif0 /system_tb/DUT/CPU/DP0/BRANCH_TARGET_BUFFER/buffer_3
add wave -noupdate -group {Core 0} -group btbif0 /system_tb/DUT/CPU/DP0/btbif/target_address
add wave -noupdate -group {Core 0} -group btbif0 /system_tb/DUT/CPU/DP0/btbif/target_address_new
add wave -noupdate -group {Core 0} -group btbif0 /system_tb/DUT/CPU/DP0/btbif/tag_bits
add wave -noupdate -group {Core 0} -group btbif0 /system_tb/DUT/CPU/DP0/btbif/tag_bits_new
add wave -noupdate -group {Core 0} -group btbif0 /system_tb/DUT/CPU/DP0/btbif/btb_wen
add wave -noupdate -group {Core 0} -group btbif0 /system_tb/DUT/CPU/DP0/btbif/flush_ifid
add wave -noupdate -group {Core 0} -group btbif0 /system_tb/DUT/CPU/DP0/btbif/flush_exmem
add wave -noupdate -group {Core 0} -group btbif0 /system_tb/DUT/CPU/DP0/btbif/flush_idex
add wave -noupdate -group {Core 0} -group btbif0 /system_tb/DUT/CPU/DP0/btbif/branch_hit
add wave -noupdate -group {Core 0} -group btbif0 /system_tb/DUT/CPU/DP0/btbif/slot_enabled
add wave -noupdate -group {Core 0} -group btbif0 /system_tb/DUT/CPU/DP0/btbif/mapping_sel
add wave -noupdate -group {Core 0} -group btbif0 /system_tb/DUT/CPU/DP0/btbif/mapping_wsel
add wave -noupdate -group {Core 0} -group btbif0 /system_tb/DUT/CPU/DP0/btbif/branch_history
add wave -noupdate -group {Core 0} -group btbif0 /system_tb/DUT/CPU/DP0/btbif/branch_history_new
add wave -noupdate -group {Core 0} -group bpif0 /system_tb/DUT/CPU/DP0/bpif/decision
add wave -noupdate -group {Core 0} -group bpif0 /system_tb/DUT/CPU/DP0/bpif/wrong_prediction
add wave -noupdate -group {Core 0} -group bpif0 /system_tb/DUT/CPU/DP0/bpif/branch_mem
add wave -noupdate -group {Core 0} -group bpif0 /system_tb/DUT/CPU/DP0/bpif/branch_history
add wave -noupdate -group {Core 0} -group bpif0 /system_tb/DUT/CPU/DP0/bpif/branch_history_new
add wave -noupdate -group {Core 0} -group icache0 /system_tb/DUT/CPU/CM0/ICACHE/cache_entry
add wave -noupdate -group {Core 0} -group icache0 /system_tb/DUT/CPU/CM0/ICACHE/icache_addr
add wave -noupdate -group {Core 0} -group dcache0 /system_tb/DUT/CPU/CM0/DCACHE/cache_entry
add wave -noupdate -group {Core 0} -group dcache0 /system_tb/DUT/CPU/CM0/DCACHE/nextstate_cache_entry
add wave -noupdate -group {Core 0} -group dcache0 /system_tb/DUT/CPU/CM0/DCACHE/snoop_cache_entry
add wave -noupdate -group {Core 0} -group dcache0 /system_tb/DUT/CPU/CM0/DCACHE/link_register
add wave -noupdate -group {Core 0} -group dcache0 /system_tb/DUT/CPU/CM0/DCACHE/nextstate_link_register
add wave -noupdate -group {Core 0} -group dcache0 /system_tb/DUT/CPU/CM0/DCACHE/dcache_addr
add wave -noupdate -group {Core 0} -group dcache0 /system_tb/DUT/CPU/CM0/DCACHE/snoop_addr
add wave -noupdate -group {Core 0} -group dcache0 /system_tb/DUT/CPU/CM0/DCACHE/hit_count
add wave -noupdate -group {Core 0} -group dcache0 /system_tb/DUT/CPU/CM0/DCACHE/nextstate_hit_count
add wave -noupdate -group {Core 0} -group dcache0 /system_tb/DUT/CPU/CM0/DCACHE/nru
add wave -noupdate -group {Core 0} -group dcache0 /system_tb/DUT/CPU/CM0/DCACHE/nextstate_nru
add wave -noupdate -group {Core 0} -group dcache0 /system_tb/DUT/CPU/CM0/DCACHE/frame
add wave -noupdate -group {Core 0} -group dcache0 /system_tb/DUT/CPU/CM0/DCACHE/next_frame
add wave -noupdate -group {Core 0} -group dcache0 /system_tb/DUT/CPU/CM0/DCACHE/cache_miss
add wave -noupdate -group {Core 0} -group dcache0 /system_tb/DUT/CPU/CM0/DCACHE/dirty_snoop
add wave -noupdate -group {Core 0} -group dcache0 /system_tb/DUT/CPU/CM0/DCACHE/cache_state
add wave -noupdate -group {Core 0} -group dcache0 /system_tb/DUT/CPU/CM0/DCACHE/cache_nextstate
add wave -noupdate -group {Core 1} /system_tb/DUT/CPU/DP1/ifid/imemload_if
add wave -noupdate -group {Core 1} /system_tb/DUT/CPU/DP1/ifid/imemload_id
add wave -noupdate -group {Core 1} /system_tb/DUT/CPU/DP1/exmem/imemload_ex
add wave -noupdate -group {Core 1} /system_tb/DUT/CPU/DP1/exmem/imemload_mem
add wave -noupdate -group {Core 1} /system_tb/DUT/CPU/DP1/memwb/imemload_wb
add wave -noupdate -group {Core 1} /system_tb/DUT/CPU/DP1/ifid/imemaddr_if
add wave -noupdate -group {Core 1} /system_tb/DUT/CPU/DP1/ifid/imemaddr_id
add wave -noupdate -group {Core 1} /system_tb/DUT/CPU/DP1/exmem/imemaddr_ex
add wave -noupdate -group {Core 1} /system_tb/DUT/CPU/DP1/memwb/imemaddr_mem
add wave -noupdate -group {Core 1} /system_tb/DUT/CPU/DP1/memwb/imemaddr_wb
add wave -noupdate -group {Core 1} -group pcif1 /system_tb/DUT/CPU/DP1/pc_input
add wave -noupdate -group {Core 1} -group pcif1 /system_tb/DUT/CPU/DP1/pc_output
add wave -noupdate -group {Core 1} -group pcif1 /system_tb/DUT/CPU/DP1/pc_nextstate
add wave -noupdate -group {Core 1} -group pcif1 /system_tb/DUT/CPU/DP1/pc_wen
add wave -noupdate -group {Core 1} -group pcif1 /system_tb/DUT/CPU/DP1/PCSrc
add wave -noupdate -group {Core 1} -group dcif1 /system_tb/DUT/CPU/dcif1/halt
add wave -noupdate -group {Core 1} -group dcif1 /system_tb/DUT/CPU/dcif1/ihit
add wave -noupdate -group {Core 1} -group dcif1 /system_tb/DUT/CPU/dcif1/imemREN
add wave -noupdate -group {Core 1} -group dcif1 /system_tb/DUT/CPU/dcif1/imemload
add wave -noupdate -group {Core 1} -group dcif1 /system_tb/DUT/CPU/dcif1/imemaddr
add wave -noupdate -group {Core 1} -group dcif1 /system_tb/DUT/CPU/dcif1/dhit
add wave -noupdate -group {Core 1} -group dcif1 /system_tb/DUT/CPU/dcif1/datomic
add wave -noupdate -group {Core 1} -group dcif1 /system_tb/DUT/CPU/dcif1/dmemREN
add wave -noupdate -group {Core 1} -group dcif1 /system_tb/DUT/CPU/dcif1/dmemWEN
add wave -noupdate -group {Core 1} -group dcif1 /system_tb/DUT/CPU/dcif1/flushed
add wave -noupdate -group {Core 1} -group dcif1 /system_tb/DUT/CPU/dcif1/dmemload
add wave -noupdate -group {Core 1} -group dcif1 /system_tb/DUT/CPU/dcif1/dmemstore
add wave -noupdate -group {Core 1} -group dcif1 /system_tb/DUT/CPU/dcif1/dmemaddr
add wave -noupdate -group {Core 1} -group cif1 /system_tb/DUT/CPU/cif1/iwait
add wave -noupdate -group {Core 1} -group cif1 /system_tb/DUT/CPU/cif1/dwait
add wave -noupdate -group {Core 1} -group cif1 /system_tb/DUT/CPU/cif1/iREN
add wave -noupdate -group {Core 1} -group cif1 /system_tb/DUT/CPU/cif1/dREN
add wave -noupdate -group {Core 1} -group cif1 /system_tb/DUT/CPU/cif1/dWEN
add wave -noupdate -group {Core 1} -group cif1 /system_tb/DUT/CPU/cif1/iload
add wave -noupdate -group {Core 1} -group cif1 /system_tb/DUT/CPU/cif1/dload
add wave -noupdate -group {Core 1} -group cif1 /system_tb/DUT/CPU/cif1/dstore
add wave -noupdate -group {Core 1} -group cif1 /system_tb/DUT/CPU/cif1/iaddr
add wave -noupdate -group {Core 1} -group cif1 /system_tb/DUT/CPU/cif1/daddr
add wave -noupdate -group {Core 1} -group cif1 /system_tb/DUT/CPU/cif1/ccwait
add wave -noupdate -group {Core 1} -group cif1 /system_tb/DUT/CPU/cif1/ccinv
add wave -noupdate -group {Core 1} -group cif1 /system_tb/DUT/CPU/cif1/ccwrite
add wave -noupdate -group {Core 1} -group cif1 /system_tb/DUT/CPU/cif1/cctrans
add wave -noupdate -group {Core 1} -group cif1 /system_tb/DUT/CPU/cif1/ccsnoopaddr
add wave -noupdate -group {Core 1} -group dpif1 /system_tb/DUT/CPU/DP1/dpif/halt
add wave -noupdate -group {Core 1} -group dpif1 /system_tb/DUT/CPU/DP1/dpif/ihit
add wave -noupdate -group {Core 1} -group dpif1 /system_tb/DUT/CPU/DP1/dpif/imemREN
add wave -noupdate -group {Core 1} -group dpif1 /system_tb/DUT/CPU/DP1/dpif/imemload
add wave -noupdate -group {Core 1} -group dpif1 /system_tb/DUT/CPU/DP1/dpif/imemaddr
add wave -noupdate -group {Core 1} -group dpif1 /system_tb/DUT/CPU/DP1/dpif/dhit
add wave -noupdate -group {Core 1} -group dpif1 /system_tb/DUT/CPU/DP1/dpif/datomic
add wave -noupdate -group {Core 1} -group dpif1 /system_tb/DUT/CPU/DP1/dpif/dmemREN
add wave -noupdate -group {Core 1} -group dpif1 /system_tb/DUT/CPU/DP1/dpif/dmemWEN
add wave -noupdate -group {Core 1} -group dpif1 /system_tb/DUT/CPU/DP1/dpif/flushed
add wave -noupdate -group {Core 1} -group dpif1 /system_tb/DUT/CPU/DP1/dpif/dmemload
add wave -noupdate -group {Core 1} -group dpif1 /system_tb/DUT/CPU/DP1/dpif/dmemstore
add wave -noupdate -group {Core 1} -group dpif1 /system_tb/DUT/CPU/DP1/dpif/dmemaddr
add wave -noupdate -group {Core 1} -group cuif1 /system_tb/DUT/CPU/DP1/cuif/beq
add wave -noupdate -group {Core 1} -group cuif1 /system_tb/DUT/CPU/DP1/cuif/bne
add wave -noupdate -group {Core 1} -group cuif1 /system_tb/DUT/CPU/DP1/cuif/RegWr
add wave -noupdate -group {Core 1} -group cuif1 /system_tb/DUT/CPU/DP1/cuif/ExtOp
add wave -noupdate -group {Core 1} -group cuif1 /system_tb/DUT/CPU/DP1/cuif/iREN
add wave -noupdate -group {Core 1} -group cuif1 /system_tb/DUT/CPU/DP1/cuif/dREN
add wave -noupdate -group {Core 1} -group cuif1 /system_tb/DUT/CPU/DP1/cuif/dWEN
add wave -noupdate -group {Core 1} -group cuif1 /system_tb/DUT/CPU/DP1/cuif/jump
add wave -noupdate -group {Core 1} -group cuif1 /system_tb/DUT/CPU/DP1/cuif/jal
add wave -noupdate -group {Core 1} -group cuif1 /system_tb/DUT/CPU/DP1/cuif/mem2reg
add wave -noupdate -group {Core 1} -group cuif1 /system_tb/DUT/CPU/DP1/cuif/halt
add wave -noupdate -group {Core 1} -group cuif1 /system_tb/DUT/CPU/DP1/cuif/lui
add wave -noupdate -group {Core 1} -group cuif1 /system_tb/DUT/CPU/DP1/cuif/jr
add wave -noupdate -group {Core 1} -group cuif1 /system_tb/DUT/CPU/DP1/cuif/zero
add wave -noupdate -group {Core 1} -group cuif1 /system_tb/DUT/CPU/DP1/cuif/overflow
add wave -noupdate -group {Core 1} -group cuif1 /system_tb/DUT/CPU/DP1/cuif/ALUSrc
add wave -noupdate -group {Core 1} -group cuif1 /system_tb/DUT/CPU/DP1/cuif/RegDst
add wave -noupdate -group {Core 1} -group cuif1 /system_tb/DUT/CPU/DP1/cuif/ALUop
add wave -noupdate -group {Core 1} -group cuif1 /system_tb/DUT/CPU/DP1/cuif/Instruct
add wave -noupdate -group {Core 1} -group cuif1 /system_tb/DUT/CPU/DP1/cuif/funct
add wave -noupdate -group {Core 1} -group aluif1 /system_tb/DUT/CPU/DP1/aluif/ALUOP
add wave -noupdate -group {Core 1} -group aluif1 /system_tb/DUT/CPU/DP1/aluif/port_A
add wave -noupdate -group {Core 1} -group aluif1 /system_tb/DUT/CPU/DP1/aluif/port_B
add wave -noupdate -group {Core 1} -group aluif1 /system_tb/DUT/CPU/DP1/aluif/output_port
add wave -noupdate -group {Core 1} -group aluif1 /system_tb/DUT/CPU/DP1/aluif/negative
add wave -noupdate -group {Core 1} -group aluif1 /system_tb/DUT/CPU/DP1/aluif/overflow
add wave -noupdate -group {Core 1} -group aluif1 /system_tb/DUT/CPU/DP1/aluif/zero
add wave -noupdate -group {Core 1} -group rfif1 /system_tb/DUT/CPU/DP1/REGISTER_FILE/register_array
add wave -noupdate -group {Core 1} -group rfif1 /system_tb/DUT/CPU/DP1/rfif/WEN
add wave -noupdate -group {Core 1} -group rfif1 /system_tb/DUT/CPU/DP1/rfif/wsel
add wave -noupdate -group {Core 1} -group rfif1 /system_tb/DUT/CPU/DP1/rfif/rsel1
add wave -noupdate -group {Core 1} -group rfif1 /system_tb/DUT/CPU/DP1/rfif/rsel2
add wave -noupdate -group {Core 1} -group rfif1 /system_tb/DUT/CPU/DP1/rfif/wdat
add wave -noupdate -group {Core 1} -group rfif1 /system_tb/DUT/CPU/DP1/rfif/rdat1
add wave -noupdate -group {Core 1} -group rfif1 /system_tb/DUT/CPU/DP1/rfif/rdat2
add wave -noupdate -group {Core 1} -group ifid1 /system_tb/DUT/CPU/DP1/ifid/imemload_if
add wave -noupdate -group {Core 1} -group ifid1 /system_tb/DUT/CPU/DP1/ifid/pc_nextstate_if
add wave -noupdate -group {Core 1} -group ifid1 /system_tb/DUT/CPU/DP1/ifid/pc_nextstate_id
add wave -noupdate -group {Core 1} -group ifid1 /system_tb/DUT/CPU/DP1/ifid/imemload_id
add wave -noupdate -group {Core 1} -group ifid1 /system_tb/DUT/CPU/DP1/ifid/imemaddr_if
add wave -noupdate -group {Core 1} -group ifid1 /system_tb/DUT/CPU/DP1/ifid/imemaddr_id
add wave -noupdate -group {Core 1} -group ifid1 /system_tb/DUT/CPU/DP1/ifid/enable_ifid
add wave -noupdate -group {Core 1} -group ifid1 /system_tb/DUT/CPU/DP1/ifid/flush_ifid
add wave -noupdate -group {Core 1} -group ifid1 /system_tb/DUT/CPU/DP1/ifid/branch_hit_if
add wave -noupdate -group {Core 1} -group ifid1 /system_tb/DUT/CPU/DP1/ifid/branch_hit_id
add wave -noupdate -group {Core 1} -group ifid1 /system_tb/DUT/CPU/DP1/ifid/target_address_if
add wave -noupdate -group {Core 1} -group ifid1 /system_tb/DUT/CPU/DP1/ifid/target_address_id
add wave -noupdate -group {Core 1} -group ifid1 /system_tb/DUT/CPU/DP1/ifid/branch_history_if
add wave -noupdate -group {Core 1} -group ifid1 /system_tb/DUT/CPU/DP1/ifid/branch_history_id
add wave -noupdate -group {Core 1} -group idex1 /system_tb/DUT/CPU/DP1/idex/enable_idex
add wave -noupdate -group {Core 1} -group idex1 /system_tb/DUT/CPU/DP1/idex/flush_idex
add wave -noupdate -group {Core 1} -group idex1 /system_tb/DUT/CPU/DP1/idex/pc_nextstate_id
add wave -noupdate -group {Core 1} -group idex1 /system_tb/DUT/CPU/DP1/idex/pc_nextstate_ex
add wave -noupdate -group {Core 1} -group idex1 /system_tb/DUT/CPU/DP1/idex/rdat1_id
add wave -noupdate -group {Core 1} -group idex1 /system_tb/DUT/CPU/DP1/idex/rdat1_ex
add wave -noupdate -group {Core 1} -group idex1 /system_tb/DUT/CPU/DP1/idex/rdat2_id
add wave -noupdate -group {Core 1} -group idex1 /system_tb/DUT/CPU/DP1/idex/rdat2_ex
add wave -noupdate -group {Core 1} -group idex1 /system_tb/DUT/CPU/DP1/idex/imm16_extend_ex
add wave -noupdate -group {Core 1} -group idex1 /system_tb/DUT/CPU/DP1/idex/imemaddr_id
add wave -noupdate -group {Core 1} -group idex1 /system_tb/DUT/CPU/DP1/idex/imemload_id
add wave -noupdate -group {Core 1} -group idex1 /system_tb/DUT/CPU/DP1/idex/imemaddr_ex
add wave -noupdate -group {Core 1} -group idex1 /system_tb/DUT/CPU/DP1/idex/imemload_ex
add wave -noupdate -group {Core 1} -group idex1 /system_tb/DUT/CPU/DP1/idex/ALUop_id
add wave -noupdate -group {Core 1} -group idex1 /system_tb/DUT/CPU/DP1/idex/ALUop_ex
add wave -noupdate -group {Core 1} -group idex1 /system_tb/DUT/CPU/DP1/idex/Rd_id
add wave -noupdate -group {Core 1} -group idex1 /system_tb/DUT/CPU/DP1/idex/Rd_ex
add wave -noupdate -group {Core 1} -group idex1 /system_tb/DUT/CPU/DP1/idex/Rt_id
add wave -noupdate -group {Core 1} -group idex1 /system_tb/DUT/CPU/DP1/idex/Rt_ex
add wave -noupdate -group {Core 1} -group idex1 /system_tb/DUT/CPU/DP1/idex/shamt_ex
add wave -noupdate -group {Core 1} -group idex1 /system_tb/DUT/CPU/DP1/idex/Rs_id
add wave -noupdate -group {Core 1} -group idex1 /system_tb/DUT/CPU/DP1/idex/Rs_ex
add wave -noupdate -group {Core 1} -group idex1 /system_tb/DUT/CPU/DP1/idex/imm16_ex
add wave -noupdate -group {Core 1} -group idex1 /system_tb/DUT/CPU/DP1/idex/imm16_id
add wave -noupdate -group {Core 1} -group idex1 /system_tb/DUT/CPU/DP1/idex/ALUSrc_id
add wave -noupdate -group {Core 1} -group idex1 /system_tb/DUT/CPU/DP1/idex/RegDst_id
add wave -noupdate -group {Core 1} -group idex1 /system_tb/DUT/CPU/DP1/idex/ALUSrc_ex
add wave -noupdate -group {Core 1} -group idex1 /system_tb/DUT/CPU/DP1/idex/RegDst_ex
add wave -noupdate -group {Core 1} -group idex1 /system_tb/DUT/CPU/DP1/idex/RegWr_id
add wave -noupdate -group {Core 1} -group idex1 /system_tb/DUT/CPU/DP1/idex/RegWr_ex
add wave -noupdate -group {Core 1} -group idex1 /system_tb/DUT/CPU/DP1/idex/halt_id
add wave -noupdate -group {Core 1} -group idex1 /system_tb/DUT/CPU/DP1/idex/halt_ex
add wave -noupdate -group {Core 1} -group idex1 /system_tb/DUT/CPU/DP1/idex/lui_id
add wave -noupdate -group {Core 1} -group idex1 /system_tb/DUT/CPU/DP1/idex/lui_ex
add wave -noupdate -group {Core 1} -group idex1 /system_tb/DUT/CPU/DP1/idex/dREN_id
add wave -noupdate -group {Core 1} -group idex1 /system_tb/DUT/CPU/DP1/idex/dREN_ex
add wave -noupdate -group {Core 1} -group idex1 /system_tb/DUT/CPU/DP1/idex/dWEN_id
add wave -noupdate -group {Core 1} -group idex1 /system_tb/DUT/CPU/DP1/idex/dWEN_ex
add wave -noupdate -group {Core 1} -group idex1 /system_tb/DUT/CPU/DP1/idex/beq_id
add wave -noupdate -group {Core 1} -group idex1 /system_tb/DUT/CPU/DP1/idex/beq_ex
add wave -noupdate -group {Core 1} -group idex1 /system_tb/DUT/CPU/DP1/idex/bne_id
add wave -noupdate -group {Core 1} -group idex1 /system_tb/DUT/CPU/DP1/idex/bne_ex
add wave -noupdate -group {Core 1} -group idex1 /system_tb/DUT/CPU/DP1/idex/jump_id
add wave -noupdate -group {Core 1} -group idex1 /system_tb/DUT/CPU/DP1/idex/jump_ex
add wave -noupdate -group {Core 1} -group idex1 /system_tb/DUT/CPU/DP1/idex/jal_id
add wave -noupdate -group {Core 1} -group idex1 /system_tb/DUT/CPU/DP1/idex/jal_ex
add wave -noupdate -group {Core 1} -group idex1 /system_tb/DUT/CPU/DP1/idex/jr_id
add wave -noupdate -group {Core 1} -group idex1 /system_tb/DUT/CPU/DP1/idex/jr_ex
add wave -noupdate -group {Core 1} -group idex1 /system_tb/DUT/CPU/DP1/idex/mem2reg_id
add wave -noupdate -group {Core 1} -group idex1 /system_tb/DUT/CPU/DP1/idex/mem2reg_ex
add wave -noupdate -group {Core 1} -group idex1 /system_tb/DUT/CPU/DP1/idex/ExtOp_id
add wave -noupdate -group {Core 1} -group idex1 /system_tb/DUT/CPU/DP1/idex/ExtOp_ex
add wave -noupdate -group {Core 1} -group idex1 /system_tb/DUT/CPU/DP1/idex/jumpaddr_id
add wave -noupdate -group {Core 1} -group idex1 /system_tb/DUT/CPU/DP1/idex/jumpaddr_ex
add wave -noupdate -group {Core 1} -group idex1 /system_tb/DUT/CPU/DP1/idex/jumpoffset_id
add wave -noupdate -group {Core 1} -group idex1 /system_tb/DUT/CPU/DP1/idex/branch_hit_id
add wave -noupdate -group {Core 1} -group idex1 /system_tb/DUT/CPU/DP1/idex/branch_hit_ex
add wave -noupdate -group {Core 1} -group idex1 /system_tb/DUT/CPU/DP1/idex/target_address_id
add wave -noupdate -group {Core 1} -group idex1 /system_tb/DUT/CPU/DP1/idex/target_address_ex
add wave -noupdate -group {Core 1} -group idex1 /system_tb/DUT/CPU/DP1/idex/branch_history_id
add wave -noupdate -group {Core 1} -group idex1 /system_tb/DUT/CPU/DP1/idex/branch_history_ex
add wave -noupdate -group {Core 1} -group exmem1 /system_tb/DUT/CPU/DP1/exmem/enable_exmem
add wave -noupdate -group {Core 1} -group exmem1 /system_tb/DUT/CPU/DP1/exmem/dhit
add wave -noupdate -group {Core 1} -group exmem1 /system_tb/DUT/CPU/DP1/exmem/flush_exmem
add wave -noupdate -group {Core 1} -group exmem1 /system_tb/DUT/CPU/DP1/exmem/zero_ex
add wave -noupdate -group {Core 1} -group exmem1 /system_tb/DUT/CPU/DP1/exmem/zero_mem
add wave -noupdate -group {Core 1} -group exmem1 /system_tb/DUT/CPU/DP1/exmem/beq_ex
add wave -noupdate -group {Core 1} -group exmem1 /system_tb/DUT/CPU/DP1/exmem/beq_mem
add wave -noupdate -group {Core 1} -group exmem1 /system_tb/DUT/CPU/DP1/exmem/bne_ex
add wave -noupdate -group {Core 1} -group exmem1 /system_tb/DUT/CPU/DP1/exmem/bne_mem
add wave -noupdate -group {Core 1} -group exmem1 /system_tb/DUT/CPU/DP1/exmem/jr_ex
add wave -noupdate -group {Core 1} -group exmem1 /system_tb/DUT/CPU/DP1/exmem/jal_ex
add wave -noupdate -group {Core 1} -group exmem1 /system_tb/DUT/CPU/DP1/exmem/jal_mem
add wave -noupdate -group {Core 1} -group exmem1 /system_tb/DUT/CPU/DP1/exmem/jump_ex
add wave -noupdate -group {Core 1} -group exmem1 /system_tb/DUT/CPU/DP1/exmem/mem2reg_ex
add wave -noupdate -group {Core 1} -group exmem1 /system_tb/DUT/CPU/DP1/exmem/mem2reg_mem
add wave -noupdate -group {Core 1} -group exmem1 /system_tb/DUT/CPU/DP1/exmem/halt_ex
add wave -noupdate -group {Core 1} -group exmem1 /system_tb/DUT/CPU/DP1/exmem/halt_mem
add wave -noupdate -group {Core 1} -group exmem1 /system_tb/DUT/CPU/DP1/exmem/lduse_hit_ex
add wave -noupdate -group {Core 1} -group exmem1 /system_tb/DUT/CPU/DP1/exmem/lduse_hit_mem
add wave -noupdate -group {Core 1} -group exmem1 /system_tb/DUT/CPU/DP1/exmem/lui_ex
add wave -noupdate -group {Core 1} -group exmem1 /system_tb/DUT/CPU/DP1/exmem/lui_mem
add wave -noupdate -group {Core 1} -group exmem1 /system_tb/DUT/CPU/DP1/exmem/dREN_ex
add wave -noupdate -group {Core 1} -group exmem1 /system_tb/DUT/CPU/DP1/exmem/dmemren
add wave -noupdate -group {Core 1} -group exmem1 /system_tb/DUT/CPU/DP1/exmem/dWEN_ex
add wave -noupdate -group {Core 1} -group exmem1 /system_tb/DUT/CPU/DP1/exmem/dmemwen
add wave -noupdate -group {Core 1} -group exmem1 /system_tb/DUT/CPU/DP1/exmem/RegWr_ex
add wave -noupdate -group {Core 1} -group exmem1 /system_tb/DUT/CPU/DP1/exmem/RegWr_mem
add wave -noupdate -group {Core 1} -group exmem1 /system_tb/DUT/CPU/DP1/exmem/RegDst_ex
add wave -noupdate -group {Core 1} -group exmem1 /system_tb/DUT/CPU/DP1/exmem/RegDst_mem
add wave -noupdate -group {Core 1} -group exmem1 /system_tb/DUT/CPU/DP1/exmem/rdat1_ex
add wave -noupdate -group {Core 1} -group exmem1 /system_tb/DUT/CPU/DP1/exmem/rdat2_ex
add wave -noupdate -group {Core 1} -group exmem1 /system_tb/DUT/CPU/DP1/exmem/pc_nextstate_ex
add wave -noupdate -group {Core 1} -group exmem1 /system_tb/DUT/CPU/DP1/exmem/pc_nextstate_mem
add wave -noupdate -group {Core 1} -group exmem1 /system_tb/DUT/CPU/DP1/exmem/dmemaddr
add wave -noupdate -group {Core 1} -group exmem1 /system_tb/DUT/CPU/DP1/exmem/dmemstore
add wave -noupdate -group {Core 1} -group exmem1 /system_tb/DUT/CPU/DP1/exmem/wdat_ex
add wave -noupdate -group {Core 1} -group exmem1 /system_tb/DUT/CPU/DP1/exmem/wdat_mem
add wave -noupdate -group {Core 1} -group exmem1 /system_tb/DUT/CPU/DP1/exmem/branch_target_ex
add wave -noupdate -group {Core 1} -group exmem1 /system_tb/DUT/CPU/DP1/exmem/branch_target_mem
add wave -noupdate -group {Core 1} -group exmem1 /system_tb/DUT/CPU/DP1/exmem/imemaddr_ex
add wave -noupdate -group {Core 1} -group exmem1 /system_tb/DUT/CPU/DP1/exmem/imemload_ex
add wave -noupdate -group {Core 1} -group exmem1 /system_tb/DUT/CPU/DP1/exmem/imemaddr_mem
add wave -noupdate -group {Core 1} -group exmem1 /system_tb/DUT/CPU/DP1/exmem/imemload_mem
add wave -noupdate -group {Core 1} -group exmem1 /system_tb/DUT/CPU/DP1/exmem/dmemload_mem
add wave -noupdate -group {Core 1} -group exmem1 /system_tb/DUT/CPU/DP1/exmem/jumpaddr_ex
add wave -noupdate -group {Core 1} -group exmem1 /system_tb/DUT/CPU/DP1/exmem/jumpoffset_ex
add wave -noupdate -group {Core 1} -group exmem1 /system_tb/DUT/CPU/DP1/exmem/imm16_ex
add wave -noupdate -group {Core 1} -group exmem1 /system_tb/DUT/CPU/DP1/exmem/imm16_mem
add wave -noupdate -group {Core 1} -group exmem1 /system_tb/DUT/CPU/DP1/exmem/branch_hit_mem
add wave -noupdate -group {Core 1} -group exmem1 /system_tb/DUT/CPU/DP1/exmem/branch_hit_ex
add wave -noupdate -group {Core 1} -group exmem1 /system_tb/DUT/CPU/DP1/exmem/target_address_mem
add wave -noupdate -group {Core 1} -group exmem1 /system_tb/DUT/CPU/DP1/exmem/target_address_ex
add wave -noupdate -group {Core 1} -group exmem1 /system_tb/DUT/CPU/DP1/exmem/branch_history_mem
add wave -noupdate -group {Core 1} -group exmem1 /system_tb/DUT/CPU/DP1/exmem/branch_history_ex
add wave -noupdate -group {Core 1} -group memwb1 /system_tb/DUT/CPU/DP1/memwb/enable_memwb
add wave -noupdate -group {Core 1} -group memwb1 /system_tb/DUT/CPU/DP1/memwb/dhit
add wave -noupdate -group {Core 1} -group memwb1 /system_tb/DUT/CPU/DP1/memwb/mem2reg_mem
add wave -noupdate -group {Core 1} -group memwb1 /system_tb/DUT/CPU/DP1/memwb/mem2reg_wb
add wave -noupdate -group {Core 1} -group memwb1 /system_tb/DUT/CPU/DP1/memwb/jal_mem
add wave -noupdate -group {Core 1} -group memwb1 /system_tb/DUT/CPU/DP1/memwb/jal_wb
add wave -noupdate -group {Core 1} -group memwb1 /system_tb/DUT/CPU/DP1/memwb/lui_mem
add wave -noupdate -group {Core 1} -group memwb1 /system_tb/DUT/CPU/DP1/memwb/lui_wb
add wave -noupdate -group {Core 1} -group memwb1 /system_tb/DUT/CPU/DP1/memwb/RegWr_mem
add wave -noupdate -group {Core 1} -group memwb1 /system_tb/DUT/CPU/DP1/memwb/RegWr_wb
add wave -noupdate -group {Core 1} -group memwb1 /system_tb/DUT/CPU/DP1/memwb/halt_mem
add wave -noupdate -group {Core 1} -group memwb1 /system_tb/DUT/CPU/DP1/memwb/halt_wb
add wave -noupdate -group {Core 1} -group memwb1 /system_tb/DUT/CPU/DP1/memwb/RegDst_mem
add wave -noupdate -group {Core 1} -group memwb1 /system_tb/DUT/CPU/DP1/memwb/RegDst_wb
add wave -noupdate -group {Core 1} -group memwb1 /system_tb/DUT/CPU/DP1/memwb/wdat_mem
add wave -noupdate -group {Core 1} -group memwb1 /system_tb/DUT/CPU/DP1/memwb/wdat_wb
add wave -noupdate -group {Core 1} -group memwb1 /system_tb/DUT/CPU/DP1/memwb/dmemload
add wave -noupdate -group {Core 1} -group memwb1 /system_tb/DUT/CPU/DP1/memwb/pc_nextstate_mem
add wave -noupdate -group {Core 1} -group memwb1 /system_tb/DUT/CPU/DP1/memwb/pc_nextstate_wb
add wave -noupdate -group {Core 1} -group memwb1 /system_tb/DUT/CPU/DP1/memwb/dmemload_wb
add wave -noupdate -group {Core 1} -group memwb1 /system_tb/DUT/CPU/DP1/memwb/imemaddr_mem
add wave -noupdate -group {Core 1} -group memwb1 /system_tb/DUT/CPU/DP1/memwb/imemload_mem
add wave -noupdate -group {Core 1} -group memwb1 /system_tb/DUT/CPU/DP1/memwb/imemaddr_wb
add wave -noupdate -group {Core 1} -group memwb1 /system_tb/DUT/CPU/DP1/memwb/imemload_wb
add wave -noupdate -group {Core 1} -group memwb1 /system_tb/DUT/CPU/DP1/memwb/imm16_mem
add wave -noupdate -group {Core 1} -group memwb1 /system_tb/DUT/CPU/DP1/memwb/imm16_wb
add wave -noupdate -group {Core 1} -group huif1 /system_tb/DUT/CPU/DP1/huif/flush_idex
add wave -noupdate -group {Core 1} -group huif1 /system_tb/DUT/CPU/DP1/huif/dREN_ex
add wave -noupdate -group {Core 1} -group huif1 /system_tb/DUT/CPU/DP1/huif/dWEN_ex
add wave -noupdate -group {Core 1} -group huif1 /system_tb/DUT/CPU/DP1/huif/stall_ifid
add wave -noupdate -group {Core 1} -group huif1 /system_tb/DUT/CPU/DP1/huif/flush_ifid
add wave -noupdate -group {Core 1} -group huif1 /system_tb/DUT/CPU/DP1/huif/jump_ex
add wave -noupdate -group {Core 1} -group huif1 /system_tb/DUT/CPU/DP1/huif/jump_id
add wave -noupdate -group {Core 1} -group huif1 /system_tb/DUT/CPU/DP1/huif/branch_mem
add wave -noupdate -group {Core 1} -group huif1 /system_tb/DUT/CPU/DP1/huif/dhit
add wave -noupdate -group {Core 1} -group huif1 /system_tb/DUT/CPU/DP1/huif/pc_wen
add wave -noupdate -group {Core 1} -group huif1 /system_tb/DUT/CPU/DP1/huif/lduse_hit
add wave -noupdate -group {Core 1} -group huif1 /system_tb/DUT/CPU/DP1/huif/RegWr_mem
add wave -noupdate -group {Core 1} -group huif1 /system_tb/DUT/CPU/DP1/huif/Rs_id
add wave -noupdate -group {Core 1} -group huif1 /system_tb/DUT/CPU/DP1/huif/Rt_id
add wave -noupdate -group {Core 1} -group huif1 /system_tb/DUT/CPU/DP1/huif/Rt_ex
add wave -noupdate -group {Core 1} -group fuif1 /system_tb/DUT/CPU/DP1/fuif/forward_A
add wave -noupdate -group {Core 1} -group fuif1 /system_tb/DUT/CPU/DP1/fuif/forward_B
add wave -noupdate -group {Core 1} -group fuif1 /system_tb/DUT/CPU/DP1/fuif/RegWr_wb
add wave -noupdate -group {Core 1} -group fuif1 /system_tb/DUT/CPU/DP1/fuif/RegWr_mem
add wave -noupdate -group {Core 1} -group fuif1 /system_tb/DUT/CPU/DP1/fuif/RegDst_wb
add wave -noupdate -group {Core 1} -group fuif1 /system_tb/DUT/CPU/DP1/fuif/RegDst_mem
add wave -noupdate -group {Core 1} -group fuif1 /system_tb/DUT/CPU/DP1/fuif/Rs_ex
add wave -noupdate -group {Core 1} -group fuif1 /system_tb/DUT/CPU/DP1/fuif/Rt_ex
add wave -noupdate -group {Core 1} -group btbif1 /system_tb/DUT/CPU/DP1/BRANCH_TARGET_BUFFER/buffer_0
add wave -noupdate -group {Core 1} -group btbif1 /system_tb/DUT/CPU/DP1/BRANCH_TARGET_BUFFER/buffer_1
add wave -noupdate -group {Core 1} -group btbif1 /system_tb/DUT/CPU/DP1/BRANCH_TARGET_BUFFER/buffer_2
add wave -noupdate -group {Core 1} -group btbif1 /system_tb/DUT/CPU/DP1/BRANCH_TARGET_BUFFER/buffer_3
add wave -noupdate -group {Core 1} -group btbif1 /system_tb/DUT/CPU/DP1/btbif/target_address
add wave -noupdate -group {Core 1} -group btbif1 /system_tb/DUT/CPU/DP1/btbif/target_address_new
add wave -noupdate -group {Core 1} -group btbif1 /system_tb/DUT/CPU/DP1/btbif/tag_bits
add wave -noupdate -group {Core 1} -group btbif1 /system_tb/DUT/CPU/DP1/btbif/tag_bits_new
add wave -noupdate -group {Core 1} -group btbif1 /system_tb/DUT/CPU/DP1/btbif/btb_wen
add wave -noupdate -group {Core 1} -group btbif1 /system_tb/DUT/CPU/DP1/btbif/flush_ifid
add wave -noupdate -group {Core 1} -group btbif1 /system_tb/DUT/CPU/DP1/btbif/flush_exmem
add wave -noupdate -group {Core 1} -group btbif1 /system_tb/DUT/CPU/DP1/btbif/flush_idex
add wave -noupdate -group {Core 1} -group btbif1 /system_tb/DUT/CPU/DP1/btbif/branch_hit
add wave -noupdate -group {Core 1} -group btbif1 /system_tb/DUT/CPU/DP1/btbif/slot_enabled
add wave -noupdate -group {Core 1} -group btbif1 /system_tb/DUT/CPU/DP1/btbif/mapping_sel
add wave -noupdate -group {Core 1} -group btbif1 /system_tb/DUT/CPU/DP1/btbif/mapping_wsel
add wave -noupdate -group {Core 1} -group btbif1 /system_tb/DUT/CPU/DP1/btbif/branch_history
add wave -noupdate -group {Core 1} -group btbif1 /system_tb/DUT/CPU/DP1/btbif/branch_history_new
add wave -noupdate -group {Core 1} -group bpif1 /system_tb/DUT/CPU/DP1/bpif/decision
add wave -noupdate -group {Core 1} -group bpif1 /system_tb/DUT/CPU/DP1/bpif/wrong_prediction
add wave -noupdate -group {Core 1} -group bpif1 /system_tb/DUT/CPU/DP1/bpif/branch_mem
add wave -noupdate -group {Core 1} -group bpif1 /system_tb/DUT/CPU/DP1/bpif/branch_history
add wave -noupdate -group {Core 1} -group bpif1 /system_tb/DUT/CPU/DP1/bpif/branch_history_new
add wave -noupdate -group {Core 1} -group icache1 /system_tb/DUT/CPU/CM1/ICACHE/cache_entry
add wave -noupdate -group {Core 1} -group icache1 /system_tb/DUT/CPU/CM1/ICACHE/icache_addr
add wave -noupdate -group {Core 1} -group dcache1 /system_tb/DUT/CPU/CM1/DCACHE/cache_entry
add wave -noupdate -group {Core 1} -group dcache1 /system_tb/DUT/CPU/CM1/DCACHE/nextstate_cache_entry
add wave -noupdate -group {Core 1} -group dcache1 /system_tb/DUT/CPU/CM1/DCACHE/snoop_cache_entry
add wave -noupdate -group {Core 1} -group dcache1 /system_tb/DUT/CPU/CM1/DCACHE/link_register
add wave -noupdate -group {Core 1} -group dcache1 /system_tb/DUT/CPU/CM1/DCACHE/nextstate_link_register
add wave -noupdate -group {Core 1} -group dcache1 /system_tb/DUT/CPU/CM1/DCACHE/dcache_addr
add wave -noupdate -group {Core 1} -group dcache1 /system_tb/DUT/CPU/CM1/DCACHE/snoop_addr
add wave -noupdate -group {Core 1} -group dcache1 /system_tb/DUT/CPU/CM1/DCACHE/hit_count
add wave -noupdate -group {Core 1} -group dcache1 /system_tb/DUT/CPU/CM1/DCACHE/nextstate_hit_count
add wave -noupdate -group {Core 1} -group dcache1 /system_tb/DUT/CPU/CM1/DCACHE/nru
add wave -noupdate -group {Core 1} -group dcache1 /system_tb/DUT/CPU/CM1/DCACHE/nextstate_nru
add wave -noupdate -group {Core 1} -group dcache1 /system_tb/DUT/CPU/CM1/DCACHE/frame
add wave -noupdate -group {Core 1} -group dcache1 /system_tb/DUT/CPU/CM1/DCACHE/next_frame
add wave -noupdate -group {Core 1} -group dcache1 /system_tb/DUT/CPU/CM1/DCACHE/cache_miss
add wave -noupdate -group {Core 1} -group dcache1 /system_tb/DUT/CPU/CM1/DCACHE/dirty_snoop
add wave -noupdate -group {Core 1} -group dcache1 /system_tb/DUT/CPU/CM1/DCACHE/cache_state
add wave -noupdate -group {Core 1} -group dcache1 /system_tb/DUT/CPU/CM1/DCACHE/cache_nextstate
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 225
configure wave -valuecolwidth 482
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
WaveRestoreZoom {0 ps} {2728341 ps}

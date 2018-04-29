onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /control_unit_tb/CLK
add wave -noupdate /control_unit_tb/nRST
add wave -noupdate /control_unit_tb/DUT/cuif/PCSrc
add wave -noupdate /control_unit_tb/DUT/cuif/RegWr
add wave -noupdate /control_unit_tb/DUT/cuif/ExtOp
add wave -noupdate /control_unit_tb/DUT/cuif/iREN
add wave -noupdate /control_unit_tb/DUT/cuif/dREN
add wave -noupdate /control_unit_tb/DUT/cuif/dWEN
add wave -noupdate /control_unit_tb/DUT/cuif/jump
add wave -noupdate /control_unit_tb/DUT/cuif/jal
add wave -noupdate /control_unit_tb/DUT/cuif/mem2reg
add wave -noupdate /control_unit_tb/DUT/cuif/halt
add wave -noupdate /control_unit_tb/DUT/cuif/lui
add wave -noupdate /control_unit_tb/DUT/cuif/jr
add wave -noupdate /control_unit_tb/DUT/cuif/zero
add wave -noupdate /control_unit_tb/DUT/cuif/overflow
add wave -noupdate /control_unit_tb/DUT/cuif/ALUSrc
add wave -noupdate /control_unit_tb/DUT/cuif/RegDst
add wave -noupdate /control_unit_tb/DUT/cuif/ALUop
add wave -noupdate /control_unit_tb/DUT/cuif/Instruct
add wave -noupdate /control_unit_tb/DUT/cuif/funct
add wave -noupdate /control_unit_tb/PROG/test_number
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {69 ns} 0}
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
WaveRestoreZoom {0 ns} {614 ns}

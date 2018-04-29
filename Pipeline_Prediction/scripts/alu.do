onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /alu_tb/CLK
add wave -noupdate /alu_tb/DUT/previous_state_output
add wave -noupdate /alu_tb/DUT/subtraction_complement
add wave -noupdate /alu_tb/PROG/CLK
add wave -noupdate /alu_tb/PROG/test_number
add wave -noupdate /alu_tb/PROG/i
add wave -noupdate /alu_tb/CLK
add wave -noupdate /alu_tb/aluif/ALUOP
add wave -noupdate /alu_tb/aluif/port_A
add wave -noupdate /alu_tb/aluif/port_B
add wave -noupdate /alu_tb/aluif/output_port
add wave -noupdate /alu_tb/aluif/negative
add wave -noupdate /alu_tb/aluif/overflow
add wave -noupdate /alu_tb/aluif/zero
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
configure wave -namecolwidth 138
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
WaveRestoreZoom {93 ns} {195 ns}

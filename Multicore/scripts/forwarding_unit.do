onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /forwarding_unit_tb/CLK
add wave -noupdate /forwarding_unit_tb/nRST
add wave -noupdate -group fuif /forwarding_unit_tb/DUT/fuif/forward_A
add wave -noupdate -group fuif /forwarding_unit_tb/DUT/fuif/forward_B
add wave -noupdate -group fuif /forwarding_unit_tb/DUT/fuif/RegWr_wb
add wave -noupdate -group fuif /forwarding_unit_tb/DUT/fuif/RegWr_mem
add wave -noupdate -group fuif /forwarding_unit_tb/DUT/fuif/RegDst_wb
add wave -noupdate -group fuif /forwarding_unit_tb/DUT/fuif/RegDst_mem
add wave -noupdate -group fuif /forwarding_unit_tb/DUT/fuif/Rs_ex
add wave -noupdate -group fuif /forwarding_unit_tb/DUT/fuif/Rt_ex
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
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
WaveRestoreZoom {0 ns} {194 ns}

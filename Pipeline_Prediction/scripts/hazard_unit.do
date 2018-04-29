onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /hazard_unit_tb/CLK
add wave -noupdate /hazard_unit_tb/nRST
add wave -noupdate -expand -group huif /hazard_unit_tb/DUT/huif/flush_idex
add wave -noupdate -expand -group huif /hazard_unit_tb/DUT/huif/dREN_ex
add wave -noupdate -expand -group huif /hazard_unit_tb/DUT/huif/stall_ifid
add wave -noupdate -expand -group huif /hazard_unit_tb/DUT/huif/flush_ifid
add wave -noupdate -expand -group huif /hazard_unit_tb/DUT/huif/jump_ex
add wave -noupdate -expand -group huif /hazard_unit_tb/DUT/huif/branch_ex
add wave -noupdate -expand -group huif /hazard_unit_tb/DUT/huif/ihit
add wave -noupdate -expand -group huif /hazard_unit_tb/DUT/huif/pc_wen
add wave -noupdate -expand -group huif /hazard_unit_tb/DUT/huif/lduse_hit
add wave -noupdate -expand -group huif /hazard_unit_tb/DUT/huif/Rs_id
add wave -noupdate -expand -group huif /hazard_unit_tb/DUT/huif/Rt_id
add wave -noupdate -expand -group huif /hazard_unit_tb/DUT/huif/Rt_ex
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
WaveRestoreZoom {0 ns} {152 ns}

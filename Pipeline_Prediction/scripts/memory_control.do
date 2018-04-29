onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /memory_control_tb/CLK
add wave -noupdate /memory_control_tb/nRST
add wave -noupdate /memory_control_tb/PROG/test_number
add wave -noupdate /memory_control_tb/tbccif/iwait
add wave -noupdate /memory_control_tb/tbccif/dwait
add wave -noupdate /memory_control_tb/tbccif/iREN
add wave -noupdate /memory_control_tb/tbccif/dREN
add wave -noupdate /memory_control_tb/tbccif/dWEN
add wave -noupdate /memory_control_tb/tbccif/iload
add wave -noupdate /memory_control_tb/tbccif/dload
add wave -noupdate /memory_control_tb/tbccif/dstore
add wave -noupdate /memory_control_tb/tbccif/iaddr
add wave -noupdate /memory_control_tb/tbccif/daddr
add wave -noupdate /memory_control_tb/tbccif/ramWEN
add wave -noupdate /memory_control_tb/tbccif/ramREN
add wave -noupdate /memory_control_tb/tbccif/ramstate
add wave -noupdate /memory_control_tb/tbccif/ramaddr
add wave -noupdate /memory_control_tb/tbccif/ramstore
add wave -noupdate /memory_control_tb/tbccif/ramload
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {134170 ps} 0}
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
WaveRestoreZoom {0 ps} {141750 ps}

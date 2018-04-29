onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /memory_control_tb/CLK
add wave -noupdate /memory_control_tb/nRST
add wave -noupdate /memory_control_tb/PROG/test_number
add wave -noupdate /memory_control_tb/PROG/bus_state_expected
add wave -noupdate /memory_control_tb/DUT/bus_state
add wave -noupdate /memory_control_tb/DUT/bus_nextstate
add wave -noupdate /memory_control_tb/DUT/snooper
add wave -noupdate /memory_control_tb/DUT/snooped
add wave -noupdate /memory_control_tb/DUT/nextstate_snooper
add wave -noupdate /memory_control_tb/DUT/nextstate_snooped
add wave -noupdate -group cif0 /memory_control_tb/cif0/iwait
add wave -noupdate -group cif0 /memory_control_tb/cif0/dwait
add wave -noupdate -group cif0 /memory_control_tb/cif0/iREN
add wave -noupdate -group cif0 /memory_control_tb/cif0/dREN
add wave -noupdate -group cif0 /memory_control_tb/cif0/dWEN
add wave -noupdate -group cif0 /memory_control_tb/cif0/iload
add wave -noupdate -group cif0 /memory_control_tb/cif0/dload
add wave -noupdate -group cif0 /memory_control_tb/cif0/dstore
add wave -noupdate -group cif0 /memory_control_tb/cif0/iaddr
add wave -noupdate -group cif0 /memory_control_tb/cif0/daddr
add wave -noupdate -group cif0 /memory_control_tb/cif0/ccwait
add wave -noupdate -group cif0 /memory_control_tb/cif0/ccinv
add wave -noupdate -group cif0 /memory_control_tb/cif0/ccwrite
add wave -noupdate -group cif0 /memory_control_tb/cif0/cctrans
add wave -noupdate -group cif0 /memory_control_tb/cif0/ccsnoopaddr
add wave -noupdate -group cif1 /memory_control_tb/cif1/iwait
add wave -noupdate -group cif1 /memory_control_tb/cif1/dwait
add wave -noupdate -group cif1 /memory_control_tb/cif1/iREN
add wave -noupdate -group cif1 /memory_control_tb/cif1/dREN
add wave -noupdate -group cif1 /memory_control_tb/cif1/dWEN
add wave -noupdate -group cif1 /memory_control_tb/cif1/iload
add wave -noupdate -group cif1 /memory_control_tb/cif1/dload
add wave -noupdate -group cif1 /memory_control_tb/cif1/dstore
add wave -noupdate -group cif1 /memory_control_tb/cif1/iaddr
add wave -noupdate -group cif1 /memory_control_tb/cif1/daddr
add wave -noupdate -group cif1 /memory_control_tb/cif1/ccwait
add wave -noupdate -group cif1 /memory_control_tb/cif1/ccinv
add wave -noupdate -group cif1 /memory_control_tb/cif1/ccwrite
add wave -noupdate -group cif1 /memory_control_tb/cif1/cctrans
add wave -noupdate -group cif1 /memory_control_tb/cif1/ccsnoopaddr
add wave -noupdate -group ccif /memory_control_tb/DUT/ccif/ramWEN
add wave -noupdate -group ccif /memory_control_tb/DUT/ccif/ramREN
add wave -noupdate -group ccif /memory_control_tb/DUT/ccif/ramstate
add wave -noupdate -group ccif /memory_control_tb/DUT/ccif/ramaddr
add wave -noupdate -group ccif /memory_control_tb/DUT/ccif/ramstore
add wave -noupdate -group ccif /memory_control_tb/DUT/ccif/ramload
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 165
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
WaveRestoreZoom {0 ps} {978825 ps}

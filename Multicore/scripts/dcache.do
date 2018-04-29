onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /dcache_tb/CLK
add wave -noupdate /dcache_tb/nRST
add wave -noupdate /dcache_tb/PROG/test_number
add wave -noupdate -group DUT /dcache_tb/DUT/cache_entry
add wave -noupdate -group DUT /dcache_tb/DUT/nextstate_cache_entry
add wave -noupdate -group DUT /dcache_tb/DUT/dcache_addr
add wave -noupdate -group DUT /dcache_tb/DUT/snoop_cache_entry
add wave -noupdate -group DUT /dcache_tb/DUT/snoop_addr
add wave -noupdate -group DUT /dcache_tb/DUT/dirty_snoop
add wave -noupdate -group DUT /dcache_tb/DUT/nru
add wave -noupdate -group DUT /dcache_tb/DUT/nextstate_nru
add wave -noupdate -group DUT /dcache_tb/DUT/frame
add wave -noupdate -group DUT /dcache_tb/DUT/next_frame
add wave -noupdate -group DUT /dcache_tb/DUT/cache_state
add wave -noupdate -group DUT /dcache_tb/DUT/cache_nextstate
add wave -noupdate -group DUT /dcache_tb/DUT/cache_miss
add wave -noupdate -group DUT /dcache_tb/DUT/hit_count
add wave -noupdate -group DUT /dcache_tb/DUT/nextstate_hit_count
add wave -noupdate -group dcif /dcache_tb/DUT/dcif/halt
add wave -noupdate -group dcif /dcache_tb/DUT/dcif/dhit
add wave -noupdate -group dcif /dcache_tb/DUT/dcif/datomic
add wave -noupdate -group dcif /dcache_tb/DUT/dcif/dmemREN
add wave -noupdate -group dcif /dcache_tb/DUT/dcif/dmemWEN
add wave -noupdate -group dcif /dcache_tb/DUT/dcif/flushed
add wave -noupdate -group dcif /dcache_tb/DUT/dcif/dmemload
add wave -noupdate -group dcif /dcache_tb/DUT/dcif/dmemstore
add wave -noupdate -group dcif /dcache_tb/DUT/dcif/dmemaddr
add wave -noupdate -group cif /dcache_tb/DUT/cif/dwait
add wave -noupdate -group cif /dcache_tb/DUT/cif/dREN
add wave -noupdate -group cif /dcache_tb/DUT/cif/dWEN
add wave -noupdate -group cif /dcache_tb/DUT/cif/dload
add wave -noupdate -group cif /dcache_tb/DUT/cif/dstore
add wave -noupdate -group cif /dcache_tb/DUT/cif/daddr
add wave -noupdate -group cif /dcache_tb/tbcif/ccwait
add wave -noupdate -group cif /dcache_tb/tbcif/ccinv
add wave -noupdate -group cif /dcache_tb/tbcif/ccwrite
add wave -noupdate -group cif /dcache_tb/tbcif/cctrans
add wave -noupdate -group cif /dcache_tb/tbcif/ccsnoopaddr
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 469
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
WaveRestoreZoom {0 ns} {851 ns}

all: and4.out xor2.out tx.out nor2.out nor3.out nand2.out or2.out or3.out and2.out and3.out inverter.out output_enable.out xnor2.out mux.out mux_8.out comparator.out block_decoder.out buf.out xor2.out dff.out dff_pos.out TFF.out TFF_test.out four_two_priority_encoder.out two_to_four_decoder.out counter.out counter_test.out decode_states.out decode_states_test.out mux_2.out four_two_priority_encoder.out state_machine.out state_machine_test.out reg.out Dlatch.out cache_valid.out cachecell.out cachebyte.out cache_tag.out cache_block.out cache.out chip.out chip_full_test.out

and4.out: and4.vhd
	../run_ncvhdl.bash -messages -linedebug -smartorder and4.vhd

xor2.out: xor2.vhd
	../run_ncvhdl.bash -messages -linedebug -smartorder xor2.vhd

tx.out: tx.vhd
	../run_ncvhdl.bash -messages -linedebug -smartorder tx.vhd

nor2.out: nor2.vhd
	../run_ncvhdl.bash -messages -linedebug -smartorder nor2.vhd

nor3.out: nor3.vhd
	../run_ncvhdl.bash -messages -linedebug -smartorder nor3.vhd

nand2.out: nand2.vhd
	../run_ncvhdl.bash -messages -linedebug -smartorder nand2.vhd

or2.out: or2.vhd
	../run_ncvhdl.bash -messages -linedebug -smartorder or2.vhd

or3.out: or3.vhd
	../run_ncvhdl.bash -messages -linedebug -smartorder or3.vhd

and2.out: and2.vhd
	../run_ncvhdl.bash -messages -linedebug -smartorder and2.vhd

and3.out: and3.vhd
	../run_ncvhdl.bash -messages -linedebug -smartorder and3.vhd

inverter.out: inverter.vhd
	../run_ncvhdl.bash -messages -linedebug -smartorder inverter.vhd

output_enable.out: output_enable.vhd
	../run_ncvhdl.bash -messages -linedebug -smartorder output_enable.vhd

xnor2.out: xnor2.vhd
	../run_ncvhdl.bash -messages -linedebug -smartorder xnor2.vhd

mux.out: mux.vhd
	../run_ncvhdl.bash -messages -linedebug -smartorder mux.vhd	

mux_8.out: mux_8.vhd
	../run_ncvhdl.bash -messages -linedebug -smartorder mux_8.vhd	

comparator.out: comparator.vhd
	../run_ncvhdl.bash -messages -linedebug -smartorder comparator.vhd

block_decoder.out: block_decoder.vhd
	../run_ncvhdl.bash -messages -linedebug -smartorder block_decoder.vhd		

buf.out: buf.vhd
	../run_ncvhdl.bash -messages -linedebug -smartorder buf.vhd

xor2.out: xor2.vhd
	../run_ncvhdl.bash -messages -linedebug -smartorder xor2.vhd

dff.out: dff.vhd
	../run_ncvhdl.bash -messages -linedebug -smartorder dff.vhd

dff_pos.out: dff_pos.vhd
	../run_ncvhdl.bash -messages -linedebug -smartorder dff_pos.vhd

TFF.out: TFF.vhd
	../run_ncvhdl.bash -messages -linedebug -smartorder TFF.vhd

TFF_test.out: TFF.vhd TFF_test.vhd
	../run_ncvhdl.bash -messages -linedebug -smartorder TFF.vhd
	../run_ncvhdl.bash -messages -linedebug -smartorder TFF_test.vhd
	../run_ncelab.bash -messages -access rwc TFF_test
	#../run_ncsim.bash -gui -messages TFF_test
	#../run_ncsim.bash -input ncsim.run -messages TFF_test

four_two_priority_encoder.out: four_two_priority_encoder.vhd
	../run_ncvhdl.bash -messages -linedebug -smartorder four_two_priority_encoder.vhd

two_to_four_decoder.out: two_to_four_decoder.vhd
	../run_ncvhdl.bash -messages -linedebug -smartorder two_to_four_decoder.vhd

counter.out: counter.vhd
	../run_ncvhdl.bash -messages -linedebug -smartorder counter.vhd

counter_test.out: counter.vhd counter_test.vhd
	../run_ncvhdl.bash -messages -linedebug -smartorder counter.vhd
	../run_ncvhdl.bash -messages -linedebug -smartorder counter_test.vhd
	../run_ncelab.bash -messages -access rwc counter_test
	#../run_ncsim.bash -input ncsim.run -messages counter_test
	#../run_ncsim.bash -gui -messages counter_test

decode_states.out: decode_states.vhd
	../run_ncvhdl.bash -messages -linedebug -smartorder decode_states.vhd

decode_states_test.out: decode_states.vhd decode_states_test.vhd 
	../run_ncvhdl.bash -messages -linedebug -smartorder decode_states.vhd
	../run_ncvhdl.bash -messages -linedebug -smartorder decode_states_test.vhd
	../run_ncelab.bash -messages -access rwc decode_states_test
	#../run_ncsim.bash -gui -messages decode_states_test
	#../run_ncsim.bash -input ncsim.run -messages decode_states_test

mux_2.out: mux_2.vhd
	../run_ncvhdl.bash -messages -linedebug mux_2.vhd

state_machine.out: state_machine.vhd
	../run_ncvhdl.bash -messages -linedebug -smartorder state_machine.vhd

state_machine_test.out: state_machine.vhd state_machine_test.vhd 
	../run_ncvhdl.bash -messages -linedebug -smartorder state_machine.vhd
	../run_ncvhdl.bash -messages -linedebug -smartorder state_machine_test.vhd
	../run_ncelab.bash -messages -access rwc state_machine_test
	#../run_ncsim.bash -gui -messages state_machine_test
	#../run_ncsim.bash -input ncsim.run -messages state_machine_test

reg.out: reg.vhd
	../run_ncvhdl.bash -messages -linedebug -smartorder reg.vhd

Dlatch.out: Dlatch.vhd
	../run_ncvhdl.bash -messages -linedebug -smartorder Dlatch.vhd

cache_valid.out: cache_valid.vhd
	../run_ncvhdl.bash -messages -linedebug -smartorder cache_valid.vhd
	
cachecell.out: cachecell.vhd
	../run_ncvhdl.bash -messages -linedebug -smartorder cachecell.vhd

cachebyte.out: cachebyte.vhd
	../run_ncvhdl.bash -messages -linedebug -smartorder cachebyte.vhd

cache_tag.out: cache_tag.vhd
	../run_ncvhdl.bash -messages -linedebug -smartorder cache_tag.vhd

cache_block.out: cache_block.vhd
	../run_ncvhdl.bash -messages -linedebug -smartorder cache_block.vhd

cache.out: cache.vhd
	../run_ncvhdl.bash -messages -linedebug -smartorder cache.vhd

chip.out: chip.vhd
	../run_ncvhdl.bash -messages -linedebug -smartorder chip.vhd

chip_full_test.out: chip_full_test.vhd
	../run_ncvhdl.bash -messages -linedebug -smartorder chip_full_test.vhd
	../run_ncelab.bash -messages -access rwc chip_full_test
	../run_ncsim.bash -gui -messages chip_full_test &
	#../run_ncsim.bash -input ncsim.run -messages chip_full_test

#chip_test.out: chip_test.vhd
#	../run_ncvhdl.bash -messages -linedebug -smartorder chip_test.vhd
#	../run_ncelab.bash -messages -access rwc chip_test
#	../run_ncsim.bash -gui -messages chip_test


clean:
	rm -f junk*
	rm -f *~
	rm -f *.log
	rm -rf vhdl_lib
	mkdir vhdl_lib
	chmod go+rx *
	chgrp cseeweb *

distribution:
	rm -f *.log
	rm -f *.tst
	rm -f *~
	rm -f *.bak
	rm -f junk*
	rm -rf vhdl_lib
	mkdir vhdl_lib

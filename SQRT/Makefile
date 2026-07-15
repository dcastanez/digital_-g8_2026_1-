#El makefile se encuentra en ws2812 de la ruta /home/david/digital_UN/basic_circuits/test_peripherals/rtl/cores/test/mult/

TARGET = SQRT
OBJS   = ${TARGET}.v comp2.v  control_${TARGET}.v dec.v lsr.v qcct.v rcct.v tcct.v cont.v
ICE40_SIM_CELLS=./lattice_sim/cells_sim_ecp5.v

sim:
	rm -f a.out *.vcd
	iverilog  -DBENCH $(TARGET)_TB.v $(OBJS)
	vvp a.out
	gtkwave $(TARGET)_TB.vcd

sim_post_syn:
	yosys -v3 -l synth.log -p 'synth_ecp5 -top $(TARGET) -json $(TARGET).json; write_verilog -attr2comment $(TARGET)_synth.v' $(OBJS)
	iverilog  -I ./lattice_sim  $(TARGET)_TB.v $(TARGET)_synth.v $(ICE40_SIM_CELLS) 
	vvp a.out
	gtkwave $(TARGET)_TB.vcd
	
svg: $(OBJS)
	rm -rf *.svg *.out *.dot
	yosys -p "prep -top ${TARGET}; memory_map; opt; opt_expr; techmap; abc -g AND,OR,XOR; write_json ${TARGET}.json" ${OBJS}
	yosys -p "read_verilog ${TARGET}.v; proc; memory_map; opt; opt_expr; techmap; abc -g AND,OR,XOR; show -format dot -prefix ${TARGET}_out"
	netlistsvg ${TARGET}.json -o ${TARGET}.svg
	brave-browser ${TARGET}.svg

sim_post_route:
	

clean:
	rm -rf *.svg *.out *.dot a.out *.vcd *.json *_synth.v *.log

~/Documents/iac/lab0-devtools/tools/attach_usb.sh
#!/bin/sh

# cleanup
rm -rf obj_dir
rm -f sigdelay.vcd

verilator -Wall --cc --trace sigdelay.sv counter.sv dp_ram.sv --exe sigdelay_tb.cpp

make -j -C obj_dir/ -f Vsigdelay.mk Vsigdelay

obj_dir/Vsigdelay

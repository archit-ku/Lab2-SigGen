~/Documents/iac/lab0-devtools/tools/attach_usb.sh
#!/bin/sh

# cleanup
rm -rf obj_dir
rm -f sinegen.vcd

verilator -Wall --cc --trace sinegen.sv counter.sv rom.sv --exe sinegen_tb.cpp

make -j -C obj_dir/ -f Vsinegen.mk Vsinegen

obj_dir/Vsinegen

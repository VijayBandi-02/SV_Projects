# cd {C:\VLSI Course\DE using GVim}

vlog list.svh

vsim -novopt -suppress 12110 tb +test_name=NWR_NRD +N=32

add wave -r sim:/tb/pif/*

run -all

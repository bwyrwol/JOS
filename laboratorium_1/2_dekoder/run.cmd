iverilog -o dekoder 2_dekoder_tb.v 2_dekoder.v
vvp dekoder > simulation.txt
rem gtkwave counter.vcd
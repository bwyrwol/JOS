
iverilog -o licz 1_licznik_asynchr_tb.v 1_licznik_asynchr.v

vvp licz

gtkwave licz.vcd
`timescale 1ns / 100ps

module stimulus;

//`include "config.vh"
parameter N = 3;

reg          en;
reg [N-1:0]  data;
wire [N-1:0] out;

tri_st #(.N(N)) UUT (.en(en), .data(data), .out(out));

initial
	begin
		#0	en = 1'b0; data = {N{1'b0}};
		#5	en = 1'b1;
		#5	en = 1'b0;
		#5	repeat($pow(2, N)) #5 data = data + 1;
		#0	en = 1'b1;
		#5	repeat($pow(2, N)) #5 data = data + 1;
		#0	en = 1'b0;
		#5	$finish;
	end

initial
	begin
		$display("Symulacja bramki trojstanowej");
		$monitor("Czas: %t   Enable: %b Wejscie: %b Wyjscie: %b", $time, en, data, out);
		$dumpfile("tristate.vcd");
		$dumpvars(0, UUT);
	end

endmodule

//zadania:
//1 symulacja behawioralna
//2 zmienic we/wy na wektory
//3 sparametryzowac modul (opearator konkatencji)

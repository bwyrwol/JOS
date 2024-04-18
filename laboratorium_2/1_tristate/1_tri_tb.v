`timescale 1ns / 1ps

module stimulus;

reg  en;
reg  data;
wire out;

tri_st UUT(.en(en), .data(data), .out(out));

initial
	begin
		#0	en = 1'b0; data = 1'b0;
		#5	en = 1'b1;
		#5	en = 1'b0;
		#5	data = 1'b1;
		#5	en = 1'b1;
		#5	en = 1'b0;
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

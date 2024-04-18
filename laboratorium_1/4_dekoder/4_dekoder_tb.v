`timescale 1ns / 100ps
module test;

reg [2:0]  inA;
wire [7:0] outY;
reg        rst;
reg        clk;

dekoder_3 UUT(.A(inA), .Y(outY), .reset(rst), .CLK(clk));

initial
	begin
		#0 inA = 0; rst = 0;
		#5 inA = 1;
		#5 inA = 2;
		#5 inA = 3;
		#5 inA = 4;
		#5 inA = 5;
		#5 rst = 1;
		#5 rst = 1;
		#5 rst = 1;
		#5 rst = 0; inA = 6;
		#5 inA = 7;
		#5 inA = 4;
		#5 $finish;
	end;

initial
	begin
		clk = 0;
		forever #1 clk = ~clk;
	end

initial
	begin
		$timeformat(-9, 0, "ns", 8);
		$monitor("Time: %t    CLK: %d  RST: %d  inputA: %d  outputY: %d", $time, clk, rst, inA, outY);
		$dumpfile("dekoder.vcd");
		$dumpvars(0, UUT);
	end

endmodule

//zadania:
//1 implementacja
//zeby nie korzystaæ z linii dedykowanych dla zegara
//nalezy dodac odpowiednia dyrektywe w .xdc
//(info niededykowana_linia_zegarowa.txt w katalogu glownym)

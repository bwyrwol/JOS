`timescale 1ns / 1ps

module test_cnt;

reg        clk;
reg        clr;
wire [3:0] q;

CNT UUT(.CLK(clk), .CLR(clr), .Q(q));

initial
		clk = 0;
always #10 clk = ~clk;

initial
	begin
		#0   clr = 1;
		#20	 clr = 0;
		#200 clr = 1;
		#250 clr = 0;
		#500 $finish;
	end

initial
	begin
		$monitor("Time: %t     clk: %b  clr: %b   q: %b", $time, clk, clr, q);
		$dumpfile("cnts.vcd");
		$dumpvars(0, UUT);
	end

endmodule


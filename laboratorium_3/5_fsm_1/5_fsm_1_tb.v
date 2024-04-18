`timescale 1ns / 1ps

module test_seq;

reg  clk;
reg  clr;
reg  ce;
reg  in;
wire out;

fsm UUT(.CLK(clk), .CLR(clr), .CE(ce), .IN(in), .OUT(out));

initial
	begin
		clk = 0;
		#50 $finish;
	end
always #1 clk = ~clk;

initial
	begin
		#0   clr = 1; ce = 1; in = 0;
		#10  clr = 0; ce = 1; in = 1;
		#2   clr = 0; ce = 1; in = 0;
		#2   clr = 0; ce = 1; in = 1;
		#2   clr = 0; ce = 1; in = 1;
		#10  clr = 0; ce = 1; in = 0;
		//forever #0.1 if (clk == 1) ce = 0; else ce = 1;
	end

initial
	begin
		$monitor("Time:%t   clk:%b clr:%b ce:%b in:%b  out:%b", $time, clk, clr, ce, in, out);
		$dumpfile("test_seq.vcd");
		$dumpvars(0, UUT);
	end

endmodule


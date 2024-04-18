`timescale 1ns / 1ps

module test;

reg        clk;
reg        clr;
reg        ce;
wire [3:0] q;
wire       ceo;

CNT UUT(.CLK(clk), .CLR(clr), .CE(ce), .Q(q), .CEO(ceo));

initial
	begin
		#0   clk = 0; clr = 1; ce = 0;
		#10           clr = 0; ce = 1;
		#20                    ce = 0;
		#20                    ce = 1;
		#100 $finish;
	end

initial
	begin
		forever #1 clk = ~clk;
	end

initial
	begin
		$display("Time     clk clr ce  q3q2q1q0 ceo");
		$timeformat(-9, 0, "ns", 6);
		$monitor("%t     %b  %b  %b     %b    %b", $time, clk, clr, ce, q, ceo);
		$dumpfile("cnt_bcd_ceo.vcd");
		$dumpvars(0, UUT);
	end

endmodule


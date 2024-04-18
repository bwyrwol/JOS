`timescale 1ns / 1ps

module test;

reg        clk;
reg        clr;
reg        ce;
wire [7:0] q;
wire       ceo1;
wire       ceo2;

CNT CNT1(.CLK(clk), .CLR(clr), .CE(ce), .Q(q[3:0]), .CEO(ceo1));
CNT CNT2(.CLK(ceo1), .CLR(clr), .CE(ce), .Q(q[7:4]), .CEO(ceo2));

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
		$monitor("%t     %b  %b  %b     %b    %b", $time, clk, clr, ce, q, ceo1);
		$dumpfile("cnt_bcd_ceo.vcd");
		$dumpvars(0, test);
	end

endmodule


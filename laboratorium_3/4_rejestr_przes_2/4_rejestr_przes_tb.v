`timescale 1ns / 1ps

module test_rej_przes;

reg        clk;
reg        ce;
reg        clr;
reg        d;
wire [7:0] q;

SHF_REG UUT(.CLK(clk), .CE(ce), .CLR(clr), .D(d), .Q(q));

initial
	begin
		clk = 1'b0;
		forever #1 clk = ~clk;
	end

initial
	begin
		#0  clr = 1'b1; ce = 1'b1; d = 1'b0;
		#5  clr = 1'b0; ce = 1'b1; d = 1'b0;
		#2  clr = 1'b0; ce = 1'b1; d = 1'b1;
		#10 clr = 1'b0; ce = 1'b0; d = 1'b1;
		#20 clr = 1'b0; ce = 1'b1; d = 1'b0;
		#20 clr = 1'b0; ce = 1'b1; d = 1'b0;
		#10 clr = 1'b0; ce = 1'b1; d = 1'b1;
		#5  clr = 1'b1; ce = 1'b1; d = 1'b0;
		#5  $finish;
	end

initial
	begin
		$monitor("Time: %t     clk:%b clr:%b d:%b  q:%b", $time, clk, clr, d, q);
		$dumpfile("shf_reg.vcd");
		$dumpvars(0, UUT);
	end

endmodule

//zadania:
//1 uzale¿niæ rejestr od CE
//2 napisac tb + symulacja
//3 implementacja
//4 krazaca '1'

`timescale 1ns / 100ps

module test;

reg [1:0] in1;
reg [1:0] in2;
wire      out;

komparator UUT(.IN1(in1), .IN2(in2), .OUT(out));

initial
	begin
		in1 = 0; in2 = 0;
		repeat(20)
			#5 {in2, in1} = {in2, in1} + 1;
		$finish;
	end

initial
	begin
		$timeformat(-9, 0, "ns", 6);
		$monitor("Time: %t   IN1: %d  IN2: %d   IN1>=IN2: %b", $time, in1, in2, out);
	end

initial
	begin
		$dumpfile("komparator.vcd");
		$dumpvars(0, UUT);
	end

endmodule


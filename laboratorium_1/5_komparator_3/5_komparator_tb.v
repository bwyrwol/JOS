`timescale 1ns / 100ps

module test;

reg [1:0] in1;
reg [1:0] in2;
reg				in_eq, in_gt, in_lt;
wire      out_eq, out_gt, out_lt;

komparator UUT(.IN1(in1), .IN2(in2),
							 .inEQ(in_eq), .inGT(in_gt), .inLT(in_lt),
               .outEQ(out_eq), .outGT(out_gt), .outLT(out_lt));

initial
	begin
		in_eq = 1; in_gt = 0; in_lt = 0;
		in1 = 0; in2 = 0;
		repeat(16)
			#5 {in2, in1} = {in2, in1} + 1;

		in_eq = 0; in_gt = 1; in_lt = 0;
		in1 = 0; in2 = 0;
		repeat(16)
			#5 {in2, in1} = {in2, in1} + 1;

		in_eq = 0; in_gt = 0; in_lt = 1;
		in1 = 0; in2 = 0;
		repeat(16)
			#5 {in2, in1} = {in2, in1} + 1;

		$finish;
	end

initial
	begin
		$timeformat(-9, 0, "ns", 6);
		$monitor("Time: %t   IN1: %d  IN2: %d  in_gt: %b  in_eq: %b  in_lt: %b    out_gt: %b  out_eq: %b  out_lt: %b",
		         $time, in1, in2, in_gt, in_eq, in_lt, out_gt, out_eq, out_lt);
	end

initial
	begin
		$dumpfile("komparator.vcd");
		$dumpvars(0, UUT);
	end

endmodule


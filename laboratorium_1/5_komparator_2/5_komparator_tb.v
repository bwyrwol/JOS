`timescale 1ns / 100ps

module test;

reg [1:0] in1;
reg [1:0] in2;
wire      in1_equal_in2,
          in1_greater_in2,
					in1_less_in2;

komparator UUT(.IN1(in1), .IN2(in2),
               .IN1_EQUAL_IN2(in1_equal_in2),
							 .IN1_GREATER_IN2(in1_greater_in2),
							 .IN1_LESS_IN2(in1_less_in2));

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
		$monitor("Time: %t   IN1: %d  IN2: %d   IN1>IN2: %b  IN1=IN2: %b  IN1<IN2: %b",
		         $time, in1, in2, in1_greater_in2, in1_equal_in2, in1_less_in2);
	end

initial
	begin
		$dumpfile("komparator.vcd");
		$dumpvars(0, UUT);
	end

endmodule


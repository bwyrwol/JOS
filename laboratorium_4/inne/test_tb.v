`timescale 1ns /1ps
module test_tb;

reg A;
wire Y;

test UUT (.a(A), .y(Y));

initial
	begin
		#0  A = 0;
		#5  A = 1;
		#10 A = 0;
		#10 $stop;
	end
	
initial
	$monitor("Czas:%t  A=%b Y=%b", $time, A, Y);

endmodule

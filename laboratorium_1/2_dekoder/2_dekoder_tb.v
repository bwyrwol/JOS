`timescale 1ns / 100ps
module dekoder_tb;

reg  [2:0] input_A;
wire [7:0] output_Y;

dekoder_1 UUT(input_A, output_Y);

integer i; // definicja tutaj nie wymaga nazwy bloku

initial
	begin
		$display("Start simulation\n");
	  //integer i; // definicja w bloku wymaga jego nazwy czyli begin: nazwa
		input_A = 0;
		for (i = 0; i < 8; i = i + 1)
			begin
				//#5 input_A = input_A + 1;
				#5 input_A = i;
			end

		#5 $finish;
	end

initial
	begin
		$timeformat(-9, 0, "ns", 6);
		$monitor("Time= %t   Input= %d   Output= %b", $time, input_A, output_Y);
	end

initial
	begin
		$dumpfile("dekoder.vcd");
		$dumpvars(0, UUT);
	end

endmodule


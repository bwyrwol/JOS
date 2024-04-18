`timescale 1ns / 100ps
module test;

parameter W = 4;

reg [W-1:0]  A;
reg [W-1:0]  B;
wire [W-1:0] S;
wire         Co;

ADD #(.W(W)) UUT (.A(A), .B(B), .S(S), .Co(Co));

initial
	begin: ini_test
		integer i;
		A = {W{1'b0}}; B = {W{1'b0}};

		for (i = 0; i < $pow(2, 2 * W); i = i + 1)
			#5 {A, B} = {A, B} + 1;

		$display("Koniec testu.");
	end

initial
	begin
		$timeformat(-9, 0, "ns", 6);
		$monitor("Czas: %t   A: %d B: %d  S: %d Co: %b", $time, A, B, S, Co);
	end

initial
	begin
		$dumpfile("adder.vcd");
		$dumpvars(0, UUT);
	end

endmodule

//zadania:
//1 dodac Ci
//2 symulacja behawioralna
//3 implementacja

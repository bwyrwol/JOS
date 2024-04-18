module licznik_asynchr(
	output [3:0] q,
	input clk,
	input reset
);

//4 instancje dwojki liczacej TFF
TFF tff0(
	.q			(q[0]),
	.clk		(clk),
	.reset	(reset)
);

TFF tff1(
	.q			(q[1]),
	.clk		(q[0]),
	.reset	(reset)
);

TFF tff2(
	.q			(q[2]),
	.clk		(q[1]),
	.reset	(reset)
);

TFF tff3(
	.q			(q[3]),
	.clk		(q[2]),
	.reset	(reset)
);

endmodule

//-------------------------------
//DFF z synchronicznym resetem
module DFF(
	output reg	q,
	input 			d,
	input 			clk,
	input 			reset
);

always @(posedge reset or negedge clk)
if (reset)
		q = 1'b0;
else
		#0 q = d;

endmodule

//-----------------------------
//dwojki liczace TFF
module TFF(
	output q,
	input clk,
	input reset
);

wire d;

DFF dff0(
	.q(q),
	.d(d),
	.clk(clk),
	.reset(reset)
);

assign d = ~q;

endmodule

//zadania:
//1 implementacja + symulacja
//2 dodac opoznienie do przerzutnika DFF + symulacja
//3 symulacja Post Route

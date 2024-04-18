module ADD #(
	parameter W = 4
)
(
	input [W-1:0] 	A,
	input [W-1:0] 	B,
	output [W-1:0] 	S,
	output			    Co
);

assign {Co,S} = A + B;

endmodule

//zadania:
//1 dodac Ci
//2 symulacja behawioralna
//3 implementacja

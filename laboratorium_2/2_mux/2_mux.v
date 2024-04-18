module mux(
	output		  y,
	input [1:0] sel,
	input [3:0] i
);

assign y = sel[1] ?
          (sel[0] ? i[3] : i[2]):
					(sel[0] ? i[1] : i[0]);

endmodule

//zadania:
//1 symulacja behawioralna

module tri_st #(parameter N = 2)
(
  output reg[N-1:0] out,
  input        	  	en,
  input [N-1:0]     data
);

	always @(en or data)
  	if (en)
      out = data;
    else
      out = {N{1'bz}};

endmodule

//zadania:
//1 symulacja behawioralna
//2 zmienic we/wy na wektory
//3 sparametryzowac modul (opearator konkatencji)

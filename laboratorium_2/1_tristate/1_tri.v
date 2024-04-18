module tri_st(
  output reg   out,
  input        en,
  input        data
);


	always @(en or data)
  	if (en)
      out = data;
    else
      out = 1'bz;

endmodule

//zadania:
//1 symulacja behawioralna
//2 zmienic we/wy na wektory
//3 sparametryzowac modul (opearator konkatencji)

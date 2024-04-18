//PWM proponowany w Language Templates 
module PWM #(
   parameter PREC = 4
)
(
   input                CLK,
   input                CLR,
   input [PREC-1:0]     wypelnienie,
   output reg           out
);

reg [PREC-1:0] wypeln_reg, licz_tmp;


   always @ (posedge CLK)
      if (CLR)
         wypeln_reg <= 0;
      else if (wypelnienie)
         wypeln_reg <= wypelnienie;

   always @ (posedge CLK)
      if (CLR)
         licz_tmp <= 0;
      else if (&licz_tmp)
				 licz_tmp <= wypeln_reg;
			  else if (out)
			         licz_tmp <= licz_tmp + 1;
					 else
						licz_tmp <= licz_tmp - 1;

   always @ (posedge CLK)
      if (CLR)
         out <= 1'b0;
      else if (&licz_tmp)
         out <= ~out;

endmodule

//----------------------------
//zadania do samodzielnego rozwiazania
//
//1. Przesymulowac dzialanie PWMa
//1a. Sprawdzic rozdzielczosc
//1b. Sprawdzic dzialenie PWMa dla wartosci max i min
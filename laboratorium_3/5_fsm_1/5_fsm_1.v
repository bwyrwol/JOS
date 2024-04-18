//automat wykrywajacy sekwencje 1011
module fsm(
	input 			CLK,
	input 			CLR,
	input 			CE,
	input 			IN,
	output reg  OUT
);

parameter st1 = 3'b000;
parameter st2 = 3'b001;
parameter st3 = 3'b110;
parameter st4 = 3'b111;
parameter st5 = 3'b100;

reg [2:0] state = st1;

   always@(posedge CLK)
	begin
      if (CLR) begin
         state <= st1;
         OUT <= 1'b0;
      end
      else
			if(CE) begin
				case (state)
					st1 :	begin
						if (IN == 1'b1)
							state <= st2;
						else
							state <= st1;
						OUT <= 0;
					end
					st2 :	begin
						if (IN == 1'b0)
							state <= st3;
						else
							state <= st2;
						OUT <= 1'b0;
					end
					st3 :	begin
						if (IN == 1'b1)
							state <= st4;
						else
							state <= st1;
						OUT <= 1'b0;
					end
					st4 :	begin
						if (IN == 1'b1)
							state <= st5;
						else
							state <= st3;
						OUT <= 1'b0;
					end
					st5 :	begin
						state <= st1;
						OUT <= 1'b1;
					end
					default : begin //domyslne przejscie - samokorekcja
						state <= st1;
						OUT <= 1'b0;
					end
				endcase
			end
	end
endmodule

//----------------------------
//zadania
//
//1. Napisac tb
//2. Sprawdzic dzialanie OUT

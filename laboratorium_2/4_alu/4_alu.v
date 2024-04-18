module alu #(
  parameter W = 4
)
(
  input [W-1:0]       A,
  input [W-1:0]       B,
  input [1:0]         OP,
  input               Ci,
  output reg [W-1:0]  Y, //zamiast: output [W-1:0] Y; reg [W-1:0] Y;
  output reg          Co,
  output              Z
);

//always @(*) //* oznacza wszystkie wejscia
always @(A or B or Ci or OP)
begin
  case(OP)
    2'b00:
			begin
      	Y = A & B; Co = 1'b0;
    	end
    2'b01:
			begin
      	Y = A | B; Co = 1'b0;
    	end
    2'b10: {Co,Y} = A + B + Ci;
    2'b11: {Co,Y} = A - B - Ci;		
  endcase	
end

assign Z = ~|Y;	

endmodule

//zadania:
//1 symulacja behawioralna
//2 implementacja

//Co to jest Z? Rola Co w operacjach logicznych?


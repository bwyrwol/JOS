module CNT(
  input              CLK,
  input              CLR,
  output reg [3:0]   Q
);

always @(posedge CLK or posedge CLR)
  if(CLR)
    #0.5 Q <= 4'd0;
  else
    #0.5 Q <= Q + 1;

endmodule

//zadania:
//1 napisac tb + symulacja
//2 dodac opoznienie + symulacja
//3 symulacja PostRoute

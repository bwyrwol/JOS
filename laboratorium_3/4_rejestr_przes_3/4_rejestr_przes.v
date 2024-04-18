module SHF_REG(
  input             CLK,
	input             CE,
  input             CLR,
  input             D,
  output reg [7:0]  Q
);

always @(posedge CLK or posedge CLR)
  if(CLR)
    Q <= 8'd0;
  else
		if(CE)
    	Q <= {Q[6:0],D};

endmodule

//zadania:
//1 uzale¿niæ rejestr od CE
//2 napisac tb + symulacja
//3 implementacja
//4 krazaca '1'

module counter #(
	parameter l_bit = 4
)
(
	input 			          clk,
	input 			          clr,
	input 			          ce,
	output reg[l_bit-1:0] q
);
      
  always @(posedge clk)
	begin
		if(clr)
			q <= {l_bit{1'b0}};
		else
			if (ce)
				q <= q + 1;
	end

endmodule
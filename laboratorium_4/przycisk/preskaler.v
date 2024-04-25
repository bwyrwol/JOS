module preskaler(input clk_in,
                 input clk_clr, 
                 input clk_ce, 
                 output clk_ceo);

parameter l_bit = 20;

reg [l_bit - 1:0] divider;

always @(posedge clk_in)
begin
  if (clk_clr)
    divider <= {l_bit{1'b0}};
  else
    if (clk_ce)
      divider <= divider + 1;
end

assign clk_ceo = (clk_ce & (&divider));

endmodule

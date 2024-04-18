`timescale 1ns / 1ps

module licznik_asynchr_tb;
reg clk;
reg reset;
wire [3:0] q;


licznik_asynchr r1(
	.q			(q),
	.clk    (clk),
	.reset  (reset)
);

//-------------
initial clk = 1'b0;
always #5 clk = ~clk; //generator zegara!!!!

//-------------
initial
begin
	reset = 1'b1;
	#18 reset = 1'b0;
	#180 reset = 1'b1;
	#10 reset = 1'b0;
	#20 $finish;
end

//monitor
initial
	begin
		$monitor($time, " Output q = %d",  q);
		$dumpfile("licz.vcd");
		$dumpvars(0, r1);
	end

endmodule  

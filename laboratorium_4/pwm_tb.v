`timescale 1ns / 1ps

module pwm_tb_v;
parameter PREC = 4;
reg CLK;
reg CLR;
reg [3:0] wypelnienie;
wire out;

	//instancja
	PWM #(
		.PREC(PREC)
	)
	pwm_test (
		.CLK(CLK),
		.CLR(CLR),
		.out(out),
		.wypelnienie(wypelnienie)
	);

	initial
	begin
		CLK = 0;
		CLR = 1'b1;
		wypelnienie = 0;
	end

	always #5 CLK = ~CLK;

	initial
	begin
		#20 CLR = 1'b0;
		wypelnienie = 4'd1;
		#300 $stop;
	end
      
endmodule
 
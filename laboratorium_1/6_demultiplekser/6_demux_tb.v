`timescale 1ns / 100ps

module test;

reg        inA;
reg [1:0]  inSel;
wire [3:0] outY;

demux1to4 UUT(.A(inA), .Sel(inSel), .Y(outY));

initial
	begin
		#0 inA = 0; inSel = 0;

		repeat(8)
			#5 {inSel, inA} = {inSel, inA} + 1;

		$finish;
	end

initial
	begin
		$timeformat(-9, 0, "ns", 6);
		$display("Simulation results");
		$display("  Time  Sel A   Y3 Y2 Y1 Y0");
		$monitor("%t   %d  %b    %b  %b  %b  %b", $time, inSel, inA, outY[3], outY[2], outY[1], outY[0]);

		$dumpfile("demux.vcd");
		$dumpvars(0, UUT);
	end

endmodule

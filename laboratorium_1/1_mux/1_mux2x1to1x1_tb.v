`timescale 1ns / 100ps

module mux2x1to1x1_tb;

reg A;
reg B;
reg Sel;
wire Y;

//mux2x1to1x1 UUT(A, B, Sel, Y);    // w kolejnosci wystepowania sygnalow
mux2x1to1x1 UUT(.a(A), .b(B), .sel(Sel), .y(Y));

initial
	begin
		#0		A = 0; B = 0;	Sel = 0;
		#5		A = 1;
		#5		A = 0;
		#5		B = 1;
		#5		B = 0;
		#5	Sel = 1;
		#5		A = 1;
		#5		A = 0;
		#5		B = 1;
		#5		B = 0;
		#5		$finish;
	end

initial
	$monitor($time, "A=%d B=%d Sel=%d     Y=%d", A, B, Sel, Y);

initial
  begin
    $dumpfile("mux2x1to1x1.vcd");
    $dumpvars(0, UUT);
  end


endmodule


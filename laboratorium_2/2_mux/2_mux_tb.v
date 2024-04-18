`timescale 1ns / 100ps

module mux_test;

reg [1:0] sel;
reg [3:0] i;
wire      y;

mux UUT(.y(y), .sel(sel), .i(i));

initial
	begin
		sel = 2'b00;
		repeat(4)	// sel
			begin
				i = 4'b0001;
				repeat(4) #5 i = i << 1;
				sel = sel + 1;
			end
		$display("Koniec symulacji");
		$finish;
	end

initial
	$monitor("Czas: %t   Sel: %b i: %b  y: %b", $time, sel, i, y);

initial
	begin
		$dumpfile("mux.vcd");
		$dumpvars(0, UUT);
	end

endmodule

//zadania:
//1 symulacja behawioralna

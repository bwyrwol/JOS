`timescale 1ns / 1ps

module alu_tb;

parameter W = 16;

reg [W-1:0] A,B;
reg Ci;
wire [W-1:0] Y;
wire Co,Z;
reg [1:0] OP;

alu #(
  .W(W)
)
A1
(
  .A(A),
  .B(B),
  .Ci(Ci),
  .Y(Y),
  .Co(Co),
  .Z(Z),
  .OP(OP)
);

initial begin
  A = 16'd0; B = 16'd0; OP = 2'b00; Ci = 1'b0;
  #10; A = 16'h05FA; B = 16'hF505;
  repeat(4) begin			
    #10 Ci = 1'b1;
    #10 Ci = 1'b0;
    OP = OP + 1;		
  end
  $finish;	//po symulacji nie wychodzic z isim'a
end

initial begin
	$dumpfile("alu.vcd");
	$dumpvars();	
end

endmodule

module demux1to4(
	input						 A,
	input [1:0]      Sel,
  output reg [3:0] Y
);

  always @(*)
    case (Sel)
      2'b00   : Y <= {3'b0, A};
      2'b01   : Y <= {2'b0, A, 1'b0};
      2'b10   : Y <= {1'b0, A, 2'b0};
      2'b11   : Y <= {A, 3'b0};
      default : Y <= 4'b0000;
    endcase

endmodule

//zadania:
//1 wykorzystujac pomysl z 4_dekoder.v zrealizowac demultiplekser 1->4
/*
      +------+
      |     /|
      |    / |____
      |   /  |
      |  /   |
      | /    |____
______|/     |
      |\     |
      | \    |____
      |  \   |
      |   \  |
      |    \ |____
      |     \|
      +-+-+--+
        | |
        | |
*/
//2 wykorzystujac pomysl z 4_dekoder.v mozna zbudowac koder, transkoder

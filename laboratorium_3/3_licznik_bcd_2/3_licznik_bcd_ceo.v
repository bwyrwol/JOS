module CNT(
  input             CLK,
  input             CLR,
  input             CE,
  output reg [3:0]  Q,
  output reg        CEO
);

always @(posedge CLK or posedge CLR)
  if(CLR)	begin
    	Q <= 4'd0;
			CEO <= 1'b0;
		end
  else begin
    if(CE) begin
      if(Q != 4'd9) begin
					Q <= Q + 1;
					//CEO <= 1'b0;
				end
      else begin
        	Q <= 4'd0;
					//CEO <=1'b1;
				end

			if (Q == 4'd8)
				#0.1 CEO <= 1'b1;
			else
				#0.1 CEO <= 1'b0;
    end
  end

//assign CEO = CE & (Q == 4'd9);

endmodule

//zadania:
//1 napisac tb + symulacja

//!!! zbadac wplyw CE; jak dziala CEO?

//2 zrealizowac CEO synchronicznie - przy generowaniu stanu Q
//3 dodac opoznienia do przypisania

//!!! jaka jest roznica pomiedzy realizacja 1 i 2 (ew. 3)

//4 zrealizowac polaczenie kaskadowe dwoch sekcji licznika bcd; przeniesienie ma byc zegarem nastepnej sekcji

//!!! wnioski

//5 realizacja synchroniczna --- specyfika ukladow FPGA; SKEW

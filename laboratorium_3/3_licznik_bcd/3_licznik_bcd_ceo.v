module CNT(
  input             CLK,
  input             CLR,
  input             CE,
  output reg [3:0]  Q,
  output            CEO
);

always @(posedge CLK or posedge CLR)
  if(CLR)
    Q <= 4'd0;
  else begin
    if(CE) begin
      if(Q != 4'd9)
        Q <= Q + 1;
      else
        Q <= 4'd0;
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

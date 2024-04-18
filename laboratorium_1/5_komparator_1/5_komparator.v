module komparator(IN1, IN2, OUT);
input [1:0] IN1, IN2;
output reg OUT;

   always @(IN1 or IN2)
      if (IN1 >= IN2)  //typ komparatora
	    OUT = 1'b1;
      else
		OUT = 1'b0;

endmodule

//zadania:
//1 implementacja
//2 zrealizowac komparator z wyjsciami I1>I2, I1=I2, I1<I2
/*
        |  |        |  |
       _|  |_      _|  |_
       \    /      \    /
        \  /        \  /
     +--------------------+
     |                    |
     |                  > +------
     |                  = +------
     |                  < +------
     |                    |
     +--------------------+
*/
//3 zrealizowac komparator kaskadowy z wejsciani/wyjsciami I1>I2, I1=I2, I1<I2
/*
        |  |        |  |
       _|  |_      _|  |_
       \    /      \    /
        \  /        \  /
     +--------------------+
     |                    |
-----+ >                > +------
-----+ =                = +------
-----+ <                < +------
     |                    |
     +--------------------+
*/

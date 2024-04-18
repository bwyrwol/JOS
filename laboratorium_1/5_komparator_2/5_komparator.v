/* wersja 1
module komparator(IN1, IN2, IN1_EQUAL_IN2, IN1_GREATER_IN2, IN1_LESS_IN2);
input [1:0] IN1, IN2;
output reg IN1_EQUAL_IN2, IN1_GREATER_IN2, IN1_LESS_IN2;

   always @(IN1 or IN2)
    if (IN1 > IN2)
	    IN1_GREATER_IN2 = 1'b1;
    else
			IN1_GREATER_IN2 = 1'b0;

   always @(IN1 or IN2)
    if (IN1 < IN2)
	    IN1_LESS_IN2 = 1'b1;
    else
			IN1_LESS_IN2 = 1'b0;

   always @(IN1 or IN2)
    if (IN1 == IN2)
	    IN1_EQUAL_IN2 = 1'b1;
    else
			IN1_EQUAL_IN2 = 1'b0;

endmodule
*/

module komparator(IN1, IN2, IN1_EQUAL_IN2, IN1_GREATER_IN2, IN1_LESS_IN2);
input [1:0] IN1, IN2;
output wire IN1_EQUAL_IN2, IN1_GREATER_IN2, IN1_LESS_IN2;

	assign IN1_GREATER_IN2 = (IN1 > IN2);
	assign IN1_LESS_IN2    = (IN1 < IN2);
	assign IN1_EQUAL_IN2   = ~(IN1_GREATER_IN2 | IN1_LESS_IN2);


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

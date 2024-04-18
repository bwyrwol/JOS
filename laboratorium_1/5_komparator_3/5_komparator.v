
module komparator(IN1, IN2, inEQ, inGT, inLT, outEQ, outGT, outLT);
	input [1:0] IN1, IN2;
	input inEQ, inGT, inLT;
	output wire outEQ, outGT, outLT;

	assign outGT = inGT | (inEQ & (IN1 > IN2));
	assign outLT = inLT | (inEQ & (IN1 < IN2));
	assign outEQ = ~(outGT | outLT);

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

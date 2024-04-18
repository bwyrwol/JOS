module mux2x1to1x1(input a, b, sel, output y);

assign y = (sel) ? b : a;

endmodule

//zadania:
//1 implementacja
//2 napisac MUX 2->1 dwubitowy + implementacja (wykorxzystujac instrukcje warunkowa)
//      +------+
//      |\     |
//___|\ | \    |
//     \|  \   |
//___  /|   \  |
//   |/ |    \ |
//      |     \|___|\ 
//            /|     \
//___|\ |    / |___  /
//     \|   /  |   |/
//___  /|  /   |
//   |/ | /    |
//      |/     |
//      +---+--+
//          |
//          |
			 
//3 napisac MUX 4->1 + implementacja (wykorxzystujac instrukcje warunkowa)

//      +------+
//      |\     |
//______| \    |
//      |  \   |
//______|   \  |
//      |    \ |
//      |     \|____ 
//______|     /|
//      |    / |
//      |   /  |
//______|  /   |
//      | /    |
//      |/     |
//      +-+-+--+
//        | |
//        | |

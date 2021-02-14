module sevenseg(a,seg_a);
	input [3:0]a;
	output [6:0]seg_a;
	reg [6:0]seg_a;
	always@(a)begin
		case(a)
			4'b0000:seg_a=7'b1000000;//0
			4'b0001:seg_a=7'b1111001;//1
			4'b0010:seg_a=7'b0100100;//2
			4'b0011:seg_a=7'b0110000;//3
			4'b0100:seg_a=7'b0011001;//4
			4'b0101:seg_a=7'b0010010;//5
			4'b0110:seg_a=7'b0000010;//6
			4'b0111:seg_a=7'b1111000;//7
			4'b1000:seg_a=7'b0000000;//8
			4'b1001:seg_a=7'b0011000;//9
			4'b1010:seg_a=7'b0001000;
			4'b1011:seg_a=7'b0000011;
			4'b1100:seg_a=7'b1000110;
			4'b1101:seg_a=7'b0100001;
			4'b1110:seg_a=7'b0001110;
			4'b1111:seg_a=7'b0001110;
			default:seg_a=7'b1111111;
		endcase
	end
endmodule

module newsignedmulwith7(a,b,seg_sign,seg_tens,seg_ones);
	input signed[3:0]a,b;
	output [6:0]seg_sign,seg_tens,seg_ones;
	reg[6:0]seg_tens,seg_ones;
	reg sign;
	reg [3:0]tens,ones;
	wire signed[7:0]sum;
	reg [7:0]nsum;
	assign sum=a*b;
	assign seg_sign=(sum[7]==1)?7'b0111111:7'b1111111;
	always@(sum)begin
		if(sum[7]==1'b1)begin
		nsum=(~sum)+1;
		sign=1'b1;
		end
		if(sum[7]==1'b0)begin
		nsum=sum;
		sign=1'b0;
		end
		ones=nsum%10;
		tens=(nsum/10)%10;
	end
	always@(tens)begin
		case(tens)
			4'b0000:seg_tens=7'b1000000;//0
			4'b0001:seg_tens=7'b1111001;//1
			4'b0010:seg_tens=7'b0100100;//2
			4'b0011:seg_tens=7'b0110000;//3
			4'b0100:seg_tens=7'b0011001;//4
			4'b0101:seg_tens=7'b0010010;//5
			4'b0110:seg_tens=7'b0000010;//6
			4'b0111:seg_tens=7'b1111000;//7
			4'b1000:seg_tens=7'b0000000;//8
			4'b1001:seg_tens=7'b0011000;//9
			default:seg_tens=7'b1111111;
		endcase
	end
	always@(ones)begin
		case(ones)
			4'b0000:seg_ones=7'b1000000;//0
			4'b0001:seg_ones=7'b1111001;//1
			4'b0010:seg_ones=7'b0100100;//2
			4'b0011:seg_ones=7'b0110000;//3
			4'b0100:seg_ones=7'b0011001;//4
			4'b0101:seg_ones=7'b0010010;//5
			4'b0110:seg_ones=7'b0000010;//6
			4'b0111:seg_ones=7'b1111000;//7
			4'b1000:seg_ones=7'b0000000;//8
			4'b1001:seg_ones=7'b0011000;//9
			default:seg_ones=7'b1111111;
		endcase
	end
endmodule

module signbcdconverterwith7(binary,seg_hundreds,seg_tens,seg_ones,sign_b);
	input signed[7:0]binary;
	reg[7:0]nbinary;
	output [6:0]seg_hundreds,seg_tens,seg_ones,sign_b;
	reg[3:0]hundreds,tens,ones;
	reg[6:0]seg_hundreds,seg_tens,seg_ones;
	integer i;
	assign sign_b=(binary[7]==1)?7'b0111111:7'b1111111;
	always@(binary)begin
		if(binary[7]==1) nbinary=(~binary)+1;
		if(binary[7]==0) nbinary=binary;
		hundreds=4'b0000;
		tens=4'b0000;
		ones=4'b0000;
		for(i=7;i>=0;i=i-1)begin
			if(hundreds>=5)hundreds=hundreds+4'b0011;
			if(tens>=5)tens=tens+4'b0011;
			if(ones>=5)ones=ones+4'b0011;
			hundreds=hundreds<<1;
			hundreds[0]=tens[3];
			tens=tens<<1;
			tens[0]=ones[3];
			ones=ones<<1;
			ones[0]=nbinary[i];
		end
	end
	always@(hundreds)begin
		case(hundreds)
			4'b0000:seg_hundreds=7'b1000000;//0
			4'b0001:seg_hundreds=7'b1111001;//1
			4'b0010:seg_hundreds=7'b0100100;//2
			4'b0011:seg_hundreds=7'b0110000;//3
			4'b0100:seg_hundreds=7'b0011001;//4
			4'b0101:seg_hundreds=7'b0010010;//5
			4'b0110:seg_hundreds=7'b0000010;//6
			4'b0111:seg_hundreds=7'b1111000;//7
			4'b1000:seg_hundreds=7'b0000000;//8
			4'b1001:seg_hundreds=7'b0011000;//9
			default:seg_hundreds=7'b1111111;
		endcase
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

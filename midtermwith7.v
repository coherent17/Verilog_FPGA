module midtermwith7(a,b,op,seg_a,seg_b,seg_ones,seg_tens,seg_r,lop);
	input [3:0]a,b;
	input [1:0]op;
	output [1:0]lop;
	reg [1:0]lop;
	output [6:0]seg_a,seg_b,seg_ones,seg_tens,seg_r;
	reg [7:0]result;
	reg [6:0]seg_a,seg_b,seg_r,seg_ones,seg_tens;
	reg [3:0]r;
	reg [3:0]temp_ones;
	reg[3:0]temp_tens;
	always@(*)begin
		r=4'b0000;
		if(op==2'b00)begin
		result=a+b;
		r=4'b1010;
		end
		else if(op==2'b01)begin
			if(a>=b)begin
			result=a-b;
			r=4'b1010;
			end
			else if(a<b)begin
			result=b-a;
			r=4'b1010;
			end
		end
		else if(op==2'b10)begin
		result=a*b;
		r=4'b1010;
		end
		else if(op==2'b11)begin
		if(b!=0)begin
		result=a/b;
		r=a%b;
		end
		else if(b==0)begin
		result=8'b00000000;
		r=4'b1010;
		end
		end
		if((a<b)&&(op==2'b01))begin
		temp_tens=4'b1010;
		temp_ones=result%10;
		end
		else if((b==0)&&(op==2'b11))begin
		temp_tens=7'b1111111;
		temp_ones=7'b1111111;
		end
		else begin
		temp_ones=result%10;
		temp_tens=result/10;
		end
		lop=op;
	end
	always@(*)begin
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
			default:seg_a=7'b1111111;
		endcase
	end
	always@(*)begin
		case(b)
			4'b0000:seg_b=7'b1000000;//0
			4'b0001:seg_b=7'b1111001;//1
			4'b0010:seg_b=7'b0100100;//2
			4'b0011:seg_b=7'b0110000;//3
			4'b0100:seg_b=7'b0011001;//4
			4'b0101:seg_b=7'b0010010;//5
			4'b0110:seg_b=7'b0000010;//6
			4'b0111:seg_b=7'b1111000;//7
			4'b1000:seg_b=7'b0000000;//8
			4'b1001:seg_b=7'b0011000;//9
			default:seg_b=7'b1111111;
		endcase
	end
	always@(*)begin
		case(temp_ones)
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
	always@(*)begin
		case(temp_tens)
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
			4'b1010:seg_tens=7'b0111111;//-
			default:seg_tens=7'b1111111;
		endcase
	end
	always@(*)begin
		case(r)
			4'b0000:seg_r=7'b1000000;//0
			4'b0001:seg_r=7'b1111001;//1
			4'b0010:seg_r=7'b0100100;//2
			4'b0011:seg_r=7'b0110000;//3
			4'b0100:seg_r=7'b0011001;//4
			4'b0101:seg_r=7'b0010010;//5
			4'b0110:seg_r=7'b0000010;//6
			4'b0111:seg_r=7'b1111000;//7
			4'b1000:seg_r=7'b0000000;//8
			4'b1001:seg_r=7'b0011000;//9
			4'b1010:seg_r=7'b1111111;//delete r
			default:seg_r=7'b1111111;
		endcase
	end
endmodule

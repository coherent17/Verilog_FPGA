module addsubwith7(a,b,sum,op,ov,sign_a,seg_a,sign_b,seg_b,sign_sum,seg_sum,sign_op,sign_ov);
	input signed[3:0]a,b;
	input op;
	output signed[3:0]sum;
	output ov;
	output [6:0]sign_a,seg_a,sign_b,seg_b,sign_sum,seg_sum;
	output sign_op,sign_ov;
	wire c1,c2,c3,c4;
	wire [3:0]bb;
	reg [6:0]seg_a,seg_b,seg_sum;
	assign bb[0]=op^b[0];
	assign bb[1]=op^b[1];
	assign bb[2]=op^b[2];
	assign bb[3]=op^b[3];
	fulladder o1(.a(a[0]),.b(bb[0]),.cin(op),.sum(sum[0]),.cout(c1));
	fulladder o2(.a(a[1]),.b(bb[1]),.cin(c1),.sum(sum[1]),.cout(c2));
	fulladder o3(.a(a[2]),.b(bb[2]),.cin(c2),.sum(sum[2]),.cout(c3));
	fulladder o4(.a(a[3]),.b(bb[3]),.cin(c3),.sum(sum[3]),.cout(c4));
	assign ov=c3^c4;
	assign sign_ov=c3^c4;
	assign sign_op=op;
	assign sign_a=(a<0)?7'b0111111:7'b1111111;
	assign sign_b=(b<0)?7'b0111111:7'b1111111;
	assign sign_sum=(sum<0)?7'b0111111:7'b1111111;
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
			4'b1001:seg_a=7'b1111000;//7
			4'b1010:seg_a=7'b0000010;//6
			4'b1011:seg_a=7'b0010010;//5
			4'b1100:seg_a=7'b0011001;//4
			4'b1101:seg_a=7'b0110000;//3
			4'b1110:seg_a=7'b0100100;//2
			4'b1111:seg_a=7'b1111001;//1
			default:seg_a=7'b1111111;
		endcase
	end
	always@(b)begin
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
			4'b1001:seg_b=7'b1111000;//7
			4'b1010:seg_b=7'b0000010;//6
			4'b1011:seg_b=7'b0010010;//5
			4'b1100:seg_b=7'b0011001;//4
			4'b1101:seg_b=7'b0110000;//3
			4'b1110:seg_b=7'b0100100;//2
			4'b1111:seg_b=7'b1111001;//1
			default:seg_b=7'b1111111;
		endcase
	end
	always@(sum)begin
		case(sum)
			4'b0000:seg_sum=7'b1000000;//0
			4'b0001:seg_sum=7'b1111001;//1
			4'b0010:seg_sum=7'b0100100;//2
			4'b0011:seg_sum=7'b0110000;//3
			4'b0100:seg_sum=7'b0011001;//4
			4'b0101:seg_sum=7'b0010010;//5
			4'b0110:seg_sum=7'b0000010;//6
			4'b0111:seg_sum=7'b1111000;//7
			4'b1000:seg_sum=7'b0000000;//8
			4'b1001:seg_sum=7'b1111000;//7
			4'b1010:seg_sum=7'b0000010;//6
			4'b1011:seg_sum=7'b0010010;//5
			4'b1100:seg_sum=7'b0011001;//4
			4'b1101:seg_sum=7'b0110000;//3
			4'b1110:seg_sum=7'b0100100;//2
			4'b1111:seg_sum=7'b1111001;//1
			default:seg_sum=7'b1111111;
		endcase
	end
endmodule

module fulladder(a,b,cin,sum,cout);
	input a,b,cin;
	output sum,cout;
	assign {cout,sum}=a+b+cin;
endmodule

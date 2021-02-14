module stopwatch(clk,rst,pb,seg0,seg1,seg2,seg3,seg4,seg5);
	input clk,rst,pb;
	output [6:0]seg0,seg1,seg2,seg3,seg4,seg5;
	reg clk1;
	reg [15:0]count;
	reg [23:0]bcdcounter;
	reg stop;
	//reduce the frequency
	//original clk run 50000times get the inverse clk1;
	//so the clk1 T=50000*2=100000 get 100Hz clk1
	always@(posedge clk or negedge rst)begin
		if(rst==1'b0)begin
			count=0;
			clk1=0;
		end
		else if(count==50000)begin
			count=0;
			clk1=~clk1;
		end
		else count=count+1;
	end
	always@(negedge rst or negedge pb)begin
		if(rst==1'b0) stop=1;
		else if (pb==0) stop=~stop;
		else stop=stop;
	end
	always@(posedge clk1 or negedge rst)begin
		if(rst==1'b0)begin
			bcdcounter=0;
		end
		else if (stop) bcdcounter<=bcdcounter;
		else if (bcdcounter==24'h595999)begin
			bcdcounter=0;
		end
		else if (bcdcounter[19:0]==20'h95999)begin
			bcdcounter[23:20]=bcdcounter[23:20]+1;
			bcdcounter[19:0]=0;
		end
		else if (bcdcounter[15:0]==16'h5999)begin
			bcdcounter[19:16]=bcdcounter[19:16]+1;
			bcdcounter[15:0]=0;
		end
		else if (bcdcounter[11:0]==12'h999)begin
				bcdcounter[15:12]=bcdcounter[15:12]+1;
				bcdcounter[11:0]=0;
		end
		else if(bcdcounter[7:0]==8'h99)begin
			bcdcounter[11:8]=bcdcounter[11:8]+1;
			bcdcounter[7:0]=0;
		end
		else if (bcdcounter[3:0]==4'h9)begin
			bcdcounter[7:4]=bcdcounter[7:4]+1;
			bcdcounter[3:0]=0;
		end
		else bcdcounter[3:0]=bcdcounter[3:0]+1;
	end
	bcdtobinary o1(.binary(bcdcounter[3:0]),.seg(seg0));
	bcdtobinary o2(.binary(bcdcounter[7:4]),.seg(seg1));
	bcdtobinary o3(.binary(bcdcounter[11:8]),.seg(seg2));
	bcdtobinary o4(.binary(bcdcounter[15:12]),.seg(seg3));
	bcdtobinary o5(.binary(bcdcounter[19:16]),.seg(seg4));
	bcdtobinary o6(.binary(bcdcounter[23:20]),.seg(seg5));
endmodule
	
module bcdtobinary(binary,seg);
	input [3:0]binary;
	output [6:0]seg;
	reg [6:0]seg;
	always@(binary)begin
		case(binary)
			4'b0000:seg=7'b1000000;//0
			4'b0001:seg=7'b1111001;//1
			4'b0010:seg=7'b0100100;//2
			4'b0011:seg=7'b0110000;//3
			4'b0100:seg=7'b0011001;//4
			4'b0101:seg=7'b0010010;//5
			4'b0110:seg=7'b0000010;//6
			4'b0111:seg=7'b1111000;//7
			4'b1000:seg=7'b0000000;//8
			4'b1001:seg=7'b0011000;//9
			default:seg=7'b1111111;
		endcase
	end
endmodule


	
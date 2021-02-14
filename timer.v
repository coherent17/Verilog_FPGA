module timer(clk,rst,hour1,hour0,min1,min0,sec1,sec0,pb,swh,swm,sws);
	input clk,rst,pb,swh,swm,sws;
	output [6:0]hour1,hour0,min1,min0,sec1,sec0;
	reg [5:0]hour,min,sec;
	reg clk1;
	reg [24:0]count;
	reg stop;
	reg stoph,stopm,stops;
	reg [23:0] bcdcounter;
	reg [7:0] bcdh,bcdm,bcds;
	//reduce the frenquency
	always@(posedge clk or negedge rst)begin
		if(rst==1'b0)begin
			count=0;
			clk1=0;
		end
		else if(count==1000000)begin
			count=0;
			clk1=~clk1;
		end
		else count=count+1;
	end
	
	always@(negedge rst or negedge pb)begin
		if(rst==1'b0) stop=1;
		else stop=0;
	end
	
	always@(posedge clk1 or negedge rst)begin
		if(~rst)bcdcounter=0;
		//hour increase
		else if(stop==1&&swh==1&&bcdcounter[23:16]==8'h23)bcdcounter[23:16]=0;
		else if(stop==1&&swh==1&&bcdcounter[19:16]==4'h9)begin
			bcdcounter[19:16]=0;
			bcdcounter[23:20]=bcdcounter[23:20]+1;
		end
		else if(stop==1&&swh==1)bcdcounter[23:16]<=bcdcounter[23:16]+1;
		//minute increase
		else if(stop==1&&swm==1&&bcdcounter[15:8]==8'h59)bcdcounter[15:8]=0;
		else if(stop==1&&swm==1&&bcdcounter[11:8]==4'h9)begin
			bcdcounter[11:8]=0;
			bcdcounter[15:12]=bcdcounter[15:12]+1;
		end
		else if(stop==1&&swm==1)bcdcounter[15:8]<=bcdcounter[15:8]+1;
		//second increase
		else if(stop==1&&sws==1&&bcdcounter[7:0]==8'h59)bcdcounter[7:0]=0;
		else if(stop==1&&sws==1&&bcdcounter[3:0]==4'h9)begin
			bcdcounter[3:0]=0;
			bcdcounter[7:4]=bcdcounter[7:4]+1;
		end
		else if(stop==1&&sws==1)bcdcounter[3:0]<=bcdcounter[3:0]+1;
		else if(stop==1)bcdcounter=bcdcounter;
		else if(bcdcounter==24'h235959)bcdcounter=0;
		else if(bcdcounter[19:0]==20'h45959) begin
			bcdcounter[19:0]=0;
			bcdcounter[23:20]=bcdcounter[23:20]+1;
		end
		else if (bcdcounter[15:0]==16'h5959)begin
			bcdcounter[19:16]=bcdcounter[19:16]+1;
			bcdcounter[15:0]=0;
		end
		else if (bcdcounter[11:0]==12'h959)begin
				bcdcounter[15:12]=bcdcounter[15:12]+1;
				bcdcounter[11:0]=0;
		end
		else if(bcdcounter[7:0]==8'h59)begin
			bcdcounter[11:8]=bcdcounter[11:8]+1;
			bcdcounter[7:0]=0;
		end
		else if (bcdcounter[3:0]==4'h9)begin
			bcdcounter[7:4]=bcdcounter[7:4]+1;
			bcdcounter[3:0]=0;
		end
		else bcdcounter[3:0]=bcdcounter[3:0]+1;
	end
	bcdtobinary o1(.binary(bcdcounter[3:0]),.seg(sec0));
	bcdtobinary o2(.binary(bcdcounter[7:4]),.seg(sec1));
	bcdtobinary o3(.binary(bcdcounter[11:8]),.seg(min0));
	bcdtobinary o4(.binary(bcdcounter[15:12]),.seg(min1));
	bcdtobinary o5(.binary(bcdcounter[19:16]),.seg(hour0));
	bcdtobinary o6(.binary(bcdcounter[23:20]),.seg(hour1));
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

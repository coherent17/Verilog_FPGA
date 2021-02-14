module change(clk,rst,pb,sw0,sw1,sw2,sw3,seg5,seg4,seg3,seg2,seg1,seg0,led);
	input clk,rst,pb,sw0,sw1,sw2,sw3;
	output [6:0]seg5,seg4,seg3,seg2,seg1,seg0;
	output [9:0]led;
	reg [6:0]seg5,seg4;
	reg unsigned[6:0]num;
	reg clk1Hz;
	reg unsigned[22:0]counter,a,i;
	reg check;
	reg [3:0]t,o;
	reg [4:1]Q;
	reg [15:0]bcdcounter;
	reg [3:0]ledstate,nledstate;
	reg [9:0]led;
	//reduce the frequency
	always@(posedge clk or negedge rst)begin
 		if(~rst)begin
			counter <= 0;
			clk1Hz <= 0;
		end

		else if(counter==4000000)begin
			counter <=0;
			clk1Hz <= ~clk1Hz;
		end
		else counter <= counter + 1;
	end
	always@(posedge clk1Hz)begin
		if(i>=24789) i=1;
		else i<=i+79;
	end
	//get random number
	always@(a)begin
		num=(a>0)?a:a+1887;
	end
	always@(posedge clk1Hz or negedge pb)begin
		if(~pb)bcdcounter=0;
		//50 increase
		else if(sw3==1&&bcdcounter[15:12]==4'h1)bcdcounter[15:12]=0;
		else if(sw3==1)begin
			bcdcounter[15:12]=bcdcounter[15:12]+1;
		end
		//10 increase
		else if(sw2==1&&bcdcounter[11:8]==4'h4)bcdcounter[11:8]=0;
		else if(sw2==1)begin
			bcdcounter[11:8]=bcdcounter[11:8]+1;
		end
		//5 increase
		else if(sw1==1&&bcdcounter[7:4]==4'h1)bcdcounter[7:4]=0;
		else if(sw1==1)begin
			bcdcounter[7:4]=bcdcounter[7:4]+1;
		end
		//1 increase
		else if(sw0==1&&bcdcounter[3:0]==4'h4)bcdcounter[3:0]=0;
		else if(sw0==1)begin
			bcdcounter[3:0]=bcdcounter[3:0]+1;
		end
	end
	bcdtobinary o1(.binary(bcdcounter[15:12]),.seg(seg3));
	bcdtobinary o2(.binary(bcdcounter[11:8]),.seg(seg2));
	bcdtobinary o3(.binary(bcdcounter[7:4]),.seg(seg1));
	bcdtobinary o4(.binary(bcdcounter[3:0]),.seg(seg0));
	//evaluate if the answer is correct
	always@(*)begin
		if(50*bcdcounter[15:12]+10*bcdcounter[11:8]+5*bcdcounter[7:4]+bcdcounter[3:0]==num)check=1;
		else check=0;
	end
	
	//produce a random number which is varied by clk
	always@(negedge clk1Hz)begin
 		if(check==1) a=(i%98)+1;
	end
	//convert num into segment
	always@(num)begin
		t=num/10;
		o=num%10;
		case(t)
			4'b0000: seg5=7'b1000000;
			4'b0001:	seg5=7'b1111001;
			4'b0010:	seg5=7'b0100100;
			4'b0011:	seg5=7'b0110000;
			4'b0100:	seg5=7'b0011001;
			4'b0101:	seg5=7'b0010010;
			4'b0110: seg5=7'b0000010;
			4'b0111: seg5=7'b1111000;
			4'b1000:	seg5=7'b0000000;
			4'b1001: seg5=7'b0011000;
			default: seg5=7'b1111111;
		endcase
		case(o)
			4'b0000: seg4=7'b1000000;
			4'b0001:	seg4=7'b1111001;
			4'b0010:	seg4=7'b0100100;
			4'b0011:	seg4=7'b0110000;
			4'b0100:	seg4=7'b0011001;
			4'b0101:	seg4=7'b0010010;
			4'b0110: seg4=7'b0000010;
			4'b0111: seg4=7'b1111000;
			4'b1000:	seg4=7'b0000000;
			4'b1001: seg4=7'b0011000;
			default: seg4=7'b1111111;
		endcase
	end
	//memory logic for ledstate
	always@(posedge clk or negedge rst)begin
		if(~rst) ledstate=0;
		else ledstate=nledstate;
	end
	//nextstate logic for ledstate
	always@(negedge clk1Hz or negedge rst)begin
		if(~rst) nledstate=0;
		else if(ledstate==4'b1010&&check==1) nledstate=4'b0;
		else if(check==1)nledstate=ledstate+1;
	end
	//output logic for ledstate
	always@(ledstate)begin
		case(ledstate)
			4'b0000:led=10'b0000000000;
			4'b0001:led=10'b0000000001;
			4'b0010:led=10'b0000000011;
			4'b0011:led=10'b0000000111;
			4'b0100:led=10'b0000001111;
			4'b0101:led=10'b0000011111;
			4'b0110:led=10'b0000111111;
			4'b0111:led=10'b0001111111;
			4'b1000:led=10'b0011111111;
			4'b1001:led=10'b0111111111;
			4'b1010:led=10'b1111111111;
		endcase
	end
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

module guess(sw,clk,rst,pb,seg0,seg1,seg2,seg3,seg4,seg5);
	input clk,rst,pb;
	input [4:0]sw;
	output [6:0]seg0,seg1,seg2,seg3,seg4,seg5;
	reg [6:0]seg0,seg1,seg2,seg3;
	reg [4:0]num;
	reg clk1,stop,check;
	reg unsigned[22:0]count,a,i;
	reg [4:0]t,o,s0,s1;
	reg [7:0]bcdcounter;
	reg unsigned[4:0]point;
	always@(posedge clk or negedge rst)begin
		if(~rst)begin
			count=0;
			clk1=0;
		end
		else if(count==5000000)begin
			count=0;
			clk1=~clk1;
		end
		else count=count+1;
	end
	always@(posedge clk1)begin
		if(i>=24789) i=1;
		else i<=i+91;
	end
	always@(a)begin
		num=(a>0)?a:a+123;
	end
	always@(negedge pb or negedge rst)begin
		if(~rst) stop=1;
		else if(pb==0) stop=~stop;
		else stop=stop;
	end
	always@(*)begin
		if(stop==0&&num==sw&&bcdcounter[7:0]<8'h59)	check=1;
		else check=0;
	end
	always@(negedge clk1 or negedge rst)begin
		if(~rst) point=0;
		else if(check==1)begin
			a=(i%30)+1;
			point=point+1;
		end
	end
	always@(num)begin
		t=num/10;
		o=num%10;
		case(t)
			4'b0000: seg1=7'b1000000;
			4'b0001:	seg1=7'b1111001;
			4'b0010:	seg1=7'b0100100;
			4'b0011:	seg1=7'b0110000;
			4'b0100:	seg1=7'b0011001;
			4'b0101:	seg1=7'b0010010;
			4'b0110: seg1=7'b0000010;
			4'b0111: seg1=7'b1111000;
			4'b1000:	seg1=7'b0000000;
			4'b1001: seg1=7'b0011000;
			default: seg1=7'b1111111;
		endcase
		case(o)
			4'b0000: seg0=7'b1000000;
			4'b0001:	seg0=7'b1111001;
			4'b0010:	seg0=7'b0100100;
			4'b0011:	seg0=7'b0110000;
			4'b0100:	seg0=7'b0011001;
			4'b0101:	seg0=7'b0010010;
			4'b0110: seg0=7'b0000010;
			4'b0111: seg0=7'b1111000;
			4'b1000:	seg0=7'b0000000;
			4'b1001: seg0=7'b0011000;
			default: seg0=7'b1111111;
		endcase
	end
	always@(point)begin
		s0=point%10;
		s1=point/10;
		case(s1)
			4'b0000: seg3=7'b1000000;
			4'b0001:	seg3=7'b1111001;
			4'b0010:	seg3=7'b0100100;
			4'b0011:	seg3=7'b0110000;
			4'b0100:	seg3=7'b0011001;
			4'b0101:	seg3=7'b0010010;
			4'b0110: seg3=7'b0000010;
			4'b0111: seg3=7'b1111000;
			4'b1000:	seg3=7'b0000000;
			4'b1001: seg3=7'b0011000;
			default: seg3=7'b1111111;
		endcase
		case(s0)
			4'b0000: seg2=7'b1000000;
			4'b0001:	seg2=7'b1111001;
			4'b0010:	seg2=7'b0100100;
			4'b0011:	seg2=7'b0110000;
			4'b0100:	seg2=7'b0011001;
			4'b0101:	seg2=7'b0010010;
			4'b0110: seg2=7'b0000010;
			4'b0111: seg2=7'b1111000;
			4'b1000:	seg2=7'b0000000;
			4'b1001: seg2=7'b0011000;
			default: seg2=7'b1111111;
		endcase
	end
	always@(posedge clk1 or negedge rst)begin
		if(~rst) bcdcounter=0;
		else if(stop) bcdcounter<=bcdcounter;
		else if(bcdcounter[7:0]==8'h59) bcdcounter<=bcdcounter;
		else if(bcdcounter[3:0]==4'h9)begin
			bcdcounter[7:4]=bcdcounter[7:4]+1;
			bcdcounter[3:0]=0;
		end
		else bcdcounter[3:0]=bcdcounter[3:0]+1;
	end
	bcd b1(.counter(bcdcounter[3:0]),.seg(seg4));
	bcd b2(.counter(bcdcounter[7:4]),.seg(seg5));
endmodule


module bcd(counter,seg);
	input [3:0]counter;
	output [6:0]seg;
	reg [6:0]seg;
	always@(counter)begin
 		case(counter)
			4'b0000: seg=7'b1000000;
			4'b0001:	seg=7'b1111001;
			4'b0010:	seg=7'b0100100;
			4'b0011:	seg=7'b0110000;
			4'b0100:	seg=7'b0011001;
			4'b0101:	seg=7'b0010010;
			4'b0110: seg=7'b0000010;
			4'b0111: seg=7'b1111000;
			4'b1000:	seg=7'b0000000;
			4'b1001: seg=7'b0011000;
			default: seg=7'b1111111;
		endcase
	end
endmodule

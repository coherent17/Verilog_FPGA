module secondmidterm(rst,pb,clk,seg0,seg1,seg2,seg3);
	input rst,pb,clk;
	output [3:0]seg0,seg1,seg2,seg3;
	reg [6:0]seg0,seg1,seg2,seg3,clk1;
	reg [4:0]state,nstate;
	reg [22:0]count;
	integer i;
	reg flag;
	//reduce the frenquency
	always@(posedge clk or negedge rst)begin
		if(~rst)begin
			count=0;
			clk1=0;
			i=0;
		end
		else if(count==2500000)begin
			count=0;
			clk1=~clk1;
		end
		else count<=count+1;
	end
	always@(negedge pb or negedge rst)begin
		if(~rst) flag=1;
		else if(pb==0)flag=~flag;
		else flag=flag;
	end
	//memory logic
	always@(posedge clk1 or negedge rst)begin
		if(~rst) state=0;
		else state=nstate;
	end
	//nextstate logic for the segment state
	always@(state)begin
		if(flag==1&&state==5'b10011)nstate=5'b0;
		else if(flag==0&&state==5'b0)nstate=5'b10011;
		else if(flag==1)nstate=state+1;
		else if(flag==0)nstate=state-1;
	end
	//output logic for the segment state
	always@(state)begin
		case(state)
			5'b00000:begin//圖1
				seg3[6:0]=7'b1111110;
				seg2[6:0]=7'b1111110;
				seg1[6:0]=7'b1111110;
				seg0[6:0]=7'b1111111;
			end
			5'b00001:begin//圖2
				seg3[6:0]=7'b1111111;
				seg2[6:0]=7'b1111110;
				seg1[6:0]=7'b1111110;
				seg0[6:0]=7'b1111110;
			end
			5'b00010:begin//圖3
				seg3[6:0]=7'b1111111;
				seg2[6:0]=7'b1111111;
				seg1[6:0]=7'b1111110;
				seg0[6:0]=7'b1111100;
			end
			5'b00011:begin//圖4
				seg3[6:0]=7'b1111111;
				seg2[6:0]=7'b1111111;
				seg1[6:0]=7'b1111111;
				seg0[6:0]=7'b0111100;
			end
			5'b00100:begin//圖5
				seg3[6:0]=7'b1111111;
				seg2[6:0]=7'b1111111;
				seg1[6:0]=7'b0111111;
				seg0[6:0]=7'b0111101;
			end
			5'b00101:begin//圖6
				seg3[6:0]=7'b1111111;
				seg2[6:0]=7'b0111111;
				seg1[6:0]=7'b0111111;
				seg0[6:0]=7'b0111111;
			end
			5'b00110:begin//圖7
				seg3[6:0]=7'b0111111;
				seg2[6:0]=7'b0111111;
				seg1[6:0]=7'b0111111;
				seg0[6:0]=7'b1111111;
			end
			5'b00111:begin//圖8
				seg3[6:0]=7'b0101111;
				seg2[6:0]=7'b0111111;
				seg1[6:0]=7'b1111111;
				seg0[6:0]=7'b1111111;
			end
			5'b01000:begin//圖9
				seg3[6:0]=7'b0100111;
				seg2[6:0]=7'b1111111;
				seg1[6:0]=7'b1111111;
				seg0[6:0]=7'b1111111;
			end
			5'b01001:begin//圖10
				seg3[6:0]=7'b1100111;
				seg2[6:0]=7'b1110111;
				seg1[6:0]=7'b1111111;
				seg0[6:0]=7'b1111111;
			end
			5'b01010:begin//圖11
				seg3[6:0]=7'b1110111;
				seg2[6:0]=7'b1110111;
				seg1[6:0]=7'b1110111;
				seg0[6:0]=7'b1111111;
			end
			5'b01011:begin//圖12
				seg3[6:0]=7'b1111111;
				seg2[6:0]=7'b1110111;
				seg1[6:0]=7'b1110111;
				seg0[6:0]=7'b1110111;
			end
			5'b01100:begin//圖13
				seg3[6:0]=7'b1111111;
				seg2[6:0]=7'b1111111;
				seg1[6:0]=7'b1110111;
				seg0[6:0]=7'b1110011;
			end
			5'b01101:begin//圖14
				seg3[6:0]=7'b1111111;
				seg2[6:0]=7'b1111111;
				seg1[6:0]=7'b1111111;
				seg0[6:0]=7'b0110011;
			end
			5'b01110:begin//圖15
				seg3[6:0]=7'b1111111;
				seg2[6:0]=7'b1111111;
				seg1[6:0]=7'b0111111;
				seg0[6:0]=7'b0111011;
			end
			5'b01111:begin//圖16
				seg3[6:0]=7'b1111111;
				seg2[6:0]=7'b0111111;
				seg1[6:0]=7'b0111111;
				seg0[6:0]=7'b0111111;
			end
			5'b10000:begin//圖17
				seg3[6:0]=7'b0111111;
				seg2[6:0]=7'b0111111;
				seg1[6:0]=7'b0111111;
				seg0[6:0]=7'b1111111;
			end
			5'b10001:begin//圖18
				seg3[6:0]=7'b0011111;
				seg2[6:0]=7'b0111111;
				seg1[6:0]=7'b1111111;
				seg0[6:0]=7'b1111111;
			end
			5'b10010:begin//圖19
				seg3[6:0]=7'b0011110;
				seg2[6:0]=7'b1111111;
				seg1[6:0]=7'b1111111;
				seg0[6:0]=7'b1111111;
			end
			5'b10011:begin//圖20
				seg3[6:0]=7'b1011110;
				seg2[6:0]=7'b1111110;
				seg1[6:0]=7'b1111111;
				seg0[6:0]=7'b1111111;
			end
		endcase
	end
endmodule
			
			
			
			
	
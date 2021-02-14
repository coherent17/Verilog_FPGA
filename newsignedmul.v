module newsignedmul(a,b,sign,tens,ones);
	input signed[3:0]a,b;
	output [3:0]tens,ones;
	output sign;
	reg sign;
	reg [3:0]tens,ones;
	wire signed[7:0]sum;
	reg [7:0]nsum;
	assign sum=a*b;
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
endmodule

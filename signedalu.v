module signedalu(a,b,sel,y,sign_y,hundreds,tens,ones);
	input signed[4:0]a,b;
	input [2:0]sel;
	output [9:0]y;
	output sign_y;
	output [3:0]hundreds,tens,ones;
	reg signed[9:0]tempy;
	reg[9:0]y;
	always@(a or b or sel)begin
		if(sel==3'b000)begin
			y=10'b0000000000;
		end
		else if (sel==3'b001)begin
			y=a&b;
		end
		else if(sel==3'b010)begin
			y=a|b;
		end
		else if(sel==3'b011)begin
			y=a^b;
		end
		else if(sel==3'b100)begin
			y=~a;
		end
		else if (sel==3'b101)begin
			y=a-b;
		end
		else if(sel==3'b110)begin
			y=a+b;
		end
		else if(sel==3'b111)begin
			y=a*b;
		end
	end
	signbcdconverter o1(.binary(y),.hundreds(hundreds),.tens(tens),.ones(ones),.sign_b(sign_y));
endmodule

module signbcdconverter(binary,hundreds,tens,ones,sign_b);
	input signed[9:0]binary;
	reg[9:0]nbinary;
	output [3:0]hundreds,tens,ones;
	output sign_b;
	reg[3:0]hundreds,tens,ones;
	integer i;
	assign sign_b=(binary[9]==1)?1'b1:1'b0;
	always@(binary)begin
		if(binary[9]==1) nbinary=(~binary)+1'b1;
		if(binary[9]==0) nbinary=binary;
		hundreds=4'b0000;
		tens=4'b0000;
		ones=4'b0000;
		for(i=9;i>=0;i=i-1)begin
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
endmodule
	
module signbcdconverter(binary,hundreds,tens,ones,sign_b);
	input signed[7:0]binary;
	reg[7:0]nbinary;
	output [3:0]hundreds,tens,ones;
	output sign_b;
	reg[3:0]hundreds,tens,ones;
	integer i;
	assign sign_b=(binary[7]==1)?1'b1:1'b0;
	always@(binary)begin
		if(binary[7]==1) nbinary=(~binary)+1'b1;
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
endmodule

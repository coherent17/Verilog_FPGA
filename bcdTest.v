`timescale 1ns/1ps
module bcdTest;
	reg signed[7:0]binary;
	reg [7:0]nbinary;
	wire [3:0]hundreds,tens,ones;
	wire sign_b;
	integer i;
	reg [3:0]golden_hundreds,golden_tens,golden_ones;
	reg golden_sign_b;
	reg pass;
	signbcdconverter DUT(.binary(binary),.hundreds(hundreds),.tens(tens),.ones(ones),.sign_b(sign_b));
	always@(binary)begin
	if(binary[7]==1'b1)begin
		nbinary=(~binary)+1;
		golden_sign_b=1'b1;
	end
	if(binary[7]==1'b0)begin
		nbinary=binary;
		golden_sign_b=1'b0;
	end
	golden_ones=nbinary%10;
	golden_tens=(nbinary/10)%10;
	golden_hundreds=(nbinary/100)%10;
	end
	initial begin
		pass=1'b1;binary=8'b00000000;
		for(i=0;i<256;i=i+1)begin
			#100
			if(hundreds!=golden_hundreds)begin
				$display("Error at binary=%b hundreds=%d golden_hundreds=%d",binary,hundreds,golden_hundreds);
				pass=1'b0;
			end
			if(tens!=golden_tens)begin
				$display("Error at binary=%b tens=%d golden_tens=%d",binary,tens,golden_tens);
				pass=1'b0;
			end
			if(ones!=golden_ones)begin
				$display("Error at binary=%b ones=%d golden_ones=%d",binary,ones,golden_ones);
				pass=1'b0;
			end
			if(sign_b!=golden_sign_b)begin
				$display("Error at binary=%b sign_b=%b golden_sign_b=%b",binary,sign_b,golden_sign_b);
				pass=1'b0;
			end
			$display($time,"binary=%d sign_b=%b hundreds=%d tens=%d ones=%d",binary,sign_b,hundreds,tens,ones);
			#100 binary=binary+1;
		end
		#100;
			if(pass==1'b1) $display("PASS!!");
	end
endmodule

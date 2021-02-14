module halfadder(a,b,sum,cin,leddim,sega,segb,segplus,segequal,segcin,segsum);
	input a,b;
	output sum,cin;
	output [7:0]leddim;
	output [6:0]sega;
	output [6:0]segb;
	output [6:0]segplus;
	output [6:0]segequal;
	output [6:0]segcin;
	output [6:0]segsum;
	reg [6:0]sega;
	reg [6:0]segb;
	reg [6:0]segcin;
	reg [6:0]segsum;
	assign sum=a^b;
	assign cin=a&b;
	assign leddim=8'b0;
	assign segplus=7'b0001100;//plus sign
	assign segequal=7'b1110110;//equal sign
	always@(a)begin
		case(a)
			1'b0:sega=7'b1000000;//0
			1'b1:sega=7'b1111001;//1
		endcase
	end
	always@(b)begin
		case(b)
			1'b0:segb=7'b1000000;//0
			1'b1:segb=7'b1111001;//1
		endcase
	end
	always@(sum)begin
		case(sum)
			1'b0:segsum=7'b1000000;//0
			1'b1:segsum=7'b1111001;//1
		endcase
	end
	always@(cin)begin
		case(cin)
			1'b0:segcin=7'b1000000;//0
			1'b1:segcin=7'b1111001;//1
		endcase
	end
endmodule

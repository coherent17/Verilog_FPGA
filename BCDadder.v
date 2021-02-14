module BCDadder(Augend,Addend,cin,sum,outcarry);
	input [3:0]Augend,Addend;
	input cin;
	output [3:0]sum;
	output outcarry;
	wire [3:0]z;
	wire carryout;
	wire [3:0]temp;
	fulladder o1(.a(Augend),.b(Addend),.cin(cin),.sum(z),.cout(carryout));
	assign outcarry=((z[2]&z[3])|(z[1]&z[3])|carryout);
	assign temp={1'b0,outcarry,outcarry,1'b0};
	fulladder o2(.a(z),.b(temp),.cin(1'b0),.sum(sum),.cout());
endmodule

module fulladder(a,b,cin,sum,cout);
	input [3:0]a,b;
	input cin;
	output [3:0]sum;
	output cout;
	assign {cout,sum}=a+b+cin;
endmodule

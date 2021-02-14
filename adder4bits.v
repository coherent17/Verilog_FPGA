module adder4bits(a,b,cin,sum,cout);
	input [3:0]a;
	input[3:0]b;
	input cin;
	output [3:0]sum;
	output cout;
	wire c1,c2,c3;
	fulladder u1(.a(a[0]),.b(b[0]),.cin(cin),.sum(sum[0]),.cout(c1));
	fulladder u2(.a(a[1]),.b(b[1]),.cin(c1),.sum(sum[1]),.cout(c2));
	fulladder u3(.a(a[2]),.b(b[2]),.cin(c2),.sum(sum[2]),.cout(c3));
	fulladder u4(.a(a[3]),.b(b[3]),.cin(c3),.sum(sum[3]),.cout(cout));

endmodule

module fulladder(a,b,cin,sum,cout);
	input a,b,cin;
	output sum,cout;
	wire w1,w2,w3;
	/*halfadder o1(.a(a),.b(b),.p(w1),.g(w2));
	halfadder o2(.a(w1),.b(cin),.p(sum),.g(w3));*/
	halfadder o1(a,b,w1,w2);
	halfadder o2(w1,cin,sum,w3);
	assign cout=w3|w2;
endmodule

module halfadder(a,b,p,g);
	input a,b;
	output p,g;
	assign p=a^b;
	assign g=a&b;
endmodule

module addsub(a,b,sum,op,ov);
	input [3:0]a,b;
	input op;
	output [3:0]sum;
	output ov;
	wire c1,c2,c3,c4;
	wire [3:0]bb;
	assign bb[0]=op^b[0];
	assign bb[1]=op^b[1];
	assign bb[2]=op^b[2];
	assign bb[3]=op^b[3];
	fulladder o1(.a(a[0]),.b(bb[0]),.cin(op),.sum(sum[0]),.cout(c1));
	fulladder o2(.a(a[1]),.b(bb[1]),.cin(c1),.sum(sum[1]),.cout(c2));
	fulladder o3(.a(a[2]),.b(bb[2]),.cin(c2),.sum(sum[2]),.cout(c3));
	fulladder o4(.a(a[3]),.b(bb[3]),.cin(c3),.sum(sum[3]),.cout(c4));
	assign ov=c3^c4;
endmodule

module fulladder(a,b,cin,sum,cout);
	input a,b,cin;
	output sum,cout;
	assign {cout,sum}=a+b+cin;
endmodule

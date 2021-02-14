module fourbitscarrylookaheadadder(a,b,cin,sum,cout,P,G);
	input [3:0]a,b;
	input cin;
	output [3:0]sum;
	output cout,P,G;
	wire p0,p1,p2,p3;
	wire g0,g1,g2,g3;
	wire c1,c2,c3;
	pfa o1(.a(a[0]),.b(b[0]),.cin(cin),.p(p0),.g(g0),.sum(sum[0]));
	pfa o2(.a(a[1]),.b(b[1]),.cin(c1),.p(p1),.g(g1),.sum(sum[1]));
	pfa o3(.a(a[2]),.b(b[2]),.cin(c2),.p(p2),.g(g2),.sum(sum[2]));
	pfa o4(.a(a[3]),.b(b[3]),.cin(c3),.p(p3),.g(g3),.sum(sum[3]));
	carrygenerator o5(.p0(p0),.p1(p1),.p2(p2),.p3(p3),.g0(g0),.g1(g1),.g2(g2),.g3(g3),.cin(cin),.c1(c1),.c2(c2),.c3(c3),.P(P),.G(G));
	assign cout=G|(P&cin);
	
endmodule

module pfa(a,b,cin,p,g,sum);
	input a,b,cin;
	output p,g,sum;
	assign p=a^b;
	assign g=a&b;
	assign sum=a^b^cin;

endmodule

module carrygenerator(p0,p1,p2,p3,g0,g1,g2,g3,cin,c1,c2,c3,P,G);
	input p0,p1,p2,p3,g0,g1,g2,g3,cin;
	output c1,c2,c3,P,G;
	assign c1=g0|(p0&cin);
	assign c2=g1|(p1&(g0|(p0&cin)));
	assign c3=g2|(p2&(g1|(p1&(g0|(p0&cin)))));
	assign P=p0&p1&p2&p3;
	assign G=g3|(p2&g2)|(p3&p2&g1)|(p3&p2&p1&p0&g0);
	
endmodule

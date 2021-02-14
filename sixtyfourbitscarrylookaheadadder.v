module sixtyfourbitscarrylookaheadadder(a,b,cin,sum,cout);
	input [63:0]a,b;
	input cin;
	output [63:0]sum;
	output cout;
	wire [3:1]c;
	wire [3:0]p,g;
	scla u1(a[15:0],b[15:0],cin,sum[15:0],p[0],g[0]);
	scla u2(a[31:16],b[31:16],c[1],sum[31:16],p[1],g[1]);
	scla u3(a[47:32],b[47:32],c[2],sum[47:32],p[2],g[2]);
	scla u4(a[63:48],b[63:48],c[3],sum[63:48],p[3],g[3]);
	carrygenerator u5(.p(p),.g(g),.cin(cin),.c(c),.P(P),.G(G));
	assign cout=G|(P&cin);
endmodule

module scla(a,b,cin,sum,P,G);
	input [15:0]a,b;
	input cin;
	output [15:0]sum;
	wire [3:1]c;
	wire [3:0]p,g;
	output P,G;
	fcla q1(a[3:0],b[3:0],cin,sum[3:0],p[0],g[0]);
	fcla q2(a[7:4],b[7:4],c[1],sum[7:4],p[1],g[1]);
	fcla q3(a[11:8],b[11:8],c[2],sum[11:8],p[2],g[2]);
	fcla q4(a[15:12],b[15:12],c[3],sum[15:12],p[3],g[3]);
	carrygenerator q5(.p(p),.g(g),.cin(cin),.c(c),.P(P),.G(G));
endmodule

module fcla(a,b,cin,sum,P,G);
	input [3:0]a,b;
	input cin;
	output [3:0]sum;
	output P,G;
	wire [3:0]p,g;
	wire [3:1]c;
	pfa o1(.a(a[0]),.b(b[0]),.cin(cin),.p(p[0]),.g(g[0]),.sum(sum[0]));
	pfa o2(.a(a[1]),.b(b[1]),.cin(c[1]),.p(p[1]),.g(g[1]),.sum(sum[1]));
	pfa o3(.a(a[2]),.b(b[2]),.cin(c[2]),.p(p[2]),.g(g[2]),.sum(sum[2]));
	pfa o4(.a(a[3]),.b(b[3]),.cin(c[3]),.p(p[3]),.g(g[3]),.sum(sum[3]));
	carrygenerator o5(.p(p),.g(g),.cin(cin),.c(c),.P(P),.G(G));
endmodule

module pfa(a,b,cin,p,g,sum);
	input a,b,cin;
	output p,g,sum;
	assign p=a^b;
	assign g=a&b;
	assign sum=a^b^cin;

endmodule

module carrygenerator(p,g,cin,c,P,G);
	input [3:0]p,g;
	input cin;
	output P,G;
	output [3:1]c;
	assign c[1]=g[0]|(p[0]&cin);
	assign c[2]=g[1]|(p[1]&(g[0]|(p[0]&cin)));
	assign c[3]=g[2]|(p[2]&(g[1]|(p[1]&(g[0]|(p[0]&cin)))));
	assign P=p[0]&p[1]&p[2]&p[3];
	assign G=g[3]|(p[3]&g[2])|(p[3]&p[2]&g[1])|(p[3]&p[2]&p[1]&g[0]);
endmodule

module divider(a,b,q,r);
	input signed[3:0]a,b;
	output signed[3:0]q,r;
	assign q=a/b;
	assign r=a%b;
endmodule

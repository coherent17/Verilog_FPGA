module bcd_ex2(a,b,c,d,w,x,y,z);
	input a,b,c,d;
	output w,x,y,z;
	assign w=a|(b&d)|(b&c);
	assign x=(b&~c&~d)|(~b&d)|(~b&c);
	assign y=(~c&~d)|(c&d);
	assign z=~d;
	
endmodule
	

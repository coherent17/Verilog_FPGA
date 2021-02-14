module decoder_one(a,b,c,d,e,f,g,h,i,j,k);
	input a,b,c;
	output d,e,f,g,h,i,j,k;
	assign k=~a&~b&~c;
	assign j=~a&~b&c;
	assign i=~a&b&~c;
	assign h=~a&b&c;
	assign g=a&~b&~c;
	assign f=a&~b&c;
	assign e=a&b&~c;
	assign d=a&b&c;
endmodule

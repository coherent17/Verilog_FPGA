module comparator(a,b,gt,lt,eq);
	input [3:0]a,b;
	output gt,lt,eq;
	reg gt,lt,eq;
	always@(*)begin
		gt=(a>b);
		lt=(a<b);
		eq=(a==b);
	end
endmodule

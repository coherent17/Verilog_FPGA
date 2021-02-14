module mux4to1(a,b,c,d,s0,s1,out);
	input a,b,c,d;
	input s0,s1;
	output out;
	reg out;
	always@(*)begin
		case({s0,s1})
			2'b00:out=a;
			2'b01:out=b;
			2'b10:out=c;
			2'b11:out=d;
		endcase
	end
endmodule

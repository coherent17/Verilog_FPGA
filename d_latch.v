module d_latch(Q,D,CLK);
	input D,CLK;
	output Q;
	reg Q;
	always@(CLK or D)begin
		if(CLK)Q=D;
	end
endmodule

module dflipflop(Q,D,CLK,RST);
	input D,CLK,RST;
	output Q;
	reg Q;
	always@(posedge CLK or negedge RST)begin
		if(RST==1'b0)Q=0;
		else Q=D;
	end
endmodule

module blocking(D,CLK,X,Y);
	input D,CLK;
	output [3:0]X,Y;
	reg [3:0]X,Y;
	always@(posedge CLK)begin
		//我是一行一行執行
		X[0]=D;
		X[1]=X[0];
		X[2]=X[1];
		X[3]=X[2];
	end
	always@(posedge CLK)begin
		//我是全部同時執行
		Y[0]<=D;
		Y[1]<=Y[0];
		Y[2]<=Y[1];
		Y[3]<=Y[2];
	end
endmodule

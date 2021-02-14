module easyfunction(a,b,c,x,y);
	input [3:0]a,b,c;
	output [3:0]x,y;
	assign x=min_fun(a,b);
	assign y=min_fun(a,c);
	function [3:0]min_fun;
		input [3:0]in1,in2;
		begin
			if(in1<in2) min_fun=in1;
			else min_fun=in2;
		end
	endfunction
endmodule




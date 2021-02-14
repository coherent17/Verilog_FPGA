module ictexampleone(p,q,r,s,o);
	input p,q,r,s;
	output o;
	assign o=(~p&q)|~r|p&r|p&s;
endmodule

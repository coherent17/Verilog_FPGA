module ictexamplethree(p,q,r,s,o);
	input p,q,r,s;
	output o;
	assign o=(~p&q&~r&~s)|(p&~q&~r&~s)|(~p&~q&~r&s)|(p&q&~r&s)|(~p&q&r&s)|(p&~q&r&s)|(~p&~q&r&~s)|(p&q&r&~s);
endmodule

module ictexampletwo (p,q,r,s,o);
	input p,q,r,s;
	output o;
	assign o=p|~r|q;
endmodule


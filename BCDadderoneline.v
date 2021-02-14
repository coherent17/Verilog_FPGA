module BCDadderoneline(Augend,Addend,cin,sum,outcarry);
	input [3:0]Augend,Addend;
	input cin;
	output [3:0]sum;
	output outcarry;
	assign {outcarry,sum}=(Augend+Addend+cin>9)?(Augend+Addend+cin+6):(Augend+Addend+cin);
endmodule

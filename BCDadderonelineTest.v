`timescale 1ns/1ps
module BCDadderonelineTest;
	reg[3:0]Augend,Addend;
	reg cin;
	wire outcarry;
	wire[3:0]sum;
	BCDadderoneline DUT(.Augend(Augend[3:0]),.Addend(Addend[3:0]),.cin(cin),.sum(sum[3:0]),.outcarry(outcarry));
	initial begin
	#0 Augend=0;Addend=0;cin=0;
	#100 Augend=3;Addend=6;cin=1;
	#200 Augend=4;Addend=9;cin=0;
	#300 Augend=9;Addend=9;cin=0;
	#400 Augend=9;Addend=9;cin=1;
	#500 Augend=8;Addend=7;cin=0;
	#600 Augend=7;Addend=6;cin=1;
	#700 Augend=2;Addend=5;cin=1;
	#800 Augend=8;Addend=8;cin=0;
	#900 Augend=9;Addend=1;cin=1;
	#1000 Augend=3;Addend=5;cin=0;
	end
	initial begin
	$display($time,"\tAugend\tAddent\t\tcin\t-->outcarry\tsum");
	$monitor($time,"\t\t%d\t\t%d\t%d--->%d\t\t%d",Augend,Addend,cin,outcarry,sum);
	end
endmodule

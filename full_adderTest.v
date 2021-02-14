`timescale 1ns/1ps
module full_adderTest;
	reg ta=1'b0;
	reg tb=1'b0;
	reg tcin=1'b0;
	wire tsum;
	wire tcout;
	full_adder DUT(.a(ta),.b(tb),.cin(tcin),.cout(tcout),.sum(tsum));
	initial begin
	#100;
	ta=1'b0;tb=1'b0;tcin=1'b1;
	#100;
	ta=1'b0;tb=1'b1;tcin=1'b0;
	#100;
	ta=1'b0;tb=1'b1;tcin=1'b1;
	#100;
	ta=1'b1;tb=1'b0;tcin=1'b0;
	#100;
	ta=1'b1;tb=1'b0;tcin=1'b1;
	#100;
	ta=1'b1;tb=1'b1;tcin=1'b0;
	#100;
	ta=1'b1;tb=1'b1;tcin=1'b1;
	#100;
	end
	initial begin 
	$display($time ,"\ta\tb\tcin\t-->cout\tsum");
	$monitor($time ,"\t%d\t%d\t%d\t-->%d\t%d",ta,tb,tcin,tcout,tsum);
	end
endmodule

`timescale 1ns/1ps
module sixtyfourbitscarrylookaheadadderTest;
	reg [63:0]a;
	reg [63:0]b;
	reg cin;
	wire cout;
	wire [63:0]sum;
	integer i;
	wire golden_cout;
	wire [63:0]golden_sum;
	reg pass;
	
	sixtyfourbitscarrylookaheadadder DUT(.a(a[63:0]),.b(b[63:0]),.cin(cin),.cout(cout),.sum(sum[63:0]));
	assign {golden_cout,golden_sum}=a+b+cin;
	initial begin
	pass=1'b1;
	cin=1'b0;
	a[63:0]=64'b1010110101011101010111111111110000000000111110101000001010101010;
	b[63:0]=64'b1000000000000000000000000000000000000000000000000000000000000001;
	for(i=0;i<63;i=i+1)begin
	#100;
	if({cout,sum}!={golden_cout,golden_sum})begin
	printerror;
	pass=1'b0;
	end
	$display($time, "a[%d]=%b,b[%d]=%b,cin=%b,cout=%b,sum[%d]=%b",i,a[i],i,b[i],cin,cout,i,sum[i]);
	end
	#100;
	if(pass===1'b1)begin
	$display("PASS!!");
	$stop;
	end
	end
	task printerror;
	begin
	$display("Error at a[%d]=%b,b[%d]=%b,cin=%b",i,a,i,b,cin);
	end
	endtask
	
endmodule

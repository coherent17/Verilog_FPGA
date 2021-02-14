`timescale 1ns/1ps
module fulladdergoldenTest;
	reg a,b,cin;
	wire sum,cout;
	integer i;
	wire golden_cout;
	wire golden_sum;
	reg pass;
	fulladder DUT(.a(a),.b(b),.cin(cin),.cout(cout),.sum(sum));
	assign {golden_cout,golden_sum}=a+b+cin;
	initial begin
	pass=1'b1;
	a=1'b0;b=1'b0;cin=1'b0;
	for(i=0;i<8;i=i+1)begin
		#100;
		if({cout,sum}!={golden_cout,golden_sum})begin
			printerror;
			pass=1'b0;
		end
		$display($time, "a=%b,b=%b,cin=%b -->cout=%b,sum=%b",a,b,cin,cout,sum);
		#100{a,b,cin}={a,b,cin}+1;
	end
	if(pass===1'b1)begin
		$display("PASS!!");
		$stop;
	end
	end
	task printerror;
	begin
	$display("Error at %dns,a=%b,b=%b,cin=%b",$time,a,b,cin);
	end
	endtask

endmodule

	
	
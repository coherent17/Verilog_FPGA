`timescale 1ns/1ps
module addsubTest;
reg signed[3:0]a,b;
reg op;
wire signed[3:0]sum;
wire ov;
integer i;
wire signed[3:0]golden_sum;
reg golden_ov;
reg pass;

addsub DUT(.a(a),.b(b),.sum(sum),.op(op),.ov(ov));
assign golden_sum=op?a-b:a+b;
always@(a or b or op)begin
	if(a>=0&&b>=0&&op==0&&golden_sum<0) golden_ov=1;
	else if(a<0&&b<0&&op==0&&golden_sum>=0) golden_ov=1;
	else if(a>=0&&b<0&&op==1&&golden_sum<0) golden_ov=1;
	else if(a<0&&b>=0&&op==1&&golden_sum>=0) golden_ov=1;
	else golden_ov=0;
end
initial begin
	pass=1'b1;a=4'b0000;b=4'b0000;op=1'b0;
	for(i=0;i<512;i=i+1)begin
		#100
		if(sum!=golden_sum)begin
			$display("Error at a=%d b=%d op=%d sum=%d golden_sum=%d",a,b,op,sum,golden_sum);
			pass=1'b0;
		end
		if(ov!=golden_ov)begin
			$display("Error at a=%d b=%d op=%d ov=%d golden_ov=%d",a,b,op,ov,golden_ov);
			pass=1'b0;
		end
		$display($time,"a=%d b=%d op=%d sum=%d ov=%d",a,b,op,sum,ov);
		#100 {a,b,op}={a,b,op}+1;
	end
	#100;
		if(pass==1'b1) $display("PASS!!");
			$stop;
		end
endmodule


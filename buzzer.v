module buzzer(clk,rst,aspeaker,bspeaker,check);
	input clk,rst,check;
	output aspeaker,bspeaker;
	reg[15:0]acounter,bcounter;
	reg aspeaker,bspeaker;
	reg[23:0]tone;
	parameter a=10000000/400/2;
	parameter b=10000000/300/2;
	
	always@(posedge clk)begin
		if(check==0&&tone<=5000000)tone=tone+1;
		else tone=0;
	end
	
	//control aspeaker
	always@(posedge clk )begin
		if(check==1)acounter=acounter;
		else if(check==0&&acounter==a)acounter=0;
		else acounter=acounter+1;
	end
	//control bspeaker
	always@(posedge clk )begin
		if(check==1)bcounter=bcounter;
		else if(check==0&&bcounter==b)bcounter=0;
		else bcounter=bcounter+1;
	end
	always@(posedge clk)begin
		if(tone==5000000)begin
			aspeaker=0;
			bspeaker=0;
		end
		else if(acounter==1) aspeaker=~aspeaker;
		else if(bcounter==1) bspeaker=~bspeaker;
	end
	
endmodule

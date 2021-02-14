module music(clk,rst,speaker,sw1,sw2,sw3,sw4,sw5,sw6,sw7,sw8,sw9,sw10);
	input clk,rst,sw1,sw2,sw3,sw4,sw5,sw6,sw7,sw8,sw9,sw10;
	output speaker;
	parameter do=10000000/523/2;
	parameter re=10000000/587/2;
	parameter mi=10000000/659/2;
	parameter fa=10000000/698/2;
	parameter so=10000000/784/2;
	parameter la=10000000/880/2;
	parameter si=10000000/988/2;
	parameter hdo=10000000/1046/2;
	parameter hre=10000000/1175/2;
	parameter hmi=10000000/1318/2;
	
	reg[15:0]counter;
	reg speaker;
	always@(posedge clk )begin
		if(sw1==0&&sw2==0&&sw3==0&&sw4==0&&sw5==0&&sw6==0&&sw7==0&&sw8==0&&sw9==0&&sw10==0) counter=counter;
		else if(counter==do&&sw1==1)counter=0;
		else if(counter==re&&sw2==1)counter=0;
		else if(counter==mi&&sw3==1)counter=0;
		else if(counter==fa&&sw4==1)counter=0;
		else if(counter==so&&sw5==1)counter=0;
		else if(counter==la&&sw6==1)counter=0;
		else if(counter==si&&sw7==1)counter=0;
		else if(counter==hdo&&sw8==1)counter=0;
		else if(counter==hre&&sw9==1)counter=0;
		else if(counter==hmi&&sw10==1)counter=0;
		else counter=counter+1;
	end
	
	always@(posedge clk)begin
		if(counter==0) speaker=~speaker;
	end
endmodule
	
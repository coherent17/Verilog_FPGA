module mooreexample(clk,rst,x,y);
	input clk,rst,x;
	output y;
	reg y;
	reg [1:0]state,nextstate;
	//memory element
	always@(posedge clk or negedge rst)begin
		if(rst==1'b0) state=2'b00;
		else state=nextstate;
	end
	//next state logic
	always@(state or x)begin
		case({state,x})
			3'b000:nextstate=2'b00;
			3'b001:nextstate=2'b01;
			3'b010:nextstate=2'b01;
			3'b011:nextstate=2'b10;
			3'b100:nextstate=2'b10;
			3'b101:nextstate=2'b11;
			3'b110:nextstate=2'b11;
			3'b111:nextstate=2'b00;
		endcase
	end
	//output logic
	always@(state)begin
		case(state)
			2'b00:y=0;
			2'b01:y=0;
			2'b10:y=0;
			default:y=1;
		endcase
	end
	
endmodule
			
	
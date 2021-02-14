module decoder_two(a,b,c,d,e,f,g,h,i,j,k);
	input a,b,c;
	output d,e,f,g,h,i,j,k;
	reg d,e,f,g,h,i,j,k;
	always@(a or b or c)begin
		case({a,b,c})
			3'b000:{d,e,f,g,h,i,j,k}=8'b00000001;
			3'b001:{d,e,f,g,h,i,j,k}=8'b00000010;
			3'b010:{d,e,f,g,h,i,j,k}=8'b00000100;
			3'b011:{d,e,f,g,h,i,j,k}=8'b00001000;
			3'b100:{d,e,f,g,h,i,j,k}=8'b00010000;
			3'b101:{d,e,f,g,h,i,j,k}=8'b00100000;
			3'b110:{d,e,f,g,h,i,j,k}=8'b01000000;
			3'b111:{d,e,f,g,h,i,j,k}=8'b10000000;
		endcase
	end
endmodule

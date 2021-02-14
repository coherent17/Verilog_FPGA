module bcd_ex3(a,b,c,d,w,x,y,z);
	input a,b,c,d;
	output w,x,y,z;
	reg w,x,y,z;
	always@(a,b,c,d)begin
		case({a,b,c,d})
			4'b0000:{w,x,y,z}=4'b0011;
			4'b0001:{w,x,y,z}=4'b0100;
			4'b0010:{w,x,y,z}=4'b0101;
			4'b0011:{w,x,y,z}=4'b0110;
			4'b0100:{w,x,y,z}=4'b0111;
			4'b0101:{w,x,y,z}=4'b1000;
			4'b0110:{w,x,y,z}=4'b1001;
			4'b0111:{w,x,y,z}=4'b1010;
			4'b1000:{w,x,y,z}=4'b1011;
			4'b1001:{w,x,y,z}=4'b1100;
			default:{w,x,y,z}=4'bXXXX;
		endcase
	end
endmodule

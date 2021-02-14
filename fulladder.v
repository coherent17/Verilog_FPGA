module fulladder(a,b,cin,sum,cout);
	input a,b,cin;
	output sum,cout;
	reg cout,sum;
	always@(a or b or cin)begin
		case({a,b,cin})
		3'b000:{cout,sum}=2'b00;
		3'b001:{cout,sum}=2'b01;
		3'b010:{cout,sum}=2'b10; //error
		3'b011:{cout,sum}=2'b10;
		3'b100:{cout,sum}=2'b01;
		3'b101:{cout,sum}=2'b10;
		3'b110:{cout,sum}=2'b10;
		3'b111:{cout,sum}=2'b00; //error
		endcase
	end 
endmodule

module modulemultiplier (a,b,product);
input signed[3:0]a,b;
output signed[7:0]product;
assign product=a*b;
endmodule

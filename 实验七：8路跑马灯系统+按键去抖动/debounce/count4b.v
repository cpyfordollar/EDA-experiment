module count4b(clk,rst,q);
input clk,rst;
output reg[3:0]q;

initial q<=0;

always@(posedge clk)
	q=q+4'b1;

endmodule

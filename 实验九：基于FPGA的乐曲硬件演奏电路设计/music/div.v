module div(clk,rst,clk4);
//4Hz
input clk,rst;
output reg clk4;
reg [31:0]count;

always @(posedge clk or negedge rst) begin
	if(rst==0)begin
		clk4<=1'b0;
		count<=32'd0;
	end
	else if (count==50000000/(4*2)-1) begin //24999999
		clk4<=~clk4;
		count<=32'd0;
	end
	else begin
		count=count+1;
	end
end

endmodule

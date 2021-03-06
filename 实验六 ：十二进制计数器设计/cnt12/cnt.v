module cnt(clk, rst, en, cq, count, mode, preset);

input clk, rst, en, mode;
input [3:0] preset;

output reg [3:0] cq;
output reg count;


initial cq = preset;
initial count = 0;

always @(posedge clk) 
begin
	if (en==1) begin
		cq = cq;
	end
	else 
	begin
		if(rst==0)
		  begin
		  cq<=0;
		  count<=0;
		  end
		else if (cq == 13&&mode==0) 
		begin 
			cq <= 0;
			count <= 1;
		end
		else if(cq == 0&&mode==1)
		begin 
			cq <= 13;
			count <= 1;
		end
		else if (mode==0) cq <= cq + 1;
		else if (mode) cq <= cq - 1;
	end
end

endmodule

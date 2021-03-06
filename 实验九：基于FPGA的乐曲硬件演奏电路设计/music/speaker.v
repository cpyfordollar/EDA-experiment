module speaker(clk,Tone,speaker);
input clk;
input[10:0] Tone;
output reg speaker;
reg PreCLK,FullSpeaker;

always @(posedge clk)begin
	reg[3:0] Count4;
	PreCLK<=0;
	if(Count4>11)
	begin
		PreCLK<=1;
		Count4=0;
	end
	else
	begin
		Count4=Count4+1;
	end
end

always @(posedge PreCLK)begin
	reg[10:0]Count11;
	if(Count11==11'h7FF)
	begin
		Count11=Tone;
		FullSpeaker<=1;
	end
	else
	begin
		Count11=Count11+1;
		FullSpeaker<=0;
	end
end

always @(posedge FullSpeaker)begin
	reg Count2;
	Count2=~Count2;
	if(Count2==1) speaker<=1;
	else speaker<=0;
end

endmodule

module mux4_1(A,B,C,D,sel,dataout,ds,seg7) ;
input [1:0]A,B,C,D ;
input[1:0]sel ;
output reg [1:0]dataout ;
output ds ;
output reg[6:0]seg7 ; //g,f,e,d,c,b,a

assign ds = 0 ;
always@(*)
begin
	if (sel==2'b00)
	begin
	seg7 <= 7'b0111111 ;
	dataout = A ;
	end 
	else if (sel==2'b01)
	begin
	seg7 <= 7'b0000110 ;
	dataout = B ;
	end 
	else if (sel==2'b10)
	begin
	seg7 <= 7'b1011011 ;
	dataout = C ;
	end 
	else if (sel==2'b11)
	begin
	seg7 <= 7'b1001111 ; 
	dataout = D ;
	end 
end
endmodule


	
	
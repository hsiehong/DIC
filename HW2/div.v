`timescale 1ns / 10ps
module div(out, in1, in2, dbz);
parameter width = 8;
input  	[width-1:0] in1; // Dividend
input  	[width-1:0] in2; // Divisor
output reg [width-1:0] out; // Quotient
output reg dbz;

//********************************

reg [width*2-1:0] temp1;
reg [width*2-1:0] temp2;
integer i;

always@(in1,in2)
begin
	temp1={8'b0,in1};
	temp2={in2,8'b0};
	for(i=0;i<width;i=i+1)begin
			temp1=temp1<<1;			
			if(temp1>=temp2)
				temp1=temp1-temp2+1'b1;
			else
				temp1=temp1;
	end
	if(in2)assign out=temp1[width-1:0];
	dbz=(in2)?0:1;
end

//********************************



endmodule

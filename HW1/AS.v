module FullAdder(A, B, C_in ,Sum, C_out);
	input A, B, C_in;
	output Sum , C_out;
	assign Sum = (A^B)^C_in;
	assign C_out = ((A^B)&C_in)|(A&B);
endmodule

module AS(A,B,sel,S,O);
	input [3:0] A,B;
	input sel;
	output [3:0] S;
	output O;
	wire [4:0] C;
	assign C[0]=sel;
	FullAdder a1(A[0] , B[0]^sel , C[0] , S[0] , C[1]);
	FullAdder a2(A[1] , B[1]^sel , C[1] , S[1] , C[2]);
	FullAdder a3(A[2] , B[2]^sel , C[2] , S[2] , C[3]);
	FullAdder a4(A[3] , B[3]^sel , C[3] , S[3] , C[4]);
	assign O = C[4]^C[3];
endmodule

//implement a program that converts 4-bit binary to excess-3
module excess3(a,b,c,d,e,f,g,w,x,y,z);
output a,b,c,d,e,f,g;
input w,x,y,z;
wire A,B,C,D;
wire [3:0] pin;
function automatic [6:0] out;
input [3:0]inp;
begin
case(inp)
	0 :  out = 7'b0000001;
	1 :  out = 7'b1001111;
	2 :  out = 7'b0010010;
	3 :  out = 7'b0000110;
	4 :  out = 7'b1001100;
	5 :  out = 7'b0100100;
	6 :  out = 7'b1100000;
	7 :  out = 7'b0001111;
	8 :  out = 7'b0000000;
	9 :  out = 7'b0001100;
	default:  out = 7'b1111111;
	endcase
end
endfunction
assign  A = w||(x&&y)||(x&&z);
assign  B = (!x&&y)||(!x&&z)||(x&& !y && !z);
assign  C=(y&&z)||(!y && !z);
assign D=(!z);
 assign pin = (D+2*C+4*B+8*A);

 assign {a,b,c,d,e,f,g}=out(pin);

  endmodule


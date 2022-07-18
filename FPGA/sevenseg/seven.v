//write a verilog code that displays a number on sevensegment display 
module sevensegment(a,b,c,d,e,f,g);
output a,b,c,d,e,f,g;
function automatic [6:0] gout;

	input [6:0] a;
begin 
	case(a)
	 0: gout = 7'b0000001;
	 1: gout = 7'b1001111;
	 2: gout = 7'b0010010;
	 3: gout = 7'b0000110;
	 4: gout = 7'b1001100;
	 5: gout = 7'b0100100;
	 6: gout = 7'b0100000;
	 7: gout = 7'b0001111;
	 8: gout = 7'b0000000;
	 9: gout = 7'b0001100;
	 default: gout = 7'b1111111;
	 endcase
end
endfunction

assign {a,b,c,d,e,f,g} = gout(3);
endmodule

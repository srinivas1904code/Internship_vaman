//implement a verilog program that takes 4-inputs and display it in 7-segment display using 7447
module bcdprint(D,C,B,A,d,c,b,a);
output D,C,B,A;
input d,c,b,a;
assign {D,C,B,A} = {d,c,b,a};
endmodule

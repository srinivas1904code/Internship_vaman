//implement the following kmap expression using vaman
module kmap(input A,B,C,D,output x);
assign x = !((!B&&C)||(!B&&D)||(B&& !C && !D));
endmodule

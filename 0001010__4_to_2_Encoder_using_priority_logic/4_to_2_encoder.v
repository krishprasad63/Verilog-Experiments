//This is the code for priority encoder where highest priority is given to Input 3 and lowest to input 0
//after solving logic, we get y1 = i2 + i3 
//and y2 = i3 + i1.i2'
module four_to_two_encoder(
    input [3:0] inp,
    output y1,
    output y2
);
    wire not_i2, temp_and;
    or u1(y1, inp[2], inp[3]);
    not u2(not_i2, inp[2]);
    and u3(temp_and, inp[0], not_i2);
    or u4(y2, inp[3], temp_and);
endmodule
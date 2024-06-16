module shift_buff_reg #(parameter  reg_size = 4)(q, x, load, shl, d_in, clr, clk);

//port declaration
input clk, clr, d_in, shl, load ;
input [reg_size -1: 0] x ;
output [reg_size -1: 0] q;

integer i ;

//internal wire inputs (external to the D ff)
reg [reg_size -1: 0] d ;

//control logic
always @(*)
begin 
    d[0] = (d_in & shl)|(load & x[0])|(~(load | shl) & q[0]);
    for (i = 1 ; i < reg_size ; i = i + 1)
    begin 
        d[i] = (q[i-1] & shl)|(load & x[i])|(~(load | shl) & q[i]);
    end
end

//first D_ff
DF df_u(q[0], d[0], clr, clk);

// rest of the D_ff's
genvar j ;
generate
    for (j = 1 ; j < reg_size ; j = j + 1)
    begin : gen_DF_u
        DF df_u(q[j], d[j], clr, clk);
    end
endgenerate

endmodule 


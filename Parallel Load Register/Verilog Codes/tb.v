module tb;

parameter reg_size = 4;
reg CLOCK, CLEAR, D_IN, SHIFT_L, LOAD ;
reg [reg_size -1: 0] X ;
wire [reg_size -1: 0] Q;


shift_buff_reg #(reg_size) sbr(Q, X, LOAD, SHIFT_L, D_IN, CLEAR, CLOCK);

always begin
    #5 CLOCK = ~CLOCK;  // 10 time units clock period
end

// Test sequence
initial 
begin
    // Initialize inputs
    X = 0;
    LOAD = 0;
    CLEAR = 0;
	CLOCK = 0;
    SHIFT_L = 0;
    D_IN = 0 ;
end
	 
initial
begin 	
	 #12 X = 4; LOAD = 1 ; 
	 #10 X = 10;  
	 #10 X = 5; 
	 #10 X = 3; 
	 #10 X = 1; 
	 #10 X = 8; 
	 #10 X = 9; 
	 #10 X = 4; 
	 #10 X = 2; 
	 #10 X = 0; 
	 #10 X = 8; 
	 #10 X = 4; 
	 #10 X = 6; 
	 #10 X = 5; // last stored data
     LOAD = 0; SHIFT_L =1 ;
// writing 1101 to the reg with left shifting
    D_IN = 1 ;
    #10 D_IN = 1 ;
    #10 D_IN = 0 ;
    #10 D_IN = 1 ;
    #3 SHIFT_L= 0 ; // stop shifting the data after the required data is stored

// writing 1000 to the reg with left shifting
    #46 D_IN = 1 ; SHIFT_L = 1 ;
    #10 D_IN = 0 ;
    #10 D_IN = 0 ;
    #10 D_IN = 0 ;
    #3 SHIFT_L= 0 ;

//checking wether the data is written when the SHL is low (if yes there is an error)
    #10 D_IN = 1 ;
    #10 D_IN = 0 ;

    $finish ;

end

// Monitor signals
initial begin
    $monitor( $time, " x: %b, load: %b, clr: %b, q: %b",X, LOAD, CLEAR, Q);
end

endmodule
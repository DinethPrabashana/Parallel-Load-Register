# Parallel Loading 
In these types of registers we can perform shifting and buffering independently, The Control logic enables wether it is to buffer or shift with `LOAD` or `SHL` logic. These circuits gives more control over the registers rather than using a single functioning buffer or a shift register.

**note:Using both `LOAD` and `SHL` high at the same time is forbidden.** 

## Circuit Diagram 
![Circuit Diagram ](https://github.com/DinethPrabashana/Parallel-Load-Register/blob/main/Parallel%20Load%20Register/Circuit%20Diagrams/Circuit.png)

Check the verilog implementation from the below links,
- ![shift_buff_reg.v](https://github.com/DinethPrabashana/Parallel-Load-Register/blob/main/Parallel%20Load%20Register/Verilog%20Codes/shift_buff_reg.v)
- ![DF.v](https://github.com/DinethPrabashana/Parallel-Load-Register/blob/main/Parallel%20Load%20Register/Verilog%20Codes/DF.v)
- ![tb.v](https://github.com/DinethPrabashana/Parallel-Load-Register/blob/main/Parallel%20Load%20Register/Verilog%20Codes/tb.v)


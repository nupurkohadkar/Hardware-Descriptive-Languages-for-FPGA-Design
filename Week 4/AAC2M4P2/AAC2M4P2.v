module RAM128x32

#(

parameter Data_width = 32, //# of bits in word

Addr_width = 7 // # of address bits

)

( //ports

input wire clk,

input wire we,

input wire [(Addr_width-1):0] address,

input wire [(Data_width-1):0] d,

output wire [(Data_width-1):0] q

);

reg[Data_width-1:0] mem[2**Addr_width-1:0];

reg [Data_width-1:0] mem1;

always@(posedge clk)

begin

if(we)

mem[address]<= d;

mem1 <=mem[address];

end

assign q =mem1;

endmodule

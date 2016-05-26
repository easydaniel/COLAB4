//Subject:     CO project 4 - Pipe CPU 1
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:
//----------------------------------------------
//Date:
//----------------------------------------------
//Description:
//--------------------------------------------------------------------------------

module ProgramCounter(
  clk_i,
	rst_i,
	pc_i,
	pc_o
	);

//I/O ports
input           clk_i;
input	          rst_i;
input  [32-1:0] pc_i;
output [32-1:0] pc_o;

//Internal Signals
reg    [32-1:0] pc_o;

//Parameter


//Main function
always @(posedge clk_i) begin
  if(~rst_i)
	    pc_o <= 0;
  else
	    pc_o <= pc_i;
end

endmodule

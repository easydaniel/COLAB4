//Subject:     CO project 4 - Decoder
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:
//----------------------------------------------
//Date:
//----------------------------------------------
//Description:
//--------------------------------------------------------------------------------

module Decoder(
    instr_op_i,
    AluOp,
    AluSrc,
    RegDst,
    MemRead,
    MemWrite,
    Branch,
    RegWrite,
    MemToReg
	);

//I/O ports
input  [6-1:0]   instr_op_i;
output [6-1:0]   AluOp;
output           AluSrc;
output           RegDst;
output           MemRead;
output           MemWrite;
output           Branch;
output           RegWrite;
output           MemToReg;

//Internal Signals


always @(*) begin
  case (instr_op_i)
    default: begin
      // code here
    end
  endcase
end
endmodule

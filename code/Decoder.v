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

reg	 [6-1:0]	  AluOp;
reg           	  AluSrc;
reg              RegDst;
reg              MemRead;
reg              MemWrite;
reg 				  Branch;
reg              RegWrite;
reg              MemToReg;

// ADD, ADDI, SUB, AND, OR, SLT, SLTIU, SRA, SRAV, ORI, LW, SW, MUL.


//Internal Signals


always @(*) begin
  case (instr_op_i)
    6'b000000 : begin // r type
        AluOp = 6'b000000;
        AluSrc = 0;
        RegDst = 1;
        MemRead = 0;
        MemWrite = 0;
        Branch = 0;
        RegWrite = 1;
        MemToReg = 0;
    end
    6'b001000: begin // ADDI
        AluOp = 6'b000001;
        AluSrc = 1;
        RegDst = 0;
        MemRead = 0;
        MemWrite = 0;
        Branch = 0;
        RegWrite = 1;
        MemToReg = 0;
    end
    6'b001001: begin // SLTIU
        AluOp = 6'b000010;
        AluSrc = 1;
        RegDst = 0;
        MemRead = 0;
        MemWrite = 0;
        Branch = 0;
        RegWrite = 1;
        MemToReg = 0;
    end
    6'b001101: begin // ORI
        AluOp = 6'b000011;
        AluSrc = 1;
        RegDst = 0;
        MemRead = 0;
        MemWrite = 0;
        Branch = 0;
        RegWrite = 1;
        MemToReg = 0;
    end
    6'b100011: begin //  LW
        AluOp = 6'b000100;
        AluSrc = 1;
        RegDst = 0;
        MemRead = 1;
        MemWrite = 0;
        Branch = 0;
        RegWrite = 1;
        MemToReg = 1;
    end
    6'b101011: begin //  SW
        AluOp = 6'b000101;
        AluSrc = 1;
        RegDst = 0;
        MemRead = 0;
        MemWrite = 1;
        Branch = 0;
        RegWrite = 0;
        MemToReg = 0;
    end
    6'b000100: begin // BEQ
        AluOp = 6'b000110;
        AluSrc = 0;
        RegDst = 0;
        MemRead = 0;
        MemWrite = 0;
        Branch = 1;
        RegWrite = 0;
        MemToReg = 0;
    end
    6'b000101: begin // BNE
        AluOp = 6'b000111;
        AluSrc = 0;
        RegDst = 0;
        MemRead = 0;
        MemWrite = 0;
        Branch = 1;
        RegWrite = 0;
        MemToReg = 0;
    end
    default: begin
        AluOp = 6'b000000;
        AluSrc = 0;
        RegDst = 0;
        MemRead = 0;
        MemWrite = 0;
        Branch = 0;
        RegWrite = 0;
        MemToReg = 0;
    end
  endcase
end
endmodule

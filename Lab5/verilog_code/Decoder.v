//Subject:     CO project 2 - Decoder
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
	RegWrite_o,
	ALU_op_o,
	ALUSrc_o,
	RegDst_o,
	Branch_o,
  Zero_ext_o,
  MemRead_o,
  MemWrite_o,
  Jump_o,
  MemToReg_o,
  Branch_type_o
	);

//I/O ports
input  [6-1:0] instr_op_i;

output         RegWrite_o;
output [4-1:0] ALU_op_o;
output         ALUSrc_o;
output    [2-1:0]     RegDst_o;
output         Branch_o;
output         Zero_ext_o;
output         MemRead_o;
output         MemWrite_o;
output         Jump_o;
output [2-1:0]           MemToReg_o;
output [2-1:0] Branch_type_o;

//Internal Signals
reg    [4-1:0] ALU_op_o;
reg            ALUSrc_o;
reg            RegWrite_o;
reg    [2-1:0]        RegDst_o;
reg            Branch_o;
reg            regZero_ext_o;
reg			   Zero_ext_o;
reg            MemRead_o;
reg            MemWrite_o;
reg            Jump_o;
reg     [2-1:0]       MemToReg_o;
reg     [2-1:0]       Branch_type_o;

//Parameter


//Main function
// op code
// 000: load/save word
// 001: branch equal
// 010: r type
// 011: ADD
// 100: SLT
// 101: LUI
// 110: OR
// 111: AND

always @(*) begin
    case (instr_op_i)
        6'b000000: begin // r type
            ALU_op_o = 4'b0010;
            ALUSrc_o = 0;
            RegWrite_o = 1;
            RegDst_o = 1;
            Branch_o = 0;
            Zero_ext_o = 0;
            MemRead_o = 0;
            MemWrite_o = 0;
            Jump_o = 0;
            MemToReg_o = 0;
            Branch_type_o = 0;
        end
        6'b000100: begin // beq
            ALU_op_o = 4'b0000;
            ALUSrc_o = 0;
            RegWrite_o = 0;
            RegDst_o = 0; //x
            Branch_o = 1;
            Zero_ext_o = 0;
            MemRead_o = 0;
            MemWrite_o = 0;
            Jump_o = 0;
            MemToReg_o = 0;
            Branch_type_o = 0;
        end
        6'b001000: begin // addi
            ALU_op_o = 4'b0011;
            ALUSrc_o = 1;
            RegWrite_o = 1;
            RegDst_o = 0;
            Branch_o = 0;
            Zero_ext_o = 0;
            MemRead_o = 0;
            MemWrite_o = 0;
            Jump_o = 0;
            MemToReg_o = 0;
            Branch_type_o = 0;
        end
        6'b001001: begin // sltiu
            ALU_op_o = 4'b0100;
            ALUSrc_o = 1;
            RegWrite_o = 1;
            RegDst_o = 0;
            Branch_o = 0;
            Zero_ext_o = 0;
            MemRead_o = 0;
            MemWrite_o = 0;
            Jump_o = 0;
            MemToReg_o = 0;
            Branch_type_o = 0;
        end
		  /*
        6'b001111: begin // lui
            ALU_op_o = 4'b0101;
            ALUSrc_o = 1;
            RegWrite_o = 1;
            RegDst_o = 0;
            Branch_o = 0;
            Zero_ext_o = 0;
            MemRead_o = 0;
            MemWrite_o = 0;
            Jump_o = 0;
            MemToReg_o = 0;
            Branch_type_o = 0;
        end
		  */
        6'b001101: begin // ori
            ALU_op_o = 4'b0110;
            ALUSrc_o = 1;
            RegWrite_o = 1;
            RegDst_o = 0;
            Branch_o = 0;
            Zero_ext_o = 1;
            MemRead_o = 0;
            MemWrite_o = 0;
            Jump_o = 0;
            MemToReg_o = 0;
            Branch_type_o = 0;
        end
		6'b000101: begin // bne
            ALU_op_o = 4'b0000;
            ALUSrc_o = 0;
            RegWrite_o = 0;
            RegDst_o = 0; 
            Branch_o = 1;
            Zero_ext_o = 0;
            MemRead_o = 0;
            MemWrite_o = 0;
            Jump_o = 0;
            MemToReg_o = 0;
            Branch_type_o = 1;
        end
		  6'b000110: begin // ble
            ALU_op_o = 4'b0000;
            ALUSrc_o = 0;
            RegWrite_o = 0;
            RegDst_o = 0; 
            Branch_o = 1;
            Zero_ext_o = 0;
            MemRead_o = 0;
            MemWrite_o = 0;
            Jump_o = 0;
            MemToReg_o = 0;
            Branch_type_o = 2;
        end
		  6'b000101: begin // bnez
            ALU_op_o = 4'b0000;
            ALUSrc_o = 0;
            RegWrite_o = 0;
            RegDst_o = 0; 
            Branch_o = 1;
            Zero_ext_o = 0;
            MemRead_o = 0;
            MemWrite_o = 0;
            Jump_o = 0;
            MemToReg_o = 0;
				Branch_type_o = 1;
        end
		  6'b000001: begin // bltz
            ALU_op_o = 4'b0000;
            ALUSrc_o = 0;
            RegWrite_o = 0;
            RegDst_o = 0; 
            Branch_o = 1;
            Zero_ext_o = 0;
            MemRead_o = 0;
            MemWrite_o = 0;
            Jump_o = 0;
            MemToReg_o = 0;
				Branch_type_o = 3;
        end
        6'b100011: begin //  lw
          ALU_op_o = 4'b0011;
          ALUSrc_o = 1;
          RegWrite_o = 1;
          RegDst_o = 0; //x
          Branch_o = 0;
          Zero_ext_o = 0;
          MemRead_o = 1;
          MemWrite_o = 0;
          Jump_o = 0;
          MemToReg_o = 1;
          Branch_type_o = 0;
        end
        6'b101011: begin //  sw
          ALU_op_o = 4'b0011;
          ALUSrc_o = 1;
          RegWrite_o = 0;
          RegDst_o = 0; //x
          Branch_o = 0;
          Zero_ext_o = 0;
          MemRead_o = 0;
          MemWrite_o = 1;
          Jump_o = 0;
          MemToReg_o = 0;
          Branch_type_o = 0;
        end
        6'b000010: begin //  jump
            ALU_op_o = 4'b0000;
            ALUSrc_o = 0;
            RegWrite_o = 0;
            RegDst_o = 0; //x
            Branch_o = 0;
            Zero_ext_o = 0;
            MemRead_o = 0;
            MemWrite_o = 0;
            Jump_o = 1;
            MemToReg_o = 0;
            Branch_type_o = 0;
        end
			6'b000011 : begin //  jal
            ALU_op_o = 4'b0000;
            ALUSrc_o = 0;
            RegWrite_o = 1;
            RegDst_o = 2;
            Branch_o = 0;
            Zero_ext_o = 0;
            MemRead_o = 0;
            MemWrite_o = 0;
            Jump_o = 1;
            MemToReg_o = 2;
            Branch_type_o = 0;
        end
		  6'b001111 : begin //  li
            ALU_op_o = 4'b0011;
            ALUSrc_o = 1;
            RegWrite_o = 1;
            RegDst_o = 0;
            Branch_o = 0;
            Zero_ext_o = 1;
            MemRead_o = 0;
            MemWrite_o = 0;
            Jump_o = 0;
            MemToReg_o = 3;
            Branch_type_o = 0;
        end
        default: begin
            ALU_op_o = 4'bxxx;
            ALUSrc_o = 0;
            RegWrite_o = 0;
            RegDst_o = 0;
            Branch_o = 0;
            Zero_ext_o = 0;
            MemRead_o = 0;
            MemWrite_o = 0;
            Jump_o = 0;
            MemToReg_o = 0;
            Branch_type_o = 0;
        end
    endcase
end
endmodule

//Subject:     CO project 2 - ALU Controller
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:
//----------------------------------------------
//Date:
//----------------------------------------------
//Description:
//--------------------------------------------------------------------------------

module ALU_Ctrl(
          funct_i,
          ALUOp_i,
          ALUCtrl_o,
			 jr_select_o
          );

//I/O ports
input      [6-1:0] funct_i;
input      [4-1:0] ALUOp_i;

output     [4-1:0] ALUCtrl_o;
output      jr_select_o;
//Internal Signals
reg        [4-1:0] ALUCtrl_o;

assign jr_select_o = (ALUOp_i == 4'b0010 && funct_i==6'b001000);

//Parameter

// ALUOp_i
// 4'b000 -> bne
// 4'b001 -> beq                                    師� 師�
// 4'b010 -> R-Type
// 4'b011 -> addi
// 4'b100 -> sltiu
// 4'b101 -> lui
// 4'b110 -> ori
// 4'b111 -> andi

// ALUCtrl_o
// 4'bxxxx default case

//Select exact operation
always @ (*) begin
  case (ALUOp_i)
    4'b0000: ALUCtrl_o = 4'b0110;
    4'b0010: begin
      case (funct_i)
          6'b100000: ALUCtrl_o = 4'b0010;
          6'b100010: ALUCtrl_o = 4'b0110;
          6'b100100: ALUCtrl_o = 4'b0000;
          6'b100101: ALUCtrl_o = 4'b0001;
          6'b101010: ALUCtrl_o = 4'b0111;
          6'b000011: ALUCtrl_o = 4'b1000; // SRA
          6'b000111: ALUCtrl_o = 4'b1001; // SRAV
			 6'b011000: ALUCtrl_o = 4'b1011; // mul
          default:   ALUCtrl_o = 4'bxxxx;
      endcase
    end
    4'b0011: ALUCtrl_o = 4'b0010;
    4'b0100: ALUCtrl_o = 4'b0111;
	4'b0101: ALUCtrl_o = 4'b0011;
    4'b0110: ALUCtrl_o = 4'b0001;
    4'b0111: ALUCtrl_o = 4'b0000;
    default: ALUCtrl_o = 4'bxxxx;
  endcase
end

endmodule

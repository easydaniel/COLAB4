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

module ALU_Control(
      funct_i,
      ALUOp_i,
      ALUCtrl_o
    );

//I/O ports
input      [6-1:0] funct_i;
input      [6-1:0] ALUOp_i;

output     [4-1:0] ALUCtrl_o;
//Internal Signals
reg        [4-1:0] ALUCtrl_o;

//Parameter

//Select exact operation
always @ (*) begin
  case (ALUOp_i)
    6'b000000: begin // R TYPE
        case (funct_i)
			6'b100000: ALUCtrl_o = 4'b0010; // ADD
            6'b100010: ALUCtrl_o = 4'b0110; // SUB
            6'b100100: ALUCtrl_o = 4'b0000; // AND
            6'b100101: ALUCtrl_o = 4'b0001; // OR
            6'b101010: ALUCtrl_o = 4'b0111; // SLT
            6'b000011: ALUCtrl_o = 4'b1000; // SRA
            6'b000111: ALUCtrl_o = 4'b1001; // SRAV
            6'b011000: ALUCtrl_o = 4'b1011; // MUL
            default:   ALUCtrl_o = 4'bxxxx;
        endcase
    end
    6'b000001: ALUCtrl_o = 4'b0010; // ADDI
    6'b000010: ALUCtrl_o = 4'b0111; // SLTIU
    6'b000011: ALUCtrl_o = 4'b0001; // ORI
    6'b000100: ALUCtrl_o = 4'b0010; // LW
    6'b000101: ALUCtrl_o = 4'b0010; // SW
    6'b000110: ALUCtrl_o = 4'b0110; // BEQ
    6'b000111: ALUCtrl_o = 4'b1100; // BNE
    default: ALUCtrl_o = 4'bxxxx;
  endcase
end

endmodule

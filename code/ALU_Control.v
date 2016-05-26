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
      ALUCtrl_o,
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
    default: ALUCtrl_o = 4'bxxxx;
  endcase
end

endmodule

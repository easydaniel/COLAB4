//Subject:     CO project 4 - HazardDetectUnit
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:
//----------------------------------------------
//Date:
//----------------------------------------------
//Description:
//--------------------------------------------------------------------------------
module HazardDetectUnit(
    PC_Select,
    IF_ID_RS_addr_i,
    IF_ID_RT_addr_i,
    ID_EX_RT_addr_i,
    ID_EX_MemRead_i,
    PC_Write,
    IF_Write,
	 IF_Flush,
    ID_Flush,
    EX_Flush
	);

//I/O ports
input              PC_Select; // branch
input      [5-1:0] IF_ID_RS_addr_i;
input      [5-1:0] IF_ID_RT_addr_i;
input      [5-1:0] ID_EX_RT_addr_i;
input              ID_EX_MemRead_i;

output             PC_Write;
output             IF_Write;
output             IF_Flush;
output             ID_Flush;
output             EX_Flush;

reg             	 PC_Write;
reg             	 IF_Write;
reg             	 IF_Flush;
reg             	 ID_Flush;
reg            	 EX_Flush;

//Internal signal

always @(*) begin
	case(PC_Select)
		 1'b1: begin
			  PC_Write <= 1'b0;
			  IF_Write <= 1'b0;
			  IF_Flush <= 1'b1;
			  ID_Flush <= 1'b1;
			  EX_Flush <= 1'b1;
		 end
		 1'b0: begin
			  if(ID_EX_MemRead_i & ((ID_EX_RT_addr_i == IF_ID_RS_addr_i) | (ID_EX_RT_addr_i == IF_ID_RT_addr_i))) begin
					PC_Write <= 1'b0;
					IF_Write <= 1'b0;
					IF_Flush <= 1'b0;
					ID_Flush <= 1'b1;
					EX_Flush <= 1'b0;
			  end
			  else begin
					PC_Write <= 1'b1;
					IF_Write <= 1'b1;
					IF_Flush <= 1'b0;
					ID_Flush <= 1'b0;
					EX_Flush <= 1'b0;
			  end
		 end
	endcase
end

endmodule

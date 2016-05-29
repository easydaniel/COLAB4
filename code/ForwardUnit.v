//Subject:     CO project 4 - ForwardUnit
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:
//----------------------------------------------
//Date:
//----------------------------------------------
//Description:
//--------------------------------------------------------------------------------
module ForwardUnit(
    ID_EX_RS_addr_i,
    ID_EX_RT_addr_i,
    EX_MEM_RD_addr_i,
    EX_MEM_RegWrite_i,
    MEM_WB_RD_addr_i,
    MEM_WB_RegWrite_i,
    Forward_A,
    Forward_B
	);

//I/O ports
input  [5-1:0]    ID_EX_RS_addr_i;
input  [5-1:0]    ID_EX_RT_addr_i;
input  [5-1:0]    EX_MEM_RD_addr_i;
input             EX_MEM_RegWrite_i;
input  [5-1:0]    MEM_WB_RD_addr_i;
input             MEM_WB_RegWrite_i;
output [2-1:0]    Forward_A;
output [2-1:0]    Forward_B;

//Internal signals
wire   [2-1:0]    Forward_A;
wire   [2-1:0]    Forward_B;

assign Forward_A = (EX_MEM_RegWrite_i & (EX_MEM_RD_addr_i == ID_EX_RS_addr_i) & (EX_MEM_RD_addr_i != 0)) ? 2'b01 : (MEM_WB_RegWrite_i & (MEM_WB_RD_addr_i == ID_EX_RS_addr_i) & (MEM_WB_RD_addr_i != 0) ? 2'b10 : 2'b00);
assign Forward_B = (EX_MEM_RegWrite_i & (EX_MEM_RD_addr_i == ID_EX_RT_addr_i) & (EX_MEM_RD_addr_i != 0)) ? 2'b01 : (MEM_WB_RegWrite_i & (MEM_WB_RD_addr_i == ID_EX_RT_addr_i) & (MEM_WB_RD_addr_i != 0) ? 2'b10 : 2'b00);

endmodule

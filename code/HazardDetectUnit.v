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
    PC_Stall,
    IF_Flush,
    ID_Flush,
    EX_Flush
	);

//I/O ports

//Internal signal

assign PC_Stall = (ID_EX_MemRead_i & (ID_EX_RT_addr_i == IF_ID_RS_addr_i) | (ID_EX_RT_addr_i == IF_ID_RT_addr_i));
assign ID_Flush = (ID_EX_MemRead_i & (ID_EX_RT_addr_i == IF_ID_RS_addr_i) | (ID_EX_RT_addr_i == IF_ID_RT_addr_i));




endmodule

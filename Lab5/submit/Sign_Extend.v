//Subject:     CO project 2 - Sign extend
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:
//----------------------------------------------
//Date:
//----------------------------------------------
//Description:
//--------------------------------------------------------------------------------

module Sign_Extend(
    data_i,
    zero_ext_i,
    data_o
    );

//I/O ports
input   [16-1:0] data_i;
input            zero_ext_i;
output  [32-1:0] data_o;

//Internal Signals
wire     [32-1:0] data_o;

//Sign extended
assign data_o = (zero_ext_i ? {16'h0000, data_i} : (data_i[15] ? {16'hFFFF, data_i} : {16'h0000, data_i}));


endmodule

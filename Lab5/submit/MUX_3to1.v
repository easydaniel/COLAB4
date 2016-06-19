//Subject:     CO project 2 - MUX 221
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:
//----------------------------------------------
//Date:
//----------------------------------------------
//Description:
//--------------------------------------------------------------------------------

module MUX_4to1(
               data0_i,
               data1_i,
               data2_i,
					data3_i,
               select_i,
               data_o
               );

parameter size = 0;

//I/O ports
input   [size-1:0] data0_i;
input   [size-1:0] data1_i;
input   [size-1:0] data2_i;
input   [size-1:0] data3_i;

input   [2-1:0]    select_i;
output  [size-1:0] data_o;

//Internal Signals
wire    [size-1:0] data_o;

//Main function
assign data_o = (select_i == 2'b00 ? data0_i : (select_i == 2'b01 ? data1_i : (select_i == 2'b10 ? data2_i : data3_i)));

endmodule

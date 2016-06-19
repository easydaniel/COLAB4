//Subject:     CO project 2 - Simple Single CPU
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:
//----------------------------------------------
//Date:
//----------------------------------------------
//Description:
//--------------------------------------------------------------------------------
module Simple_Single_CPU(
    clk_i,
		rst_i
		);

//I/O port
input         clk_i;
input         rst_i;

//Internal Signles
wire [32-1:0]  pc_in_i;
wire [32-1:0]  pc_out_i;
wire [32-1:0]  add_one_src;
wire [32-1:0]  add_one_res;
wire [32-1:0]  add_two_res;
wire [32-1:0]  instr_o;
wire [32-1:0]  shift_in;
wire [32-1:0]  shift_out;
wire [32-1:0]  alu_src;
wire [32-1:0]  alu_res;
wire [32-1:0]  RSdata_o;
wire [32-1:0]  RTdata_o;
wire [5-1:0]   RDaddr_res;
wire [4-1:0]   ctrl_i;
wire           RegWrite_o;
wire  [4-1:0]  ALU_op_o;
wire   [2-1:0]        RegDst_o;
wire           Branch_o;
wire           zero_o;
wire           Zero_ext_o;
wire MemRead_o;
wire MemWrite_o;
wire Jump_o;
wire [32-1:0] wb_result_o;
wire [2-1:0] MemToReg_o;
wire [32-1:0] read_data;
wire [32-1:0] mux_pc_o;
wire [2-1:0]Branch_type_o;
wire jr_select_o;
wire [32-1:0] pc_jr_in_i;

//Greate componentes
ProgramCounter PC(
      .clk_i(clk_i),
	    .rst_i (rst_i),
	    .pc_in_i(pc_in_i),
	    .pc_out_o(pc_out_i)
	    );

Adder Adder1(
      .src1_i(pc_out_i),
	    .src2_i(32'd4),
	    .sum_o(add_one_res)
	    );

Instruction_Memory IM(
      .addr_i(pc_out_i),
	    .instr_o(instr_o)
	    );


MUX_4to1 #(.size(5)) Mux_Write_Reg(
                .data0_i(instr_o[20:16]),
                .data1_i(instr_o[15:11]),
                .data2_i(5'b11111),
					 .data3_i(5'b0),
                .select_i(RegDst_o),
                .data_o(RDaddr_res)
                );

MUX_2to1 #(.size(32)) MUX_JR_PC(
        .data0_i(pc_jr_in_i),
        .data1_i(RSdata_o),
        .select_i(jr_select_o),
        .data_o(pc_in_i)
        );

Reg_File RF(
        .clk_i(clk_i),
	      .rst_i(rst_i) ,
        .RSaddr_i(instr_o[25:21]) ,
        .RTaddr_i(instr_o[20:16]) ,
        .RDaddr_i(RDaddr_res) ,
        .RDdata_i(wb_result_o)  ,
        .RegWrite_i(RegWrite_o),
        .RSdata_o(RSdata_o) ,
        .RTdata_o(RTdata_o)
        );

Decoder Decoder(
      .instr_op_i(instr_o[31:26]),
	    .RegWrite_o(RegWrite_o),
	    .ALU_op_o(ALU_op_o),
	    .ALUSrc_o(ALUSrc_o),
	    .RegDst_o(RegDst_o),
		  .Branch_o(Branch_o),
      .Zero_ext_o(Zero_ext_o),
      .MemRead_o(MemRead_o),
      .MemWrite_o(MemWrite_o),
      .Jump_o(Jump_o),
      .MemToReg_o(MemToReg_o),
      .Branch_type_o(Branch_type_o)
	    );

ALU_Ctrl AC(
        .funct_i(instr_o[5:0]),
        .ALUOp_i(ALU_op_o),
        .ALUCtrl_o(ctrl_i),
		  .jr_select_o(jr_select_o)
        );

Sign_Extend SE(
        .data_i(instr_o[15:0]),
        .zero_ext_i(Zero_ext_o),
        .data_o(shift_in)
        );

MUX_2to1 #(.size(32)) Mux_ALUSrc(
        .data0_i(RTdata_o),
        .data1_i(shift_in),
        .select_i(ALUSrc_o),
        .data_o(alu_src)
        );

ALU ALU(
      .src1_i(RSdata_o),
	    .src2_i(alu_src),
      .shmat_i(instr_o[10:6]),
	    .ctrl_i(ctrl_i),
	    .result_o(alu_res),
      .zero_o(zero_o)
	    );

Adder Adder2(
      .src1_i(add_one_res),
	    .src2_i(shift_out),
	    .sum_o(add_two_res)
	    );

Shift_Left_Two_32 Shifter(
        .data_i(shift_in),
        .data_o(shift_out)
        );

wire branch_decider;

assign branch_decider = ( (Branch_type_o==0 && zero_o==1) || (Branch_type_o==1 && zero_o==0) || (Branch_type_o==2 && (zero_o==1 || alu_res[31]==1)) || (Branch_type_o==3 && alu_res[31]==1) );

MUX_2to1 #(.size(32)) Mux_PC_Source(
        .data0_i(add_one_res),
        .data1_i(add_two_res),
        .select_i(Branch_o & branch_decider),
        .data_o(mux_pc_o)
        );



MUX_4to1 #(.size(32)) Mux_Write_Back(
                .data0_i(alu_res),
                .data1_i(read_data),
                .data2_i(add_one_res),
					 .data3_i(shift_in),
                .select_i(MemToReg_o),
                .data_o(wb_result_o)
                );

Data_Memory Data_Memory(
        .clk_i(clk_i),
    	.addr_i(alu_res),
    	.data_i(RTdata_o),
    	.MemRead_i(MemRead_o),
    	.MemWrite_i(MemWrite_o),
    	.data_o(read_data)
    );

MUX_2to1 #(.size(32)) PC_MUX(
        .data0_i(mux_pc_o),
        .data1_i({add_one_res[31:28] ,instr_o[25:0], 2'b00}),
        .select_i(Jump_o),
        .data_o(pc_jr_in_i)
        );
endmodule

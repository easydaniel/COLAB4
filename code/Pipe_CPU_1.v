//Subject:     CO project 4 - Pipe CPU 1
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:
//----------------------------------------------
//Date:
//----------------------------------------------
//Description:
//--------------------------------------------------------------------------------
module Pipe_CPU_1(
      clk_i,
  		rst_i
		);

/****************************************
I/O ports
****************************************/
input clk_i;
input rst_i;


/****************************************
Internal signal
****************************************/
/**** IF stage ****/
wire [32-1:0] pc_i;
wire [32-1:0] pc_o;
wire [32-1:0] pc_sum;
wire [32-1:0] instr_o;
wire [32-1:0] IF_ID_pc_o;
wire [32-1:0] IF_ID_instr_o;

/**** ID stage ****/
wire [32-1:0] RSdata_o;
wire [32-1:0] RTdata_o;
wire [32-1:0] sign_ext_o;
wire [32-1:0] ID_EX_pc_o;
wire [32-1:0] ID_EX_rs_o;
wire [5-1:0]  ID_EX_rs_addr_o;
wire [32-1:0] ID_EX_rt_o;
wire [5-1:0]  ID_EX_rt_addr_o;
wire [5-1:0]  ID_EX_rd_addr_o;
wire [32-1:0] ID_EX_sign_ext_o;
wire [6-1:0]  AluOp;
wire          AluSrc;
wire          RegDst;
wire          MemRead;
wire          MemWrite;
wire          Branch;
wire          RegWrite;
wire          MemToReg;

//control signal
wire          MEM_WB_RegWrite;

/**** EX stage ****/
wire [4-1:0]  ctrl_i;
wire [32-1:0] src2_i;
wire [32-1:0] add_shift_o;
wire          zero_o;
wire [32-1:0] result_o;
wire          EX_MEM_zero_o;
wire [32-1:0] EX_MEM_pc_shift_o;
wire [5-1:0]  EX_dest_addr;
wire [5-1:0]  EX_MEM_dest_addr_o;
wire [32-1:0] EX_MEM_result_o;
wire [32-1:0] EX_MEM_write_data_o;
wire          ID_EX_MemRead;
wire          ID_EX_MemWrite;
wire          ID_EX_Branch;
wire          ID_EX_RegWrite;
wire          ID_EX_MemToReg;
wire [2-1:0]  Forward_A;
wire [2-1:0]  Forward_B;
wire [32-1:0] Alu_Src_1;
wire [32-1:0] Alu_Src_2;

//control signal
wire [6-1:0]  ID_EX_AluOp;
wire          ID_EX_AluSrc;
wire          ID_EX_RegDst;

/**** MEM stage ****/
wire [32-1:0] MEM_read_data_o;
wire [32-1:0] MEM_WB_read_data_o;
wire [5-1:0]  MEM_WB_dest_addr_o;
wire [32-1:0] MEM_WB_result_o;
wire [32-1:0] MEM_write_data_o;
wire          EX_MEM_RegWrite;
wire          EX_MEM_MemToReg;

//control signal
wire          EX_MEM_MemRead;
wire          EX_MEM_MemWrite;
wire          EX_MEM_Branch;

/**** WB stage ****/

//control signal
wire          MEM_WB_MemToReg;

// Hazard Unit signal
wire PC_Write;
wire IF_Write;
wire IF_Flush;
wire ID_Flush;
wire EX_Flush;

/****************************************
Instnatiate modules
****************************************/
//Instantiate the components in IF stage

MUX_2to1 #(.size(32)) Mux0(
      .data0_i(pc_sum),
      .data1_i(EX_MEM_pc_shift_o),
      .select_i(EX_MEM_Branch & EX_MEM_zero_o),  // zero should use pipelined?
      .data_o(pc_i)
    );

ProgramCounter PC(
      .clk_i(clk_i),
      .rst_i(rst_i),
		  .PC_Write_i(PC_Write),
      .pc_i(pc_i),
      .pc_o(pc_o)
    );

Instr_Memory IM(
      .addr_i(pc_o),
      .instr_o(instr_o)
    );

Adder Add_pc(
      .src1_i(pc_o),
      .src2_i(32'd4),
      .sum_o(pc_sum)
		);


Pipe_Reg #(.size(32)) IF_ID_pc(       //N is the total length of input/output
      .clk_i(clk_i),
      .rst_i(rst_i),
      .flush_i(IF_Flush),
      .write_i(IF_Write),
      .data_i(pc_sum),
      .data_o(IF_ID_pc_o)
		);

Pipe_Reg #(.size(32)) IF_ID_instr(       //N is the total length of input/output
      .clk_i(clk_i),
      .rst_i(rst_i),
      .flush_i(IF_Flush),
      .write_i(IF_Write),
      .data_i(instr_o),
      .data_o(IF_ID_instr_o)
		);


//Instantiate the components in ID stage
Reg_File RF(
      .clk_i(clk_i),
      .rst_i(rst_i),
      .RSaddr_i(IF_ID_instr_o[25:21]),
      .RTaddr_i(IF_ID_instr_o[20:16]),
      .RDaddr_i(MEM_WB_dest_addr_o),
      .RDdata_i(MEM_write_data_o) ,
      .RegWrite_i(MEM_WB_RegWrite),
      .RSdata_o(RSdata_o),
      .RTdata_o(RTdata_o)
		);

Decoder Control(
      .instr_op_i(IF_ID_instr_o[31:26]),
      .AluOp(AluOp),
      .AluSrc(AluSrc),
      .RegDst(RegDst),
      .MemRead(MemRead),
      .MemWrite(MemWrite),
      .Branch(Branch),
      .RegWrite(RegWrite),
      .MemToReg(MemToReg)
		);

Sign_Extend Sign_Extend(
      .data_i(IF_ID_instr_o[15:0]),
      .data_o(sign_ext_o)
		);

Pipe_Reg #(.size(6)) ID_EX_AluOp_Pipe(
      .clk_i(clk_i),
      .rst_i(rst_i),
      .flush_i(ID_Flush),
      .write_i(1'b1),
      .data_i(AluOp),
      .data_o(ID_EX_AluOp)
		);

Pipe_Reg #(.size(1)) ID_EX_AluSrc_Pipe(
      .clk_i(clk_i),
      .rst_i(rst_i),
      .flush_i(ID_Flush),
      .write_i(1'b1),
      .data_i(AluSrc),
      .data_o(ID_EX_AluSrc)
		);

Pipe_Reg #(.size(1)) ID_EX_RegDst_Pipe(
      .clk_i(clk_i),
      .rst_i(rst_i),
      .flush_i(ID_Flush),
      .write_i(1'b1),
      .data_i(RegDst),
      .data_o(ID_EX_RegDst)
		);

Pipe_Reg #(.size(1)) ID_EX_MemRead_Pipe(
      .clk_i(clk_i),
      .rst_i(rst_i),
      .flush_i(ID_Flush),
      .write_i(1'b1),
      .data_i(MemRead),
      .data_o(ID_EX_MemRead)
		);

Pipe_Reg #(.size(1)) ID_EX_MemWrite_Pipe(
      .clk_i(clk_i),
      .rst_i(rst_i),
      .flush_i(ID_Flush),
      .write_i(1'b1),
      .data_i(MemWrite),
      .data_o(ID_EX_MemWrite)
		);

Pipe_Reg #(.size(1)) ID_EX_Branch_Pipe(
      .clk_i(clk_i),
      .rst_i(rst_i),
      .flush_i(ID_Flush),
      .write_i(1'b1),
      .data_i(Branch),
      .data_o(ID_EX_Branch)
		);

Pipe_Reg #(.size(1)) ID_EX_RegWrite_Pipe(
      .clk_i(clk_i),
      .rst_i(rst_i),
      .flush_i(ID_Flush),
      .write_i(1'b1),
      .data_i(RegWrite),
      .data_o(ID_EX_RegWrite)
		);

Pipe_Reg #(.size(1)) ID_EX_MemToReg_Pipe(
      .clk_i(clk_i),
      .rst_i(rst_i),
      .flush_i(ID_Flush),
      .write_i(1'b1),
      .data_i(MemToReg),
      .data_o(ID_EX_MemToReg)
		);

Pipe_Reg #(.size(32)) ID_EX_pc_Pipe(
      .clk_i(clk_i),
      .rst_i(rst_i),
      .flush_i(ID_Flush),
      .write_i(1'b1),
      .data_i(IF_ID_pc_o),
      .data_o(ID_EX_pc_o)
		);

Pipe_Reg #(.size(32)) ID_EX_rs_Pipe(
      .clk_i(clk_i),
      .rst_i(rst_i),
      .flush_i(ID_Flush),
      .write_i(1'b1),
      .data_i(RSdata_o),
      .data_o(ID_EX_rs_o)
		);


Pipe_Reg #(.size(5)) ID_EX_rs_addr_Pipe(
      .clk_i(clk_i),
      .rst_i(rst_i),
      .flush_i(ID_Flush),
      .write_i(1'b1),
      .data_i(IF_ID_instr_o[25:21]),
      .data_o(ID_EX_rs_addr_o)
		);

Pipe_Reg #(.size(32)) ID_EX_rt_Pipe(
      .clk_i(clk_i),
      .rst_i(rst_i),
      .flush_i(ID_Flush),
      .write_i(1'b1),
      .data_i(RTdata_o),
      .data_o(ID_EX_rt_o)
		);

Pipe_Reg #(.size(5)) ID_EX_rt_addr_Pipe(
      .clk_i(clk_i),
      .rst_i(rst_i),
      .flush_i(ID_Flush),
      .write_i(1'b1),
      .data_i(IF_ID_instr_o[20:16]),
      .data_o(ID_EX_rt_addr_o)
		);

Pipe_Reg #(.size(5)) ID_EX_rd_addr_Pipe(
      .clk_i(clk_i),
      .rst_i(rst_i),
      .flush_i(ID_Flush),
      .write_i(1'b1),
      .data_i(IF_ID_instr_o[15:11]),
      .data_o(ID_EX_rd_addr_o)
		);

Pipe_Reg #(.size(32)) ID_EX_sign_ext_Pipe(
      .clk_i(clk_i),
      .rst_i(rst_i),
      .flush_i(ID_Flush),
      .write_i(1'b1),
      .data_i(sign_ext_o),
      .data_o(ID_EX_sign_ext_o)
		);

//Instantiate the components in EX stage

Adder Add_shift(
      .src1_i(ID_EX_pc_o),
      .src2_i({ID_EX_sign_ext_o[29:0], 2'b00}),
      .sum_o(add_shift_o)
		);

ALU ALU(
      .src1_i(Alu_Src_1),
      .src2_i(Alu_Src_2),
      .ctrl_i(ctrl_i),
      .result_o(result_o),
      .zero_o(zero_o)
		);

ALU_Control ALU_Ctrl(
      .funct_i(ID_EX_sign_ext_o[5:0]),
      .ALUOp_i(ID_EX_AluOp),
      .ALUCtrl_o(ctrl_i)
		);

MUX_2to1 #(.size(32)) Mux1(
      .data0_i(src2_i),
      .data1_i(ID_EX_sign_ext_o),
      .select_i(ID_EX_AluSrc),
      .data_o(Alu_Src_2)
    );

MUX_2to1 #(.size(5)) Mux2(
      .data0_i(ID_EX_rt_addr_o),
      .data1_i(ID_EX_rd_addr_o),
      .select_i(ID_EX_RegDst),
      .data_o(EX_dest_addr)
    );

Mux_4to1 #(.size(32)) Mux4(
      .data0_i(ID_EX_rs_o),
      .data1_i(EX_MEM_result_o),
      .data2_i(MEM_write_data_o),
      .data3_i(32'b0),
      .select_i(Forward_A),
      .data_o(Alu_Src_1)
    );

Mux_4to1 #(.size(32)) Mux5(
      .data0_i(ID_EX_rt_o),
      .data1_i(EX_MEM_result_o),
      .data2_i(MEM_write_data_o),
      .data3_i(32'b0),
      .select_i(Forward_B),
      .data_o(src2_i)
    );

ForwardUnit Forwarding(
      .ID_EX_RS_addr_i(ID_EX_rs_addr_o),
      .ID_EX_RT_addr_i(ID_EX_rt_addr_o),
      .EX_MEM_RD_addr_i(EX_MEM_dest_addr_o),
      .EX_MEM_RegWrite_i(EX_MEM_RegWrite),
      .MEM_WB_RD_addr_i(MEM_WB_dest_addr_o),
      .MEM_WB_RegWrite_i(MEM_WB_RegWrite),
      .Forward_A(Forward_A),
      .Forward_B(Forward_B)
    );

HazardDetectUnit Hazard(
      .PC_Select(EX_MEM_Branch & EX_MEM_zero_o),
      .IF_ID_RS_addr_i(IF_ID_instr_o[25:21]),
      .IF_ID_RT_addr_i(IF_ID_instr_o[20:16]),
      .ID_EX_RT_addr_i(ID_EX_rt_addr_o),
      .ID_EX_MemRead_i(ID_EX_MemRead),
      .PC_Write(PC_Write),
      .IF_Write(IF_Write),
      .IF_Flush(IF_Flush),
      .ID_Flush(ID_Flush),
      .EX_Flush(EX_Flush)
);

Pipe_Reg #(.size(1)) EX_MEM_Branch_Pipe(
      .clk_i(clk_i),
      .rst_i(rst_i),
      .flush_i(EX_Flush),
      .write_i(1'b1),
      .data_i(ID_EX_Branch),
      .data_o(EX_MEM_Branch)
		);

Pipe_Reg #(.size(1)) EX_MEM_MemRead_Pipe(
      .clk_i(clk_i),
      .rst_i(rst_i),
      .flush_i(EX_Flush),
      .write_i(1'b1),
      .data_i(ID_EX_MemRead),
      .data_o(EX_MEM_MemRead)
		);

Pipe_Reg #(.size(1)) EX_MEM_MemWrite_Pipe(
      .clk_i(clk_i),
      .rst_i(rst_i),
      .flush_i(EX_Flush),
      .write_i(1'b1),
      .data_i(ID_EX_MemWrite),
      .data_o(EX_MEM_MemWrite)
		);

Pipe_Reg #(.size(1)) EX_MEM_RegWrite_Pipe(
      .clk_i(clk_i),
      .rst_i(rst_i),
      .flush_i(EX_Flush),
      .write_i(1'b1),
      .data_i(ID_EX_RegWrite),
      .data_o(EX_MEM_RegWrite)
		);

Pipe_Reg #(.size(1)) EX_MEM_MemToReg_Pipe(
      .clk_i(clk_i),
      .rst_i(rst_i),
      .flush_i(EX_Flush),
      .write_i(1'b1),
      .data_i(ID_EX_MemToReg),
      .data_o(EX_MEM_MemToReg)
		);

Pipe_Reg #(.size(32)) EX_MEM_pc_shift_Pipe(
      .clk_i(clk_i),
      .rst_i(rst_i),
      .flush_i(EX_Flush),
      .write_i(1'b1),
      .data_i(add_shift_o),
      .data_o(EX_MEM_pc_shift_o)
		);

Pipe_Reg #(.size(1)) EX_MEM_zero_Pipe(
      .clk_i(clk_i),
      .rst_i(rst_i),
      .flush_i(EX_Flush),
      .write_i(1'b1),
      .data_i(zero_o),
      .data_o(EX_MEM_zero_o)
		);

Pipe_Reg #(.size(5)) EX_MEM_dest_addr_Pipe(
      .clk_i(clk_i),
      .rst_i(rst_i),
      .flush_i(EX_Flush),
      .write_i(1'b1),
      .data_i(EX_dest_addr),
      .data_o(EX_MEM_dest_addr_o)
		);

Pipe_Reg #(.size(32)) EX_MEM_result_Pipe(
      .clk_i(clk_i),
      .rst_i(rst_i),
      .flush_i(EX_Flush),
      .write_i(1'b1),
      .data_i(result_o),
      .data_o(EX_MEM_result_o)
		);

Pipe_Reg #(.size(32)) EX_MEM_write_data_Pipe(
      .clk_i(clk_i),
      .rst_i(rst_i),
      .flush_i(EX_Flush),
      .write_i(1'b1),
      .data_i(src2_i),
      .data_o(EX_MEM_write_data_o)
		);

//Instantiate the components in MEM stage
Data_Memory DM(
      .clk_i(clk_i),
      .addr_i(EX_MEM_result_o),
      .data_i(EX_MEM_write_data_o),
      .MemRead_i(EX_MEM_MemRead),
      .MemWrite_i(EX_MEM_MemWrite),
      .data_o(MEM_read_data_o)
    );

Pipe_Reg #(.size(1)) MEM_WB_MemToReg_Pipe(
      .clk_i(clk_i),
      .rst_i(rst_i),
      .flush_i(1'b0),
      .write_i(1'b1),
      .data_i(EX_MEM_MemToReg),
      .data_o(MEM_WB_MemToReg)
		);

Pipe_Reg #(.size(1)) MEM_WB_RegWrite_Pipe(
      .clk_i(clk_i),
      .rst_i(rst_i),
      .flush_i(1'b0),
      .write_i(1'b1),
      .data_i(EX_MEM_RegWrite),
      .data_o(MEM_WB_RegWrite)
		);

Pipe_Reg #(.size(32)) MEM_WB_read_data_Pipe(
      .clk_i(clk_i),
      .rst_i(rst_i),
      .flush_i(1'b0),
      .write_i(1'b1),
      .data_i(MEM_read_data_o),
      .data_o(MEM_WB_read_data_o)
		);

Pipe_Reg #(.size(5)) MEM_WB_dest_addr_Pipe(
      .clk_i(clk_i),
      .rst_i(rst_i),
      .flush_i(1'b0),
      .write_i(1'b1),
      .data_i(EX_MEM_dest_addr_o),
      .data_o(MEM_WB_dest_addr_o)
		);

Pipe_Reg #(.size(32)) MEM_WB_result_Pipe(
      .clk_i(clk_i),
      .rst_i(rst_i),
      .flush_i(1'b0),
      .write_i(1'b1),
      .data_i(EX_MEM_result_o),
      .data_o(MEM_WB_result_o)
		);

//Instantiate the components in WB stage
MUX_2to1 #(.size(32)) Mux3(
      .data0_i(MEM_WB_result_o),
      .data1_i(MEM_WB_read_data_o),
      .select_i(MEM_WB_MemToReg),
      .data_o(MEM_write_data_o)
    );

/****************************************
signal assignment
****************************************/
endmodule

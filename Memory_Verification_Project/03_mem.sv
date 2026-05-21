// Memory design:

/*module mem(clk, rst, wr_rd, addr, Wdata, Rdata, valid, ready);
	input clk, rst, wr_rd, valid;
	input [`ADDR_W-1 : 0]addr;
	input [`WIDTH-1 : 0]Wdata;
	output reg[`WIDTH-1 : 0]Rdata;
	output reg ready;

	// memory declaration:
	reg[`WIDTH-1 : 0]mem[`DEPTH-1 : 0];

	// memory functionality:
	int i;
	always @(posedge clk) begin
		if(rst == 1)begin
			Rdata = 0;
			ready = 0;
			for(i=0; i<`DEPTH; i=i+1) mem[i] = 0;
		end
		else begin
			if(valid == 1)begin
				ready = 1;
				if(wr_rd == 1) mem[addr] = Wdata;
				else Rdata = mem[addr];
			end
			else ready = 0;
		end
	end
endmodule
*/

module mem(mem_intrf.design_mp mp);
	//input clk, rst, wr_rd, valid;
	//input [`ADDR_W-1 : 0]addr;
	//input [`WIDTH-1 : 0]Wdata;
	//output reg[`WIDTH-1 : 0]Rdata;
	//output reg ready;

	// memory declaration:
	reg[`WIDTH-1 : 0]mem[`DEPTH-1 : 0];

	// memory functionality:
	int i;
	always @(posedge clk) begin
		if(mp.rst == 1)begin
			mp.Rdata = 0;
			mp.ready = 0;
			for(i=0; i<`DEPTH; i=i+1) mem[i] = 0;
		end
		else begin
			if(mp.valid == 1)begin
				mp.ready = 1;
				if(mp.wr_rd == 1) mem[mp.addr] = mp.Wdata;
				else mp.Rdata = mem[mp.addr];
			end
			else mp.ready = 0;
		end
	end
endmodule

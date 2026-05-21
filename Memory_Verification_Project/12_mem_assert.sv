//on notes page no: 129:

module mem_assert(clk, rst, addr, wr_rd, Wdata, Rdata, valid, ready);
	input clk, rst, wr_rd, valid, ready;
	input[`ADDR_W-1:0] addr;
	input[`WIDTH-1:0] Wdata, Rdata;

	//i:
	property reset;
		@(posedge clk) (rst==1) |-> (wr_rd==0 && addr==0 && Wdata==0 && Rdata==0 && valid==0 && ready==0);
	endproperty
	RESET: assert property(reset);

	//ii:
	property preset;
		@(posedge clk) (rst==0) |-> (!($isunknown(wr_rd)) && 
									(!($isunknown(addr))) && 
									(!($isunknown(Wdata))) && 
									(!($isunknown(Rdata))) && 
									(!($isunknown(valid))) && 
									(!($isunknown(ready))) 
									);
	endproperty
	PRESET: assert property(preset);

	//iii:
	property hand_shake;
		@(posedge clk) (valid==1) |=> (ready==1); 
	endproperty
	HANDSHAKE: assert property(hand_shake);

	//v:
	property writes;
		@(posedge clk) (wr_rd==1) |-> (!($isunknown(addr)) && 
									  (!($isunknown(Wdata)))
									  );
	endproperty
	WRITES: assert property(writes);

	property reads;
		@(posedge clk) disable iff(rst==1) (wr_rd==0) |-> (!($isunknown(addr)) &&
														  (!($isunknown(Rdata)))
														  );
	endproperty
	READS: assert property(reads);
endmodule

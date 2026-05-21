// Interface for the connections between memory:

interface mem_intrf(input reg clk, rst);	// mention only inputs, here itself
	bit wr_rd;
	bit[`ADDR_W-1 : 0]addr;
	bit[`WIDTH-1 : 0]Wdata,Rdata;
	bit valid, ready;

	clocking bfm_cb @(posedge clk);
		default input #0 output #1;
		input ready, Rdata;
		output wr_rd, addr, Wdata, valid;
	endclocking

	clocking mon_cb @(posedge clk);		// no outputs here, because all the signals To monitor are inputs (Came from Interface)
		default input #1;
		input ready, Rdata, wr_rd, addr, Wdata, valid;
	endclocking

	modport design_mp(
		input clk, rst, wr_rd, addr, Wdata, valid,
		output Rdata, ready);

	modport bfm_mp(
		clocking bfm_cb
	);


endinterface

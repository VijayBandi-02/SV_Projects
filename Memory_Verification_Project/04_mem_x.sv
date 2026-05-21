// memory transaction class:

class mem_tx;
	rand bit wr_rd;
	randc bit [`ADDR_W-1 : 0]addr;
	rand bit [`WIDTH-1 : 0]Wdata;
		 bit [`WIDTH-1 : 0]Rdata;

	function void print(input string str="mem_tx");
		$display("%0t:---------%0s--------", $time, str);		
		$display("wr_rd = %b", wr_rd);
		$display("addr = %0d", addr);
		$display("Wdata = %0d", Wdata);
		$display("Rdata = %0d", Rdata);
	endfunction

endclass

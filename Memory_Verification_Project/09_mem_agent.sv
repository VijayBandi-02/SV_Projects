// Agent for mem_TB:

class mem_agent;
	mem_gen gen;
	mem_BFM bfm;
	mem_mon mon;
	mem_cov cov;

	task run();
		$display("Agent Functioning");
		gen = new();
		bfm = new();
		mon = new();
		cov = new();

		fork // for concurrent operation:
			gen.run();
			bfm.run();
			mon.run();
			cov.run();
		join
	endtask
endclass

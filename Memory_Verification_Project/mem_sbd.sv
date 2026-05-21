// scoreboard for mem_TB:

class mem_sbd;
	mem_tx tx;

	int asso[int];

	task run();
		$display("Scoreboard Functioning");
		forever begin
			mem_common::mon2sbd.get(tx);
			tx.print("mem_sbd");

			// Checker:
			if(tx.wr_rd==1) asso[tx.addr]=tx.Wdata;
			else begin
				if(asso[tx.addr]==tx.Rdata) mem_common::matchings++;
				else mem_common::mismatchings++;
			end
		end
	endtask
endclass

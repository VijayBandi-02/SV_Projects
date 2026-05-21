// BFM for mem_TB:

class mem_BFM;
	mem_tx tx;
	virtual mem_intrf vif;

	task run();
		$display("BFM Funtioning");
		vif = tb.pif;		// accessing memory of P.I from TB
	forever begin
		mem_common::gen2bfm.get(tx);		// getting transactions into BFM from Generator through MailBox
		drive_tx(tx);		// whatever tran's gets by MailBox will drive onto interface 
		tx.print("mem_bfm");
		mem_common::bfm_count++;
	end
	endtask

	task drive_tx(mem_tx tx);		// used to drive tran's from BFM to interface
		@(vif.bfm_mp.bfm_cb);
		vif.bfm_mp.bfm_cb.wr_rd 					<= tx.wr_rd;		// non-blocking nature required. Because, outputs need to be upadated at next +ve edge
		vif.bfm_mp.bfm_cb.addr  					<= tx.addr;
		
		// Write tran's:
		if(tx.wr_rd == 1) vif.bfm_mp.bfm_cb.Wdata 	<= tx.Wdata;
		else vif.bfm_mp.bfm_cb.Wdata 				<= 0;
		
		// hand-shaking:
		vif.bfm_mp.bfm_cb.valid 					<= 1;		 
		wait(vif.bfm_mp.bfm_cb.ready == 1);		

		// Read tran's:
		if(vif.bfm_mp.bfm_cb.wr_rd == 0)begin
			@(vif.bfm_mp.bfm_cb);
			tx.Rdata = vif.bfm_mp.bfm_cb.Rdata;
		end
		else tx.Rdata = 0;

		// we need to reset all the signals after completing tran's:
		@(vif.bfm_mp.bfm_cb);
		vif.bfm_mp.bfm_cb.addr  <= 0;
		vif.bfm_mp.bfm_cb.wr_rd <= 0;
		vif.bfm_mp.bfm_cb.Wdata <= 0;
		vif.bfm_mp.bfm_cb.valid <= 0;
	endtask
endclass

// generator for memory TB:

class mem_gen;
	mem_tx tx, temp, /*for addr*/ txQ[$]; /*for multiple addresses*/

	task run();
		$display("Generator Functioning");
		case(mem_common::test_name)		// from the file mem_common, uses test case named test_name 
			"1WR":begin
				mem_common::gen_count=1;
				tx = new();
				assert(tx.randomize() with{tx.wr_rd == 1;}) // in-line constraint
				tx.print("mem_gen_1WR");
				mem_common::gen2bfm.put(tx);		// putting transactions from Generator to BFM through MailBox
			end
			"5WR":begin
				mem_common::gen_count=5;
				tx = new();
				repeat(5)begin
					assert(tx.randomize() with{tx.wr_rd == 1;}) // in-line constraint
					tx.print("mem_gen_5WR");
					temp = new tx;
					mem_common::gen2bfm.put(temp);
				end
			end
			"1WR_1RD":begin
				mem_common::gen_count=2;
				// write tx
				tx = new();
				assert(tx.randomize() with{tx.wr_rd == 1;}) // in-line constraint
				temp = new tx;
				mem_common::gen2bfm.put(tx);
				tx.print("mem_gen_wr_tx");
				
				// read tx
				tx = new();
				assert(tx.randomize() with{tx.wr_rd == 0; tx.addr == temp.addr; tx.Wdata == 0;}) // in-line constraint
				temp = new tx;
				mem_common::gen2bfm.put(tx);
				tx.print("mem_gen_rd_tx");
			end
			"5WR_5RD":begin
				mem_common::gen_count=10;
				tx = new();
				repeat(5)begin
					assert(tx.randomize() with {tx.wr_rd == 1;}) // in-line constraint
					temp = new tx;
					mem_common::gen2bfm.put(temp);
					txQ.push_back(temp);
					tx.print("mem_gen_wr_tx");
				end
				repeat(5)begin
					tx = new();
					temp = txQ.pop_front();
					assert(tx.randomize() with {tx.wr_rd == 0; tx.addr == temp.addr; tx.Wdata == 0;})
					mem_common::gen2bfm.put(tx);
					tx.print("mem_gen_rd_tx");
				end
			end
			"NWR_NRD":begin
				mem_common::gen_count=2*mem_common::N;
				tx = new();
				repeat(mem_common::N)begin	// access 'N' from file mem_common
					assert(tx.randomize() with{tx.wr_rd == 1;}) // in-line constraint
					temp = new tx;
					mem_common::gen2bfm.put(temp);
					txQ.push_back(temp);
					tx.print("mem_gen_wr_tx");
				end
				repeat(mem_common::N)begin
					tx = new();
					temp = txQ.pop_front();
					assert(tx.randomize() with{tx.wr_rd == 0; tx.addr == temp.addr; tx.Wdata == 0;})
					mem_common::gen2bfm.put(tx);
					tx.print("mem_gen_rd_tx");
				end
			end
		endcase
	endtask
endclass

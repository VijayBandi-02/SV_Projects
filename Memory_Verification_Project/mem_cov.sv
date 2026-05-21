// Coverage for mem_TB:

class mem_cov;
	mem_tx tx;

	covergroup CG;
		option.per_instance = 1;
		option.name = "MEM_COVERAGE";
		WR_RD: coverpoint tx.wr_rd{
			option.weight = 1;
			bins WRITES = {1'b1};
			bins READS  = {1'b0};
			option.comment = "memory wr_rd signal coverpoint";
		}
		ADDRESS: coverpoint tx.addr{
			option.weight = 2;
			option.comment = "memory addr signal coverpoint";

			// by value:
			bins ADDR0 	= {5'b00000};
			bins ADDR1 	= {5'b00001};
			bins ADDR2 	= {5'b00010};
			bins ADDR3 	= {5'b00011};
			bins ADDR4 	= {5'b00100};
			bins ADDR5 	= {5'b00101};
			bins ADDR6 	= {5'b00110};
			bins ADDR7 	= {5'b00111};
			bins ADDR8 	= {5'b01000};
			bins ADDR9 	= {5'b01001};
			bins ADDR10 = {5'b01010};
			bins ADDR11 = {5'b01011};
			bins ADDR12 = {5'b01100};
			bins ADDR13 = {5'b01101};
			bins ADDR14 = {5'b01110};
			bins ADDR15 = {5'b01111};
			bins ADDR16 = {5'b10000};
			bins ADDR17 = {5'b10001};
			bins ADDR18 = {5'b10010};
			bins ADDR19 = {5'b10011};
			bins ADDR20 = {5'b10100};
			bins ADDR21 = {5'b10101};
			bins ADDR22 = {5'b10110};
			bins ADDR23 = {5'b10111};
			bins ADDR24 = {5'b11000};
			bins ADDR25 = {5'b11001};
			bins ADDR26 = {5'b11010};
			bins ADDR27 = {5'b11011};
			bins ADDR28 = {5'b11100};
			bins ADDR29 = {5'b11101};
			bins ADDR30 = {5'b11110};
			bins ADDR31 = {5'b11111};

					//(or)
			// by range: If any possibility of given range is satisfied, then it shows green for complete bin in coverage. So, ignore this method. 
			// bins ADDR0 = {[0:3]};	
			// bins ADDR1 = {[4:7]};
			// bins ADDR2 = {[8:11]};
			// bins ADDR3 = {[12:15]};
			// bins ADDR4 = {[16:19]};
			// bins ADDR5 = {[20:23]};
			// bins ADDR6 = {[24:27]};
			// bins ADDR7 = {[28:31]};

			option.auto_bin_max = 32;	// Bin generation using "Option"
		}
		CROSS_WR_RD_ADDR: cross WR_RD, ADDRESS{
			option.weight = 5;
			option.comment = "memory cross product of wr_rd & addr signals coverpoints";
			bins SAMPLE = binsof(WR_RD.WRITES);
			bins SAMPLE1 = binsof(WR_RD.READS);
		}
	endgroup
	
	function new();
		CG=new();
	endfunction

	task run();
		$display("Coverage Functioning");
		forever begin
			mem_common::mon2cov.get(tx);
			CG.sample();
			tx.print("mem_cov");
		end
	endtask
endclass

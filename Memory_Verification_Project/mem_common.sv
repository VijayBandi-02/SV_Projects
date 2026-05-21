// Common class: contains all required parameters

`define WIDTH 8		// no.of elements in each depth
`define DEPTH 32	// no.of columns
`define ADDR_W $clog2(`DEPTH)		// Width of the Address

class mem_common;
	static string test_name;
	static int N;
	static mailbox gen2bfm = new();
	static mailbox mon2cov = new();
	static mailbox mon2sbd = new();
	static int matchings, mismatchings;
	static int gen_count, bfm_count;
endclass

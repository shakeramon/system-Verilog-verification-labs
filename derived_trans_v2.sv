class write_trans_v2 extends bus_trans_v2;
	constraint type_c {
	kind == WRITE;	
	}
endclass : write_trans_v2

class read_trans_v2 extends bus_trans_v2;
	constraint type_c {
		kind == READ;	
	}
endclass : read_trans_v2
class casting_trans;
	static int global_id = 0 ;
	int id ;
	function  new();

		id = global_id++;
		
	endfunction 

	virtual function void display();
		$display("bus trans with id = %0d", id);
	endfunction 
endclass : casting_trans
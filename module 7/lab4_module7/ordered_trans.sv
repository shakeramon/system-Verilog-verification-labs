class ordered_trans;

    rand int  m_length;
    rand byte m_payload[];

    // length between 4 and 8
    constraint length_c {
        m_length inside {[4:8]};
    }

    // array size must match length
    constraint size_c {
        m_payload.size() == m_length;
    }

    // ordering: decide length first
    constraint order_c {
        solve m_length before m_payload;
    }

    function void display();
        $display("length = %0d , payload = ", m_length);
        
        foreach (m_payload[i]) begin
        	$display("payload[%0d] = %b", i, m_payload[i]);
			
		end

    endfunction : display

endclass : ordered_trans;

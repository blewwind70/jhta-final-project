package com.es.pos.service;

import java.util.Map;

import com.es.pos.vo.TicketReceipt;

public interface RefundService {
	
	TicketReceipt findReceiptByRid(String rid);

	Map<String, Object> findReceiptInfo(String rid);
	
	void refundReceipt(TicketReceipt receipt);
}

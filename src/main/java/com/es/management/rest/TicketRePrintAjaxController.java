package com.es.management.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.es.management.service.TicketRePrintService;
import com.es.management.web.form.RidValueSaveForm;
import com.es.pos.vo.Pos;
import com.es.pos.vo.TicketReceipt;

@Controller
public class TicketRePrintAjaxController {

	@Autowired
	private TicketRePrintService ticketReprintService;
	
	@RequestMapping("/getRidSelect.esc")
	@ResponseBody
	public List<TicketReceipt> getRidSelect(String rid) {
		
		return ticketReprintService.getRidSelect(rid);
	}
	
	@RequestMapping("/getRidDetailSelect.esc")
	@ResponseBody
	public TicketReceipt getRidDetailSelect(RidValueSaveForm ridValueSaveForm) {
		
		System.out.println("카드번호" + ridValueSaveForm.getRid());
		TicketReceipt ticketReceipt = new TicketReceipt();
		Pos pos = new Pos();
		
		// pos번호 등록
		pos.setId(ridValueSaveForm.getPos());
		// 카드번호저장
		ticketReceipt.setRid((ridValueSaveForm.getRid()));
		// customer번호 저장
		ticketReceipt.setId(ridValueSaveForm.getId());
		// 포스객체 저장
		ticketReceipt.setPos(pos);
		// 구매날짜 저장
		ticketReceipt.setPurchaseDate(ridValueSaveForm.getPurchaseDate());
		
		System.out.println(ticketReceipt.getRid() + " " + ticketReceipt.getId() + " " + ticketReceipt.getPos().getId() + " " + ticketReceipt.getPurchaseDate());
		
		// 값을담은 객체를 서비스로 호출
		TicketReceipt ticketReceipt2 = ticketReprintService.getRidDetailSelect(ticketReceipt);
		
		return ticketReceipt2;
	}
}

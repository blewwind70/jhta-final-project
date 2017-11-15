package com.es.pos.web;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.es.pos.mapper.PosTestMapper;
import com.es.pos.service.RefundService;

@Controller
public class RefundController {

	@Autowired
	private RefundService refundService;
	@Autowired
	private PosTestMapper posTestMapper;
	
	@GetMapping("/refund.esc")
	public String refund() {
		return "refund";
	}
	
	@PostMapping("/searchticket.esc")
	@ResponseBody
	public Map<String, Object> search(String rid) {
		
		return null;
	}
}

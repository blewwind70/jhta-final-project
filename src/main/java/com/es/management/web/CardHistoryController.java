package com.es.management.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CardHistoryController {

	@RequestMapping("/cardHistory.esc")
	public String select() {
		return "cardHistory";
	}
}

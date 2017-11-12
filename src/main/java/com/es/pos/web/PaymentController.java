package com.es.pos.web;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.es.management.vo.CustomerType;
import com.es.management.vo.Discount;
import com.es.movie.vo.MovieTimetable;
import com.es.movie.vo.MovieTranslation;
import com.es.movie.vo.Seat;
import com.es.pos.service.MovieSelectService;
import com.es.pos.service.PaymentService;
import com.es.pos.vo.MovieSelectForm;

@Controller
public class PaymentController {
	
	@Autowired
	private MovieSelectService movieSelectService;
	@Autowired
	private PaymentService paymentService;

	@PostMapping("/payment.esc")
	public String payment(MovieSelectForm movieSelectForm, Model model) {
		MovieTranslation movieInfo = movieSelectService.findMovieInfo(movieSelectForm.getMovieId());
		MovieTimetable timetable = movieSelectService.findMovieTimetable(movieSelectForm.getTimetableId());
		
		model.addAttribute("movieInfo", movieInfo);
		model.addAttribute("timetable", timetable);
		
		String[] priceKeyIdList = movieSelectForm.getPriceKeyId().split(",");
		String[] amountKeyList = movieSelectForm.getAmount().split(",");
		
		List<Map<String, Object>> typeList = new ArrayList<Map<String, Object>>();
		for(int i=0; i<priceKeyIdList.length; i++) {
			int keyId = Integer.parseInt(priceKeyIdList[i]);
			int amount = Integer.parseInt(amountKeyList[i]);
			
			CustomerType key = movieSelectService.getPriceKeyByTypeId(keyId);
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("key", key);
			map.put("amount", amount);
			
			typeList.add(i, map);
		}
		
		model.addAttribute("typeList", typeList);
		
		List<String> seatIdList = Arrays.asList(movieSelectForm.getSeatId().split(","));
		
		List<Seat> seatList = new ArrayList<Seat>();
		int index = 0;
		for(String seatId : seatIdList) {
			Seat seat = movieSelectService.getSeatInfo(Integer.parseInt(seatId));
			
			seatList.add(index, seat);
			index ++;
		}
		model.addAttribute("seats", seatList);
		
		return "payment";
	}
	
	@GetMapping("/general.esc")
	@ResponseBody
	public List<Discount> generalDiscount() {
		return paymentService.findAllDiscounts();
	}
}

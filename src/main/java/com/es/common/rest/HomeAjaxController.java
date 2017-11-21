package com.es.common.rest;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.es.common.service.HomeMainService;
import com.es.common.vo.MonthDate;
import com.es.common.vo.MovieRankNameForm;

@Controller
public class HomeAjaxController {

	@Autowired
	private HomeMainService homeMainService; 
	
	@RequestMapping("/getMovieRankName.esc")
	@ResponseBody
	public List<MovieRankNameForm> getMovieRankName() {
		
		LocalDate now = LocalDate.now();
		
		Date startDate = Date.from(now.minusMonths(1).atStartOfDay(ZoneId.systemDefault()).toInstant());
		Date endDate = Date.from(now.minusDays(1).atStartOfDay(ZoneId.systemDefault()).toInstant());
		
		endDate.setTime(endDate.getTime()+(60*60*23+(60*59)+59)*1000);
		System.out.println(endDate);
		
		MonthDate monthDate = new MonthDate(startDate, endDate);
		
		return homeMainService.getMovieRankName(monthDate);
	}
}

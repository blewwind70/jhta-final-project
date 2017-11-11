package com.es.pos.web;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.es.management.vo.CustomerType;
import com.es.movie.vo.MovieTimetable;
import com.es.movie.vo.MovieTranslation;
import com.es.pos.service.MovieSelectService;
import com.es.util.DateUtil;

@Controller
public class PosController {
	
	@Autowired
	private MovieSelectService movieSelectService;

	@RequestMapping("/home.esc")
	public String movieSelect() {
		return "main";
	}
	
	@GetMapping("/pricekey.esc")
	@ResponseBody
	public List<CustomerType> priceKey() {
		return movieSelectService.getAllPriceKey();
	}
	
	@GetMapping("/movie.esc")
	@ResponseBody
	public List<MovieTranslation> movieList(String playingdate) {
		Date date = DateUtil.yyyymmdd(playingdate);

		return movieSelectService.findMoviesInDay(date);
	}
	
	@GetMapping("/timetable.esc")
	@ResponseBody
	public List<MovieTimetable> movieTimetable(String playingdate, int movieid) {
		Date date = DateUtil.yyyymmdd(playingdate);
		
		return movieSelectService.findMovieTimeOfMovie(date, movieid);
	}
	
	@PostMapping("/seat.esc")
	public String seat() {
		return "seat";
	}
}

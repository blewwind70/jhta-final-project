package com.es.movie.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MovieListController {
	
	@RequestMapping("/movielist.esc")
	public String movieList() {
		return "movieList";
	}
	
}

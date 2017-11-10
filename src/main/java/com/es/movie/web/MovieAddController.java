package com.es.movie.web;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.es.movie.service.AddMovieService;
import com.es.movie.vo.Genre;
import com.es.movie.vo.GenreTranslation;
import com.es.movie.vo.Movie;
import com.es.movie.vo.MovieGenre;
import com.es.movie.vo.MovieImage;
import com.es.movie.vo.MovieTranslation;
import com.es.movie.web.form.MovieForm;

@Controller
public class MovieAddController {
	
	@Autowired
	private AddMovieService addMovieService;
	
	@RequestMapping("/movieadd.esc")
	public String movieAdd() {
		return "movieAdd";
	}
	
	@RequestMapping("/add.esc")
	public String submit(@Valid MovieForm movieForm) {
		
		
		MovieTranslation movieTranslation = new MovieTranslation();
		Movie movie = new Movie();
		MovieImage movieimage = new MovieImage();
		Genre genre = new Genre();
		
		GenreTranslation genreTranslation = new GenreTranslation();
		
		BeanUtils.copyProperties(movieForm, movieTranslation );
		BeanUtils.copyProperties(movieForm, movie );
		BeanUtils.copyProperties(movieForm, movieimage );
		BeanUtils.copyProperties(movieForm, genre );
		BeanUtils.copyProperties(movieForm, genreTranslation );
		
		
		
		addMovieService.addMovies(movieTranslation, movie, movieimage, genre, movieForm.getGenre(), genreTranslation);
		
		
		return "redirect:movieadd.esc";
	}
}

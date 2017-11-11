package com.es.pos.service;

import java.util.Date;
import java.util.List;

import com.es.management.vo.CustomerType;
import com.es.movie.vo.MovieTimetable;
import com.es.movie.vo.MovieTranslation;

public interface MovieSelectService {

	List<MovieTranslation> findMoviesInDay(Date playingDate);
	List<MovieTimetable> findMovieTimeOfMovie(Date playingDate, int movieId);
	List<CustomerType> getAllPriceKey();
}

package com.es.pos.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.es.movie.vo.MovieTimetable;
import com.es.movie.vo.MovieTranslation;
import com.es.pos.mapper.PosTestMapper;

@Service
public class MovieSelectServiceImpl implements MovieSelectService {

	@Autowired
	private PosTestMapper posTestMapper;

	@Override
	public List<MovieTranslation> findMoviesInDay(Date playingDate) {
		return posTestMapper.getMoviesByDate(playingDate);
	}

	@Override
	public List<MovieTimetable> findMovieTimeOfMovie(Date playingDate, int movieId) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("playingDate", playingDate);
		map.put("movieId", movieId);
		
		return posTestMapper.getMovieTimetableByDateNMovieId(map);
	}
}

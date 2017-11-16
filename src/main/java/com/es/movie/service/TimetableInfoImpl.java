package com.es.movie.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.es.movie.mapper.MovieMapper;
import com.es.movie.vo.MovieTimetable;
import com.es.movie.vo.MovieTranslation;

@Service
public class TimetableInfoImpl implements TimeTableInfoService{
	
	@Autowired
	private MovieMapper movieMapper;

	@Override
	public List<MovieTranslation> getAllMoviesByDate(Date playingDate) {
		
		return movieMapper.getAllMoviesByDate(playingDate);
	}

	@Override
	public List<MovieTimetable> getMovieTimetableByscreenId(int timetableId) {
		
		return movieMapper.getMovieTimetableByscreenId(timetableId);
	}

	
	
	
}

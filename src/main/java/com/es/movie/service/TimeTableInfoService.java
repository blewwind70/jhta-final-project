package com.es.movie.service;

import java.util.Date;
import java.util.List;

import com.es.movie.vo.MovieTimetable;
import com.es.movie.vo.MovieTranslation;

public interface TimeTableInfoService {
	
	//특정 연/월/일에 상영하는 모든 영화 조회 (중복 제외) 
	List<MovieTranslation> getAllMoviesByDate(Date playingDate);
	
	//단순 ID로 MovieTimetable
	List<MovieTimetable> getMovieTimetableByscreenId(int timetableId);

		
}

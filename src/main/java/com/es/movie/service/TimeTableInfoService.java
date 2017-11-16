package com.es.movie.service;

import java.util.Date;
import java.util.List;

import com.es.movie.vo.MovieTimetable;
import com.es.movie.vo.MovieTranslation;

public interface TimeTableInfoService {
	
	//Ư�� ��/��/�Ͽ� ���ϴ� ��� ��ȭ ��ȸ (�ߺ� ����) 
	List<MovieTranslation> getAllMoviesByDate(Date playingDate);
	
	//�ܼ� ID�� MovieTimetable
	List<MovieTimetable> getMovieTimetableByscreenId(int timetableId);

		
}

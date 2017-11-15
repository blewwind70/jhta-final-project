package com.es.movie.service;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import com.es.movie.vo.MovieTimetable;
import com.es.movie.vo.MovieTranslation;
import com.es.movie.vo.ScreenMovie;

public interface TimetableAddService {
	// �ð�ǥ��� - ��¥�� ��ϰ��ɿ�ȭ
	List<MovieTranslation> getMovieTranslationsByDate(Date date);
	
	// �ð�ǥ��� 
	
	void addTimetable(MovieTimetable movieTimetable, ScreenMovie screenMovie);
}

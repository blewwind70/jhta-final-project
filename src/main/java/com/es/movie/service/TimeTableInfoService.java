package com.es.movie.service;

import java.util.Date;
import java.util.List;

import com.es.movie.vo.MovieTimetable;
import com.es.movie.vo.MovieTranslation;
import com.es.movie.vo.SelectTimetable;
import com.es.pos.vo.Ticket;

public interface TimeTableInfoService {
	
	//�ܼ� ID�� MovieTimetable
	List<MovieTimetable> getMovieTimetableByscreenId(int timetableId);

	
	//�ð�ǥ��ȸ  Ư�� ��/��/�Ͽ� ���ϴ� ��� ��ȭ ��ȸ (�ߺ� ����) 
	List<SelectTimetable> getAllMoviesByDate(Date playDate);
	// �ð�ǥ��ȸ ���༮
	List<Ticket> getReservedSeatsByTimetableId(int timetalbleId);
		
}

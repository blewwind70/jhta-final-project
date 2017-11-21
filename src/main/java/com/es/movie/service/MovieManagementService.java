package com.es.movie.service;

import java.util.Date;
import java.util.List;

import com.es.movie.vo.MovieTimetable;
import com.es.movie.vo.SelectTimetable;
import com.es.pos.vo.Ticket;

public interface MovieManagementService {
	
	//�󿵰���  Ư�� ��/��/�Ͽ� ���ϴ� ��� ��ȭ ��ȸ (�ߺ� ����) 
	List<SelectTimetable> getAllMoviesByDate(Date playDate);
			
	//�󿵰��� ���༮ ��ȸ
	List<Ticket> getReservedSeatsByTimetableId(int timetalbleId);
	
	//�󿵰��� ��¥�� �󿵰� ��ȸ
	List<SelectTimetable> getAllScreenNameByDate(Date playDate);
	
	//�¶���/�������ο��� ����
	void updateMovieManagement(MovieTimetable movieTimetable);
}

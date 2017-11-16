package com.es.movie.rest;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections4.map.HashedMap;
import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.es.movie.service.TimeTableInfoService;
import com.es.movie.vo.MovieTimetable;
import com.es.movie.vo.MovieTranslation;
import com.es.movie.web.form.SelectTimetable;
import com.es.pos.service.MovieSelectService;

@RestController
public class TimetableInfoAjaxController {
	
	@Autowired
	private TimeTableInfoService timeTableInfoService;
	
	@Autowired
	private MovieSelectService movieSelectService;
	
	@RequestMapping("/getTimetableInfo.esc")
	@ResponseBody
	public Map<String, Object> getMoviesByDate(Date playingDate) {
		//�����Ƽ� �����ٲ�
		List<SelectTimetable> selectTimetables = new ArrayList<SelectTimetable>();
		List<MovieTranslation> movies = timeTableInfoService.getAllMoviesByDate(playingDate);	
		for(MovieTranslation movie : movies) {
			
			// ���� ���� ��ü
			SelectTimetable selectTimetable = new SelectTimetable();
			
			// ��ȭ����  ���
			//System.out.println(movie.getName());
			selectTimetable.setTitle(movie.getName());
			
			//id������ �ٸ��ֵ� ���񽺻���ؼ� ��ȸ�ϰ� ����
			System.out.println(movie.getMovie().getId());
			int movieId = movie.getMovie().getId();
			
			List<MovieTimetable> movietimetables =  timeTableInfoService.getMovieTimetableByscreenId(movieId);
			//System.out.println(movietimetables);
			
			for(MovieTimetable movieTimetable : movietimetables) {
				//���� ī��Ʈ
				int reservedcnt = 0;
				System.out.println(movieTimetable.getId());
//				System.out.println(movieTimetable.getStartedAt());
//				System.out.println(movieTimetable.getEndedAt());
				//��ȭȸ�� ���
				selectTimetable.setOrdered(movieTimetable.getOrdered());
				//��ȭ���۽ð�
				selectTimetable.setStartedAt(movieTimetable.getStartedAt());
				//��ȭ�����½ð�
				selectTimetable.setEndedAt(movieTimetable.getEndedAt());
				//��ü�¼���
				int SeatsCount = movieTimetable.getScreenMovie().getScreen().getSeatsCount();
				selectTimetable.setSeatsCount(SeatsCount);
				//�󿵰��̸�
				selectTimetable.setName(movieTimetable.getScreenMovie().getScreen().getName()); 
				
				//Ÿ�����̺� id�̱�
				movieTimetable.getId();
				// null�ƴϸ� ���༮
				System.out.println(movieSelectService.getReservedSeatInfoInTimetable(movieTimetable.getId()));
				if(movieSelectService.getReservedSeatInfoInTimetable(movieTimetable.getId()) != null) {
					reservedcnt++;					
				}
				selectTimetable.setReservedSeatsCount(reservedcnt);
			}
			System.out.println(selectTimetable);
		}
		
		return null;	
	}
}

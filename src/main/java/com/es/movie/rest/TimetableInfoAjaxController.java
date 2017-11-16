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
		//값들담아서 보낼줄꺼
		List<SelectTimetable> selectTimetables = new ArrayList<SelectTimetable>();
		List<MovieTranslation> movies = timeTableInfoService.getAllMoviesByDate(playingDate);	
		for(MovieTranslation movie : movies) {
			
			// 값들 담을 객체
			SelectTimetable selectTimetable = new SelectTimetable();
			
			// 영화제목  담기
			//System.out.println(movie.getName());
			selectTimetable.setTitle(movie.getName());
			
			//id꺼내서 다른애들 서비스사용해서 조회하고 담음
			System.out.println(movie.getMovie().getId());
			int movieId = movie.getMovie().getId();
			
			List<MovieTimetable> movietimetables =  timeTableInfoService.getMovieTimetableByscreenId(movieId);
			//System.out.println(movietimetables);
			
			for(MovieTimetable movieTimetable : movietimetables) {
				//예약 카운트
				int reservedcnt = 0;
				System.out.println(movieTimetable.getId());
//				System.out.println(movieTimetable.getStartedAt());
//				System.out.println(movieTimetable.getEndedAt());
				//영화회차 담기
				selectTimetable.setOrdered(movieTimetable.getOrdered());
				//영화시작시간
				selectTimetable.setStartedAt(movieTimetable.getStartedAt());
				//영화끝나는시간
				selectTimetable.setEndedAt(movieTimetable.getEndedAt());
				//전체좌석수
				int SeatsCount = movieTimetable.getScreenMovie().getScreen().getSeatsCount();
				selectTimetable.setSeatsCount(SeatsCount);
				//상영관이름
				selectTimetable.setName(movieTimetable.getScreenMovie().getScreen().getName()); 
				
				//타임테이블 id뽑기
				movieTimetable.getId();
				// null아니면 예약석
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

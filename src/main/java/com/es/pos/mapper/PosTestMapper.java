package com.es.pos.mapper;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.es.employee.vo.Employee;
import com.es.management.vo.CustomerType;
import com.es.movie.vo.MovieTimetable;
import com.es.movie.vo.MovieTranslation;

public interface PosTestMapper {

	Employee getEmployeeByIdentifier(long empId);
	List<MovieTranslation> getMoviesByDate(Date playingDate);
	// HashMap으로 "playingDate", "movieId" 이름으로 담기
	List<MovieTimetable> getMovieTimetableByDateNMovieId(Map<String, Object> map);
	List<CustomerType> getAllCustomerType();
}

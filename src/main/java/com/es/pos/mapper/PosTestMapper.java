package com.es.pos.mapper;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.es.employee.vo.Employee;
import com.es.management.vo.CustomerType;
import com.es.management.vo.Discount;
import com.es.movie.vo.MovieTimetable;
import com.es.movie.vo.MovieTranslation;
import com.es.movie.vo.Seat;

public interface PosTestMapper {

	Employee getEmployeeByIdentifier(long empId);
	List<MovieTranslation> getMoviesByDate(Date playingDate);
	// HashMap으로 "playingDate", "movieId" 이름으로 담기
	List<MovieTimetable> getMovieTimetableByDateNMovieId(Map<String, Object> map);
	MovieTimetable getMovieTimetableById(int timetableId);
	// typeId = 0이면 전체 검색
	List<CustomerType> getCustomerType(int typeId);
	Seat getSeatBySeatId(int seatId);
	List<Seat> getSeatsByScreenId(int screenId);
	// discountId = 0 이면 전체검색
	List<Discount> getDiscount(int discountId);
}

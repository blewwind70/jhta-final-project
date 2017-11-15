package com.es.pos.mapper;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.es.employee.vo.Employee;
import com.es.financial.vo.CouponCustomer;
import com.es.management.vo.Customer;
import com.es.movie.vo.MovieTimetable;
import com.es.movie.vo.MovieTranslation;
import com.es.movie.vo.Seat;

public interface PosTestMapper {

	Employee getEmployeeByIdentifier(long empId);
	List<MovieTranslation> getMoviesByDate(Date playingDate);
	// HashMap으로 "playingDate", "movieId" 이름으로 담기
	List<MovieTimetable> getMovieTimetableByDateNMovieId(Map<String, Object> map);
	MovieTimetable getMovieTimetableById(int timetableId);
	Seat getSeatBySeatId(int seatId);
	List<Seat> getSeatsByScreenId(int screenId);
	List<CouponCustomer> getCouponesByCustomerId(int customerId);
	CouponCustomer getCouponCustomerById(int customerId);
	
	void updateCouponCustomerInfo(CouponCustomer couponCustomer);
	void updateCustomerInfo(Customer customer);
}
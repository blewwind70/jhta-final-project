package com.es.pos.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.es.management.mapper.CustomerMapper;
import com.es.management.vo.CustomerType;
import com.es.movie.mapper.MovieMapper;
import com.es.movie.mapper.ScreenMapper;
import com.es.movie.vo.MovieTimetable;
import com.es.movie.vo.MovieTranslation;
import com.es.movie.vo.Seat;
import com.es.pos.mapper.TicketMapper;
import com.es.pos.vo.Ticket;

@Service
public class MovieSelectServiceImpl implements MovieSelectService {

	@Autowired
	private MovieMapper movieMapper;
	@Autowired
	private ScreenMapper screenMapper;
	@Autowired
	private TicketMapper ticketMapper;
	@Autowired
	private CustomerMapper customerMapper;

	@Override
	public List<MovieTranslation> findMoviesInDay(Date playingDate) {
		return movieMapper.getMoviesByDate(playingDate);
	}

	@Override
	public List<MovieTimetable> findMovieTimeOfMovie(Date playingDate, int movieId) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("playingDate", playingDate);
		map.put("movieId", movieId);
		
		List<MovieTimetable> timetableList = movieMapper.getMovieTimetableByDateNMovieId(map);
		for(MovieTimetable timetable : timetableList) {
			int reservedSeats = ticketMapper.getReservedSeatsByTimetableId(timetable.getId()).size();
			int totalSeats = timetable.getScreenMovie().getScreen().getSeatsCount();
			
			timetable.getScreenMovie().getScreen().setSeatsCount(totalSeats - reservedSeats);
		}
		
		return timetableList;
	}

	@Override
	public List<CustomerType> getAllPriceKey() {
		return customerMapper.getKeyInAllSelect();
	}

	@Override
	public CustomerType getPriceKeyByTypeId(int typeId) {
		return customerMapper.getCustomerType(typeId).get(0);
	}
	
	@Override
	public MovieTranslation findMovieInfo(int movieId) {
		return movieMapper.getMovieTranslation(movieId);
	}
	
	@Override
	public MovieTimetable findMovieTimetable(int timetableId) {
		return movieMapper.getMovieTimetableById(timetableId);
	}
	
	@Override
	public Seat getSeatInfo(int seatId) {
		return screenMapper.getSeatBySeatId(seatId);
	}

	@Override
	public List<Seat> getSeatInfoInScreen(int screenId) {
		return screenMapper.getSeatsByScreenId(screenId);
	}

	@Override
	public List<Ticket> getReservedSeatInfoInTimetable(int timetableId) {
		return ticketMapper.getReservedSeatsByTimetableId(timetableId);
	}
}
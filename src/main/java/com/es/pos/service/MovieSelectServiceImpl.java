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
import com.es.movie.vo.MovieTimetable;
import com.es.movie.vo.MovieTranslation;
import com.es.movie.vo.Seat;
import com.es.pos.mapper.PosTestMapper;
import com.es.pos.mapper.TicketMapper;
import com.es.pos.vo.Ticket;

@Service
public class MovieSelectServiceImpl implements MovieSelectService {

	@Autowired
	private MovieMapper movieMapper;
	@Autowired
	private TicketMapper ticketMapper;
	@Autowired
	private CustomerMapper customerMapper;
	@Autowired
	private PosTestMapper posTestMapper;

	@Override
	public List<MovieTranslation> findMoviesInDay(Date playingDate) {
		return posTestMapper.getMoviesByDate(playingDate);
	}

	@Override
	public List<MovieTimetable> findMovieTimeOfMovie(Date playingDate, int movieId) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("playingDate", playingDate);
		map.put("movieId", movieId);
		
		return posTestMapper.getMovieTimetableByDateNMovieId(map);
	}

	@Override
	public List<CustomerType> getAllPriceKey() {
		return customerMapper.getCustomerType(0);
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
		return posTestMapper.getMovieTimetableById(timetableId);
	}
	
	@Override
	public Seat getSeatInfo(int seatId) {
		return posTestMapper.getSeatBySeatId(seatId);
	}

	@Override
	public List<Seat> getSeatInfoInScreen(int screenId) {
		return posTestMapper.getSeatsByScreenId(screenId);
	}

	@Override
	public List<Ticket> getReservedSeatInfoInTimetable(int timetableId) {
		return ticketMapper.getReservedSeatsByTimetableId(timetableId);
	}
}
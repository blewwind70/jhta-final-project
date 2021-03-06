package com.es.movie.mapper;

import java.util.List;

import com.es.movie.vo.Seat;
import com.es.pos.vo.Ticket;

public interface ScreenMapper {
	//id로 seat정보 조회
	Seat getSeatBySeatId(int seatId);
	
	//screenId로 모든 Seat 조회
	List<Seat> getSeatsByScreenId(int screenId);
	
	// 시간표조회 예약석 뽑기
	List<Ticket> getReservedSeatsByTimetableId(int timetalbleId);
}

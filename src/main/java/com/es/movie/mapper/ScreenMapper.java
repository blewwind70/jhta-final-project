package com.es.movie.mapper;

import java.util.List;

import com.es.movie.vo.Seat;

public interface ScreenMapper {
	//id�� seat���� ��ȸ
	Seat getSeatBySeatId(int seatId);
	
	//screenId�� ��� Seat ��ȸ
	List<Seat> getSeatsByScreenId(int screenId);
}

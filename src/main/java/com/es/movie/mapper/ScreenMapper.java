package com.es.movie.mapper;

import java.util.List;

import com.es.movie.vo.Seat;
import com.es.pos.vo.Ticket;

public interface ScreenMapper {
	//id�� seat���� ��ȸ
	Seat getSeatBySeatId(int seatId);
	
	//screenId�� ��� Seat ��ȸ
	List<Seat> getSeatsByScreenId(int screenId);
	
	// �ð�ǥ��ȸ ���༮ �̱�
	List<Ticket> getReservedSeatsByTimetableId(int timetalbleId);
}

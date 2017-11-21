package com.es.common.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.es.common.mapper.HomeMainMapper;
import com.es.common.vo.MonthDate;
import com.es.common.vo.MovieRankNameForm;

@Service
public class HomeMainImpl implements HomeMainService{

	@Autowired
	private HomeMainMapper homeMainMapper; 
	
	@Override
	public List<MovieRankNameForm> getMovieRankName(MonthDate monthDate) {
		return homeMainMapper.getMovieRankName(monthDate);
	}
}

package com.es.common.service;

import java.util.Date;
import java.util.List;

import com.es.common.vo.MonthDate;
import com.es.common.vo.MovieRankNameForm;

public interface HomeMainService {
	
	
	List<MovieRankNameForm> getMovieRankName(MonthDate monthDate);
}

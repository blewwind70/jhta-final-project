package com.es.common.mapper;

import java.util.List;

import com.es.common.vo.MonthDate;
import com.es.common.vo.MovieRankNameForm;

public interface HomeMainMapper {

	List<MovieRankNameForm> getMovieRankName(MonthDate monthDate);
}

package com.es.movie.service;

import java.util.List;

import com.es.common.vo.Criteria;
import com.es.movie.vo.GenreTranslation;
import com.es.movie.vo.Movie;
import com.es.movie.vo.MovieImage;
import com.es.movie.vo.MovieTranslation;

public interface MovieListService {
	// ��ȭ��ȸ
	   List<MovieTranslation> searchByMovieTranslation(Criteria criteria);
	   
	// ��ȭ��ȸ-��� (������)
			MovieTranslation getMovieTranslation(int id);
			MovieImage getMovieImage(int id);
			List<GenreTranslation> getGenreTranslation(int id);
			Movie getMovie(int id);
}

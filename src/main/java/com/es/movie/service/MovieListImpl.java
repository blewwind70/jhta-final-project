package com.es.movie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.es.common.vo.Criteria;
import com.es.movie.mapper.MovieMapper;
import com.es.movie.vo.GenreTranslation;
import com.es.movie.vo.Movie;
import com.es.movie.vo.MovieImage;
import com.es.movie.vo.MovieTranslation;

@Service
public class MovieListImpl implements MovieListService{
	
	@Autowired
	private MovieMapper movieMapper;
	
	// ��ȭ �˻� ��ȸ
	@Override
	public List<MovieTranslation> searchByMovieTranslation(Criteria criteria) {
		return movieMapper.searchByMovieTranslation(criteria);
	}
	
	//��ȭ ������
	@Override
	public MovieTranslation getMovieTranslation(int id) {
		return movieMapper.getMovieTranslation(id);
	}

	@Override
	public MovieImage getMovieImage(int id) {
		return movieMapper.getMovieImage(id);
	}

	@Override
	public Movie getMovie(int id) {
		return movieMapper.getMovie(id);
	}

	@Override
	public List<GenreTranslation> getGenreTranslation(int id) {
		return movieMapper.getGenreTranslation(id);
	}
	//��ȭ��ȸ - ������
	@Override
	public void updateCloseDate(int id) {
		movieMapper.updateCloseDate(id);
	}
	
}

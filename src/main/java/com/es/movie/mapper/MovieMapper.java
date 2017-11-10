package com.es.movie.mapper;

import java.util.List;

import com.es.common.vo.Criteria;
import com.es.movie.vo.Genre;
import com.es.movie.vo.GenreTranslation;
import com.es.movie.vo.Movie;
import com.es.movie.vo.MovieGenre;
import com.es.movie.vo.MovieImage;
import com.es.movie.vo.MovieTranslation;

public interface MovieMapper {
	// ��ȭ���
		void addMovieTranslation(MovieTranslation movieTranslation);
		void addMovie(Movie movie);
		void addMovieImage(MovieImage movieimage);
		void addGenre(Genre genre);
		void addMovieGenre(MovieGenre movieGenre);
		void addGenreTransalation(GenreTranslation genreTranslation);
		int getGenreSeq();
		int getMovieSeq();

	// ��ȭ��ȸ
	   List<MovieTranslation> searchByMovieTranslation(Criteria criteria);
	   
	// ��ȭ��ȸ-��� (������)
		MovieTranslation getMovieTranslation(int id);
		MovieImage getMovieImage(int id);
		List<GenreTranslation> getGenreTranslation(int id);
		Movie getMovie(int id);
		
		
		
}

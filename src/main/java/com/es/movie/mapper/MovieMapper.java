package com.es.movie.mapper;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import com.es.common.vo.Criteria;
import com.es.movie.vo.Genre;
import com.es.movie.vo.GenreTranslation;
import com.es.movie.vo.Movie;
import com.es.movie.vo.MovieGenre;
import com.es.movie.vo.MovieImage;
import com.es.movie.vo.MovieTimetable;
import com.es.movie.vo.MovieTranslation;
import com.es.movie.vo.ScreenMovie;

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

	// ��ȭ��ȸ - �˻�
	   List<MovieTranslation> searchByMovieTranslation(Criteria criteria);
	   
	// ��ȭ��ȸ-��� (������)
		MovieTranslation getMovieTranslation(int id);
		MovieImage getMovieImage(int id);
		List<GenreTranslation> getGenreTranslation(int id);
		Movie getMovie(int id);
		
	// ��ȭ��ȸ - ������
		void updateCloseDate(int id);
		
	
	// �ð�ǥ��� - ��ϰ��ɿ�ȭ��������
		List<MovieTranslation> getMovieTranslationsByDate(Date date);
	
	// �ð�ǥ��� 
		void addMovieTimetable(MovieTimetable  movieTimetable);
		void addScreenMovie(ScreenMovie screenMovie);
		int getScreenMovieSeq();

		
		
}

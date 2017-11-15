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
	// 영화등록
		void addMovieTranslation(MovieTranslation movieTranslation);
		void addMovie(Movie movie);
		void addMovieImage(MovieImage movieimage);
		void addGenre(Genre genre);
		void addMovieGenre(MovieGenre movieGenre);
		void addGenreTransalation(GenreTranslation genreTranslation);
		int getGenreSeq();
		int getMovieSeq();

	// 영화조회 - 검색
	   List<MovieTranslation> searchByMovieTranslation(Criteria criteria);
	   
	// 영화조회-모달 (상세정보)
		MovieTranslation getMovieTranslation(int id);
		MovieImage getMovieImage(int id);
		List<GenreTranslation> getGenreTranslation(int id);
		Movie getMovie(int id);
		
	// 영화조회 - 상영종료
		void updateCloseDate(int id);
		
	
	// 시간표등록 - 등록가능영화가져오기
		List<MovieTranslation> getMovieTranslationsByDate(Date date);
	
	// 시간표등록 
		void addMovieTimetable(MovieTimetable  movieTimetable);
		void addScreenMovie(ScreenMovie screenMovie);
		int getScreenMovieSeq();

		
		
}

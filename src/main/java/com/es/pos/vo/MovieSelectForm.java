package com.es.pos.vo;

public class MovieSelectForm {

	private int movieId;
	private int timetableId;
	private String priceKeyId;
	private String amount;
	private String seatId;
	
	public int getMovieId() {
		return movieId;
	}
	public void setMovieId(int movieId) {
		this.movieId = movieId;
	}
	public int getTimetableId() {
		return timetableId;
	}
	public void setTimetableId(int timetableId) {
		this.timetableId = timetableId;
	}
	public String getPriceKeyId() {
		return priceKeyId;
	}
	public void setPriceKeyId(String priceKeyId) {
		this.priceKeyId = priceKeyId;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getSeatId() {
		return seatId;
	}
	public void setSeatId(String seatId) {
		this.seatId = seatId;
	}
}

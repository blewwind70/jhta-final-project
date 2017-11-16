package com.es.movie.web.form;

import java.util.Date;

import com.es.movie.vo.Movie;
import com.es.movie.vo.Screen;
import com.es.util.TimeSerializer;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

public class SelectTimetable {
	private String title;
	@JsonSerialize(using=TimeSerializer.class)
	private Date startedAt;
	@JsonSerialize(using=TimeSerializer.class)
	private Date endedAt;
	private Integer ordered;
	private Integer seatsCount;
	private Integer reservedSeatsCount; 
	private String name;
	
	
	
	public Integer getReservedSeatsCount() {
		return reservedSeatsCount;
	}
	public void setReservedSeatsCount(Integer reservedSeatsCount) {
		this.reservedSeatsCount = reservedSeatsCount;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getStartedAt() {
		return startedAt;
	}
	public void setStartedAt(Date startedAt) {
		this.startedAt = startedAt;
	}
	public Date getEndedAt() {
		return endedAt;
	}
	public void setEndedAt(Date endedAt) {
		this.endedAt = endedAt;
	}
	public Integer getOrdered() {
		return ordered;
	}
	public void setOrdered(Integer ordered) {
		this.ordered = ordered;
	}
	public Integer getSeatsCount() {
		return seatsCount;
	}
	public void setSeatsCount(Integer seatsCount) {
		this.seatsCount = seatsCount;
	}
	@Override
	public String toString() {
		return "SelectTimetable [title=" + title + ", startedAt=" + startedAt + ", endedAt=" + endedAt + ", ordered="
				+ ordered + ", seatsCount=" + seatsCount + ", reservedSeatsCount=" + reservedSeatsCount + ", name="
				+ name + "]";
	}
	
	
	
}

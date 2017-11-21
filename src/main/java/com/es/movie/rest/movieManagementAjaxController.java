package com.es.movie.rest;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.es.movie.service.MovieManagementService;
import com.es.movie.vo.SelectTimetable;
import com.es.pos.vo.Ticket;

@RestController
public class movieManagementAjaxController {
	
	@Autowired
	private MovieManagementService movieManagementService;
	
	
	//��¥�� �󿵰� ��ȸ 
	@RequestMapping("/getMovieManagement.esc")
	@ResponseBody
	public List<SelectTimetable> getAllScreenNameByDate (Date playDate) {
		List<SelectTimetable> selectTimetables = new ArrayList<SelectTimetable>();
		selectTimetables = movieManagementService.getAllScreenNameByDate(playDate);
		//System.out.println(selectTimetables);
		
		return selectTimetables;
	}
	
	//�󿵰� �������� ��ȭ���� ��ȸ 
	@RequestMapping("/getMovieManagement2.esc")
	@ResponseBody
	public List<SelectTimetable> getAllMoviesByDate(Date playDate) {
		List<SelectTimetable> selectTimetables = new ArrayList<SelectTimetable>();
		selectTimetables = movieManagementService.getAllMoviesByDate(playDate);
		//System.out.println(selectTimetables);
		
		for(SelectTimetable selectTimetable : selectTimetables) {
			
			//System.out.println(selectTimetable);
			int selctId =selectTimetable.getId();
			
			List<Ticket> reserveds = new ArrayList<Ticket>();
			reserveds = movieManagementService.getReservedSeatsByTimetableId(selctId);
			int reservedcnt = reserveds.size();
			if( reservedcnt != 0) {
				selectTimetable.setReservedSeatsCount(reservedcnt);	
			} else {
				selectTimetable.setReservedSeatsCount(0);
			}
			
		}
		return selectTimetables;
	}
}

package com.es.movie.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.es.movie.service.TimeTableInfoService;
import com.es.movie.vo.SelectTimetable;
import com.es.movie.web.view.TimetableExcelView;

@Controller
public class TimetableInfoController {
	
	@Autowired
	private TimeTableInfoService timeTableInfoService;
	
	@RequestMapping("/timetableinfo.esc")
	public String timetableInfo() {
		return "timetableInfo";
	}
	
	
	@Autowired
	private TimetableExcelView timetableExcelView;
	
	
	public TimetableExcelView getTimetableExcelView() {
		return timetableExcelView;
	}


	public void setTimetableExcelView(TimetableExcelView timetableExcelView) {
		this.timetableExcelView = timetableExcelView;
	}


	@PostMapping("/exceldownload.esc")
	public ModelAndView timetableExcel(Date date) {
		
		
		ModelAndView mav = new ModelAndView();
		List<SelectTimetable> selectTimetables = new ArrayList<SelectTimetable>();
		selectTimetables = timeTableInfoService.getAllMoviesByDate(date);
		
		mav.addObject("dates", date);
		mav.addObject("selectTimetables", selectTimetables);
		mav.setView(timetableExcelView);
		
		return mav;
	}
}

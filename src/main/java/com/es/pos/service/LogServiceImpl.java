package com.es.pos.service;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.es.employee.mapper.EmployeeMapper;
import com.es.employee.vo.Employee;
import com.es.employee.vo.EmployeeTimetable;
import com.es.pos.mapper.PosMapper;
import com.es.pos.vo.Pos;
import com.es.pos.vo.PosLoginHistory;

@Service
public class LogServiceImpl implements LogService {

	@Autowired
	private EmployeeMapper employeeMapper;
	@Autowired
	private PosMapper posMapper;
	
	@Override
	public Employee findEmployeeById(String id, Long pwd) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("password", pwd);
		
		Employee employee = employeeMapper.getEmployeeByIdentifier(map);
		if(employee == null) {
			return null;
		}
		
		return employee;
	}

	@Override
	public PosLoginHistory enrollStartingWork(Employee employee, int posId) {
		Date now = new Date();
		
		int loginSeq = posMapper.addLoginHistorySeq();
		PosLoginHistory login = new PosLoginHistory();
		login.setId(loginSeq);
		login.setSignedIn(now);
		login.setEmployee(employee);
		
		Pos pos = posMapper.getPosById(posId);
		login.setPos(pos);
		
		EmployeeTimetable timetable = posMapper.getEmployeeTimetableByPosHistory(login);
		posMapper.addPosLoginHistory(login);
		
		if(timetable == null) {
			timetable = new EmployeeTimetable();
			timetable.setStartedAt(now);
			timetable.setEmployee(employee);
			posMapper.addEmployeeTimetable(timetable);
		}
		
		return login;
	}
	
	@Override
	public PosLoginHistory enrollFinishingWork(PosLoginHistory login) {
		Date now = new Date();
		
		login.setSignedOut(now);
		
		EmployeeTimetable timetable = posMapper.getEmployeeTimetableByPosHistory(login);
		timetable.setEndedAt(now);
		
		posMapper.updatePosLoginHistory(login);
		posMapper.updateEmployeeTimetable(timetable);
		
		return login;
	}
	
	@Override
	public EmployeeTimetable getEmployeeTimetable(PosLoginHistory loginHistory) {
		return posMapper.getEmployeeTimetableByPosHistory(loginHistory);
	}
	
	@Override
	public EmployeeTimetable enrollStartingRest(EmployeeTimetable timetable) {
		Date now = new Date();
		timetable.setRestStartedAt(now);
		
		posMapper.updateEmployeeTimetable(timetable);
		return timetable;
	}

	@Override
	public EmployeeTimetable enrollFinishingRest(EmployeeTimetable timetable) {
		Date now = new Date();
		timetable.setRestEndedAt(now);
		
		posMapper.updateEmployeeTimetable(timetable);
		return timetable;
	}
}

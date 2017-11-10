package com.es.pos.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.es.employee.vo.Employee;
import com.es.employee.vo.EmployeeTimetable;
import com.es.pos.mapper.PosMapper;
import com.es.pos.mapper.PosTestMapper;
import com.es.pos.vo.Pos;
import com.es.pos.vo.PosLoginHistory;

@Service
public class LogServiceImpl implements LogService {

	@Autowired
	private PosTestMapper posTestMapper;
	@Autowired
	private PosMapper posMapper;
	
	@Override
	public Employee findEmployeeById(long id, long pwd) {
		Employee employee = posTestMapper.getEmployeeByIdentifier(id);
		
		long noMinusPhone = Long.parseLong(employee.getPhone().replaceAll("-", ""));
		if(noMinusPhone != pwd) {
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
	public EmployeeTimetable enrollStartingRest(PosLoginHistory loginHistory) {
		EmployeeTimetable timetable = posMapper.getEmployeeTimetableByPosHistory(loginHistory);
		
		if(timetable == null) {
			throw new RuntimeException("만료된 세션입니다.");
		}
		
		if(timetable.getRestStartedAt() != null) {
			throw new RuntimeException("이미 휴식을 완료했습니다.");
		}
		
		Date now = new Date();
		timetable.setRestStartedAt(now);
		
		posMapper.updateEmployeeTimetable(timetable);
		return timetable;
	}

	@Override
	public EmployeeTimetable enrollFinishingRest(PosLoginHistory loginHistory) {
		EmployeeTimetable timetable = posMapper.getEmployeeTimetableByPosHistory(loginHistory);
		
		if(timetable == null) {
			throw new RuntimeException("만료된 세션입니다.");
		}
		
		if(timetable.getRestStartedAt() != null) {
			throw new RuntimeException("잘못된 접근입니다.");
		}
		
		Date now = new Date();
		timetable.setRestEndedAt(now);
		
		posMapper.updateEmployeeTimetable(timetable);
		return timetable;
	}
}

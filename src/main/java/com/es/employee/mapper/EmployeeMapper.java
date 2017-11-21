package com.es.employee.mapper;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.es.common.vo.Pagination;
import com.es.employee.vo.Employee;
import com.es.employee.vo.EmployeeManagement;
import com.es.employee.vo.EmployeeTimetable;
import com.es.employee.vo.JobHistory;
import com.es.employee.vo.PayHistory;

public interface EmployeeMapper {
	int readNextId();
	void insert(Employee employee);
	List<Employee> list(Pagination pagination);
	Employee read(int id);
	void update(Employee employee);
	void delete(int id);
	int readTotalRow(Pagination pagination);
	
	
	
	int readNextTimetableId();
	void registerTimetable(EmployeeTimetable timetable);
	
	
	List<Map<String, Object>> readSalaryAndWorkingHoursByIdAndDate(Map<String, Object> data);
	int readMismatchByIdAndDate(Map<String, Object> data);
	List<JobHistory> listJobHistoryByEmpId(int id);
	List<EmployeeManagement> listManagementByEmpIdAndDate(Map<String, Object> whenAndIdMap);
	List<EmployeeTimetable> listTimetableByEmpIdAndDate(Map<String, Object> whenAndIdMap);
	
	List<EmployeeManagement> listTheifRecordByEmpId(int empId);
	
	void registerTimetableManagement(EmployeeManagement management);
	EmployeeTimetable readTimetableIdByIdAndDate(Map<String, Object> whenAndIdMap);
	void updatePayHistoryEndedDate(Integer id);
	void insertPayHistory(PayHistory history);
	List<PayHistory> listPayHistoryByEmpId(Map<String, Object> timeMap);
	List<EmployeeTimetable> listTimetableByDate(Date when);
	void updateTimetable(EmployeeTimetable timetable);
	void updateManagement(EmployeeTimetable timetable);
	void insertManagement(EmployeeTimetable timetable);
	
	// id, password 이름으로 2개 담기
	Employee getEmployeeByIdentifier(Map<String, Object> map);
}

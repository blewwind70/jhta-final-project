package com.es.employee.mapper;

import java.util.List;
import java.util.Map;

import com.es.common.vo.Pagination;
import com.es.employee.vo.Employee;
import com.es.employee.vo.EmployeeManagement;
import com.es.employee.vo.EmployeeTimetable;
import com.es.employee.vo.JobHistory;

public interface EmployeeMapper {
	int readNextId();
	void insert(Employee employee);
	List<Employee> list(Pagination pagination);
	Employee read(int id);
	void update(Employee employee);
	void delete(int id);
	int readTotalRow();
	
	int readSalaryByIdAndDate(Map<String, Object> data);
	
	int readNextTimetableId();
	void registerTimetable(EmployeeTimetable timetable);
	void registerTimetableManagement(EmployeeManagement management);
	
	List<JobHistory> listJobHistoryByEmpId(int id);
	List<EmployeeManagement> listManagementByEmpIdAndDate(Map<String, Object> whenAndIdMap);
	List<EmployeeTimetable> listTimetableByEmpIdAndDate(Map<String, Object> whenAndIdMap);
}

package com.es.employee.web;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.es.common.vo.Pagination;
import com.es.employee.form.EmployeeForm;
import com.es.employee.service.EmployeeService;
import com.es.employee.vo.Employee;
import com.es.employee.vo.EmployeeManagement;
import com.es.employee.vo.EmployeeTimetable;
import com.es.employee.web.view.SalaryExcelView;
import com.es.util.TimeSerializer;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

@Controller
public class EmployeeController {
	
	@Autowired
	private EmployeeService empService;
	@Autowired
	SalaryExcelView salaryExcelView;
	
	private Map<Pagination, List<Employee>> cachedEmployeeList;
	{
		this.cachedEmployeeList = new HashMap<Pagination, List<Employee>>();
	}
	
	
	@PostMapping("/register.esc")
	public String register(@Valid EmployeeForm empForm, BindingResult result) {
		Employee employee = new Employee();
		BeanUtils.copyProperties(empForm, employee);
		employee = this.empService.register(employee);
		
		return "redirect:/employee/index.esc";
	}
	
	@PostMapping("/punish.esc")
	@ResponseBody
	public EmployeeManagement registerPunish(EmployeeManagement mng, Date date) {
		System.out.println(mng);
		if(mng.getDetail() == null || mng.getReason() == null || date == null) {
			mng.setRejected(true);
			return mng;
		}
		mng.setRejected(!this.empService.registerPunish(mng, date));
		return mng;
	}
	
	@PostMapping("/update.esc")
	@ResponseBody
	public Employee update(Employee employee) {
		this.empService.update(employee);
		return employee;
	}
	
	@GetMapping("/index.esc")
	public String index() {
		return "index";
	}
	
	@GetMapping("/search.esc")
	public String search(Pagination pagination, Model model) {
		model.addAttribute("emps", this.fetchEmployees(pagination, model));
		return "search";
	}

	@GetMapping("/detail.esc")
	@ResponseBody
	public Employee detail(int id, @JsonSerialize(using=TimeSerializer.class) Date when) {
		
		return this.empService.detail(id, when);
	}
	
	@GetMapping("/management.esc")
	public String management() {
		return "management";
	}
	
	@GetMapping("/timetable.esc")
	@ResponseBody
	public List<EmployeeTimetable> timetableList(Date when) {
		return this.empService.timetableByDate(when);
	}
	@GetMapping("/punishment.esc")
	public String punishment(Pagination pagination, Model model) {
		model.addAttribute("emps", this.fetchEmployees(pagination, model));
		return "punishment";
	}
	@GetMapping("/salary_manage.esc")
	public String salaryManage(Pagination pagination, Model model) {
		model.addAttribute("emps", this.fetchEmployees(pagination, model));
		return "salary_manage";
	}
	@PostMapping("/timetable_update.esc")
	@ResponseBody
	public EmployeeTimetable updateTimetable(EmployeeTimetable timetable) {
		System.out.println(timetable);
		this.empService.timetableUpdate(timetable);
		return timetable;
	}
	@GetMapping("/salary_excel.esc")
	public ModelAndView salaryExcel(int id, Date when) {
		Employee employee = this.empService.detail(id, when);
		ModelAndView mav = new ModelAndView();
		mav.addObject("employee", employee);
		mav.addObject("when", when);
		mav.setView(this.salaryExcelView);
		
		return mav;
	}
	
	
	
	
	
	
	/**
	 * employee 데이터 읽기
	 * @param pagination
	 * @return
	 */
	private List<Employee> fetchEmployees(Pagination pagination, Model model) {
		if(pagination.getPageNo() == null)
			pagination.setPageNo(1);
		
		String opt = pagination.getOpt();
		String keyword = pagination.getKeyword();
		if(opt != null && opt.equals("job_type")) {
			if("안내".equals(keyword))
					pagination.setKeyword("I");
			else if("티켓팅".equals(keyword))
				pagination.setKeyword("T");
			if(keyword.length() > 1)
				pagination.setKeyword("I");
		} else if (opt != null && opt.equals("id")) {
			try {
				pagination.setKeyword("" + Integer.parseInt(keyword));
			} catch(NumberFormatException ex) {
				pagination.setKeyword("" + 0);
			}
		}
		
		
		if(opt == null && cachedEmployeeList.containsKey(pagination))
			return cachedEmployeeList.get(pagination);
		
		
		List<Employee> empList = this.empService.searchEmployees(pagination);
		if(pagination.getOpt() == null)
			cachedEmployeeList.put(pagination, empList);
		
		model.addAttribute("page", pagination);
		
		return empList;
	}
	
	
	@GetMapping("/sql.esc")
	public String insertEmployee() {
		this.empService.dummy();
		
		return "index";
	}
	
}

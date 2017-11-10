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

import com.es.common.vo.Pagination;
import com.es.employee.form.EmployeeForm;
import com.es.employee.service.EmployeeService;
import com.es.employee.vo.Employee;

@Controller
public class EmployeeController {
	
	@Autowired
	private EmployeeService empService;
	
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
	public Employee detail(int id, Date when) {
		Employee employee = this.empService.detail(id, when);
		
		return employee;
	}
	
	@GetMapping("/management.esc")
	public String management() {
		return "management";
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
		if(pagination.getOpt() == null )
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

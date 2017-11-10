<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<ul class="ul-side">
	<li class="li-side">
		<h3>직원관리
			<div class="text-right-on-same-line"><i class="fa fa-angle-right"></i></div>
		</h3>
		<ul>
			<li class="${side_active eq 'register' ? 'active' : '' }"><a href="/employee/index.esc">직원 등록</a></li>
			<li class="${side_active eq 'search' ? 'active' : '' }"><a href="/employee/search.esc?pageNo=1">직원 조회</a></li>
			<li class="${side_active eq 'management' ? 'active' : '' }"><a href="/employee/management.esc">근태 관리</a></li>
			<li class="${side_active eq 'punishment' ? 'active' : '' }"><a href="/employee/punishment.esc?pageNo=1">징계 관리</a></li>
			<li class="${side_active eq 'salary' ? 'active' : '' }"><a href="/employee/salary_manage.esc?pageNo=1">급여 관리</a></li>
		</ul>
	</li>
</ul>
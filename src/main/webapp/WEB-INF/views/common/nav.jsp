<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<nav class="navbar navbar-default">
	<div class="container">
    	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
		        <li class="${nav_active eq 'management' ? 'active' :'' }"><a href="/management/informationSelect.esc"><i class="fa fa-book fa-fw"></i> 운영</a></li>
			    <li class="${nav_active eq 'movie' ? 'active' : ''}"><a href="/movie/timetableadd.esc"><i class="fa fa-film fa-fw"></i> 상영</a></li>
			    <li class="${nav_active eq 'employee' ? 'active' : ''}"><a href="/employee/index.esc"><i class="fa fa-user fa-fw"></i> 직원</a></li>
			    <li class="${nav_active eq 'financial' ? 'active' : ''}"><a href="/financial/posCalculate.esc"><i class="fa fa-pencil fa-fw"></i> 정산</a></li>
			</ul>
		</div>
</nav>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/taglibs.jsp" %>
<html>
<head>
	<title>Home</title>
	<%@ include file="/WEB-INF/views/common/head.jsp" %>
	<script src="/resources/js/employee.js"></script>
	<style>
		th {
			font-size: 0.8em;
		}
		.div-content {
			padding: 12px 20px;
		}
		
	</style>
</head>
<body>
	<c:set var="nav_active" value="employee" />
	<%@ include file="/WEB-INF/views/common/nav.jsp" %>
	<div class="row">
		<div class="col-md-2 div-side">
			<c:set var="side_active" value="management" />
			<%@ include file="/WEB-INF/views/employee/side_employee.jsp" %>
		</div>
		<div class="col-md-10">
		
			<div class="top-margin container">
				<h2 class="page-header">직원 근태관리</h2>
				<div class="box">
					<div class="row">
						<div class="col-md-1">
							<strong class="bigger-font">날짜</strong>
						</div>
						<div class="col-md-2">
							<input type="date" class="form-control"/>
						</div>
						<div class="col-md-1 col-md-offset-8">
							<a class="btn btn-default" style="float: right;"><i class="fa fa-check fa-fw"></i> 확인</a>
						</div>
					</div>
					<div class="row top-margin div-content">
						<table class="table">
							<colgroup>
								<col width="10%" />
								<col width="12%" />
								<col width="12%" />
								<col width="12%" />
								<col width="12%" />
								<col width="8%" />
								<col width="8%" />
								<col width="6.5%" />
								<col width="6.5%" />
								<col width="6.5%" />
								<col width="6.5%" />
							</colgroup>
							<tr>
								<th>이름</th>
								<th>출근시간</th>
								<th>퇴근시간</th>
								<th>휴식시작</th>
								<th>휴식끝</th>
								<th>근무시간</th>
								<th>휴식시간</th>
								<th>지각</th>
								<th>조퇴</th>
								<th>결근</th>
								<th>무단결근</th>
							</tr>
							<tr>
								<td>강감찬</td>
								<td><input type="time" class="form-control form-sm-control"/></td>
								<td><input type="time" class="form-control form-sm-control"/></td>
								<td><input type="time" class="form-control form-sm-control"/></td>
								<td><input type="time" class="form-control form-sm-control"/></td>
								<td><input type="number" class="form-control form-sm-control"/></td>
								<td><input type="number" class="form-control form-sm-control"/></td>
								<td><input type="checkbox" /></td>
								<td><input type="checkbox" /></td>
								<td><input type="checkbox" /></td>
								<td><input type="checkbox" /></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
</body>
</html>
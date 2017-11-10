<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/taglibs.jsp" %>
<html>
<head>
	<title>Home</title>
	
	<%@ include file="/WEB-INF/views/common/head.jsp" %>
	<script src="/resources/js/employee.js"></script>
	<style>
		.modal-lg {
	    max-width: 80% !important;
		width: 80% !important
		}
		.modal-content {
			padding: 16px;
		}
	</style>	
</head>
<body>
	<c:set var="nav_active" value="employee" />
	
	<%@ include file="/WEB-INF/views/common/nav.jsp" %>
	<div class="row">
		<div class="col-md-2">
			<c:set var="side_active" value="salary" />
			<%@ include file="/WEB-INF/views/employee/side_employee.jsp" %>
		</div>
		<div class="col-md-10">
			<div class="container top-margin">
				<h2 class="page-header">급여관리</h2>
				<c:set var="pageforward" value="/employee/salary_manage.esc" />
				<%@ include file="/WEB-INF/views/employee/search_employee.jsp" %>
			</div>
		</div>
	</div>
	<div id="modal-emploee-detail" class="modal fade" tabindex="-1" role="dialog" style="padding: 12px;">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">직원 상세정보</h4>
				</div>
		      	<div class="modal-body" style="padding: 12px !important; margin: 12px !important;">
					<div class="box">
						<h4 class="page-header">급여관리</h4>
						<div class="row">
							<div class="col-md-4">
								<div class="row">
									<div class="col-md-4"><input type="number" class="form-control" /></div>
									<div class="col-md-2"><p style="font-size: 1.3em;">년</p></div>
									<div class="col-md-4"><input type="number" class="form-control" /></div>
									<div class="col-md-2"><p style="font-size: 1.3em;">월</p></div>
								</div>
							</div>
							<div class="col-md-1 col-md-offset-6">
								<a class="btn btn-success"><i class="fa fa-table fa-fw"></i> 엑셀</a>
							</div>
						</div>
						<table class="table top-margin">
							<colgroup>
								<col width="10%" />
								<col width="23.3%" />
								<col width="10%" />
								<col width="23.3%" />
								<col width="10%" />
								<col width="23.3%" />
							</colgroup>
							<tr>
								<th>사원번호</th>
								<td>01011115555</td>
								<th>이름</th>
								<td>강감찬</td>
								<th>사원타입</th>
								<td>매점</td>
							</tr>
							<tr>
								<th>계좌번호</th>
								<td colspan="3">110-123-45645645</td>
								<th>시급</th>
								<td><input type="text" class="form-control" /></td>
							</tr>
						</table>
					</div>
				
					<div class="box top-margin" style="padding: 4px 8px;">
						<div class="row">
							<div class="col-md-6">
								<h4 class="page-header">근태 조회</h4>
								<table class="table">
									<colgroup>
										<col width="40%" />
										<col width="15%" />
										<col width="15%" />
										<col width="15%" />
										<col width="15%" />
									</colgroup>
									
									<tr>
										<th>최종 근무시간</th>
										<th>지각</th>
										<th>조퇴</th>
										<th>결근</th>
										<th>무단결근</th>
									</tr>
									<tr>
										<td>12</td>
										<td>1</td>
										<td>2</td>
										<td>3</td>
										<td>1</td>
									</tr>
								</table>
								<div class="text-right">
									<a class="btn btn-default"><i class="fa fa-star fa-fw"></i> 근태 점수</a>
								</div>
								
							</div>
							<div class="col-md-6">
								
								<h4 class="page-header">정산차이</h4>
								<table class="table">
									<colgroup>
										<col width="20%" />
										<col width="40%" />
										<col width="40%" />
									</colgroup>
									<tr>
										<th>체크</th>
										<th>금액</th>
										<th>날짜</th>
									</tr>
									<tr>
										<td><input type="checkbox" /></td>
										<td>-50,000</td>
										<td>2017-02-2</td>
									</tr>
								</table>
								<div class="text-right">
									<a class="btn btn-default"><i class="fa fa-check fa-fw"></i> 반영</a>
								</div>
								
							</div>
						</div>
					</div>
					<div class="box top-margin">
						<div class="row" style="padding: 4px 16px;">
							<h4 class="page-header">급여내역</h4>
							<table class="table">
								<colgroup>
									<col width="20%" />
									<col width="40%" />
									<col width="40%" />
								</colgroup>
								<tr>
									<th>보험료 (4대보험)</th>
									<td>10% 공제</td>
									<td>-10,000</td>
								</tr>
								<tr>
									<th>총액</th>
									<td></td>
									<td>72,000</td>
								</tr>
								<tr>
									<th>실수령액</th>
									<td></td>
									<td>12,000</td>
								</tr>
							</table>
						</div>
					</div>
		      	</div>
		      	<div class="modal-footer">
		        	<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
		      	</div>
	    	</div>
	  	</div>
	</div>
</body>
</html>
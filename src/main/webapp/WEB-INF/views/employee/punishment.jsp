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
			<c:set var="side_active" value="punishment" />
			<%@ include file="/WEB-INF/views/employee/side_employee.jsp" %>
		</div>
		<div class="col-md-10">
			<div class="container top-margin">
				<h2 class="page-header">징계관리</h2>
				<c:set var="pageforward" value="/employee/punishment.esc" />
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
					<div class="container top-margin">
						<div class="box">
							<h4 class="page-header">직원 징계관리</h4>
						
							<div class="row">
								<h4 class="page-headr">이력</h4>
								<table class="table">
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
										<td>1</td>
										<th>이름</th>
										<td>강감찬</td>
										<th>사원타입</th>
										<td>매점</td>
									</tr>
									<tr>
										<th>생년월일</th>
										<td>1995-05-30</td>
										<th>연락처</th>
										<td colspan="3">010-0000-0000</td>
									</tr>
									<tr>
										<th>입사일</th>
										<td>1995-05-30</td>
										<th>퇴사일</th>
										<td><input type="date" class="form-control" value="2017-02-02"/></td>
									</tr>
								</table>
							</div>
						
							<div class="text-right">
								<a class="btn btn-default"><i class="fa fa-pencil fa-fw"></i> 수정</a>
								<a class="btn btn-default"><i class="fa fa-fire fa-fw"></i> 퇴사처리</a>
							</div>
						</div>
						
						<div class="box top-margin">
							<div class="row">
								<h4 class="page-headr">징계이력</h4>
								<table class="table">
									<colgroup>
										<col width="33.3%" />
										<col width="33.3%" />
										<col width="33.3%" />
									</colgroup>
									<tr>
										<th>징계분류</th>
										<th>징계상세</th>
										<th>날짜</th>
									</tr>
									<tr>
										<td>횡령</td>
										<td>퇴근 시 금고에서 돈을 가져감</td>
										<td>2017-02-2</td>
									</tr>
								</table>
								
							</div>
							<div class="text-right">
								<a class="btn btn-default"><i class="fa fa-check fa-fw"></i> 등록</a>
							</div>
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
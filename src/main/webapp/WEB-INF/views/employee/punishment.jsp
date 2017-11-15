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
	<%@ include file="/WEB-INF/views/employee/common_view.jsp" %>
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
	
	<div id="modal-employee" class="modal fade" tabindex="-1" role="dialog" style="padding: 12px;">
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
										<td class='info' id="td-id"></td>
										<th>이름</th>
										<td class='info' id="td-name"></td>
										<th>사원타입</th>
										<td class='info' id="td-job-type"></td>
									</tr>
									<tr>
										<th>생년월일</th>
										<td class='info' id="td-birth"></td>
										<th>연락처</th>
										<td class='info' colspan="3" id="td-phone"></td>
									</tr>
									<tr>
										<th>입사일</th>
										<td class='info' id="td-hired-date"></td>
										<th>퇴사일</th>
										<td><td class="info" id="td-dismissed-date"></td></td>
									</tr>
								</table>
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
									<thead>
										
										<tr>
											<th>징계분류</th>
											<th>징계상세</th>
											<th>날짜</th>
										</tr>
									</thead>
									<tbody class='info' id="tbody-thief">
										
									</tbody>
								</table>
								
							</div>
							<div class="text-right">
								<a class="btn btn-default" id="btn-punish-register"><i class="fa fa-check fa-fw"></i> 등록</a>
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
	
	<div id="modal-punish" class="modal fade" tabindex="-1" role="dialog" style="padding: 12px;">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">징계등록</h4>
				</div>
		      	<div class="modal-body" style="padding: 12px !important; margin: 12px !important;">
		      		<div class="form-group">
		      			<label>징계분류</label>
		      			<select class="form-control" name="pdetail">
		      				<option value="T">횡령</option>
		      				<option value="O">기타</option>
		      			</select>
		      			<label>징계상세</label>
		      			<input type="text" class="form-control" name="preason"/>
		      			<label>날짜</label>
		      			<input type="date" class="form-control" name="pdate"/>
		      		</div>
		      	</div>
		      	<div class="modal-footer">
		        	<button id="btn-punish-db" class="btn btn-default btn-block"><i class="fa fa-check fa-fw">등록</i></button>
		      	</div>
	    	</div>
	  	</div>
	</div>
	
</body>
<script>
var efn = (function() {
	var emp;
	return function(empId) {
		if(empId) 
			emp = empId;
		return emp;
	};
})();
$(function() {
	$('#btn-punish-register').click(function() {
		$('#modal-punish').modal();
		
	});
	$('#btn-punish-db').click(function() {
		var pDetail = $('select[name=pdetail]').val(),
		preason = $('input[name=preason]').val(),
		pdate = $('input[name=pdate]').val();
		var data = {
			detail: pDetail,
			reason: preason,
			date: pdate,
			employeeId: efn(),
		};
		console.log(data);
		$.ajax({
			url: '/employee/punish.esc',
			type: 'post',
			dataType: 'json',
			data: data,
			success: function(management) {
				if(management.rejected) {
					alert('해당 직원은 선택된 날짜에 일한적이 없습니다');
				} else {
					alert('등록되었습니다');
				}
			}
		});
	});
});

function modalSearch(empId) {
	efn(empId);
	$.ajax({
		type: 'get',
		url: '/employee/detail.esc',
		dataType: 'json',
		async: true,
		data: {id: empId, when: moment().format('YYYY-MM-DD HH:mm:SS')},
		success: function(emp) {
			$('#td-id').text(emp.id);
			$('#td-name').text(emp.name);
			$('#td-job-type').text(emp.jobType === 'T' ? '티켓팅' : '안내');
			$('#td-birth').text(moment(emp.birth, 'x').format('YYYY-MM-DD'));
			$('#td-phone').text(emp.phone);
			$('#td-hired-date').text(moment(emp.hiredAt, 'x').format('YYYY-MM-DD'));
			if(emp.dismissedAt) $('#td-dismissed-date').text(moment(emp.dismissedAt, 'x').format('YYYY-MM-DD'));
			$tbodyTheif = $('#tbody-thief');
			var html = '';
			
			$.each(emp.theifRecords, function(index, record) {
				html = "<tr>";
				html += "<td>횡령</td>";
				html += "<td>"+record.reason+"</td>";
				html += "<td>"+(moment(record.timetable.startedAt, 'x').format('YYYY-MM-DD'))+"</td>";
				html += "</tr>";
				
				$tbodyTheif.append($(html));
			});
			
			
			$('#modal-employee').modal();
		}
	});
}
</script>
</html>
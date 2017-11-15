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
		
		.container {
			padding: 0px !important;
			margin: 0px !important;
		}
		.p-container {
			margin: 0px 24px;
		}
		.form-sm-control {
			font-size: 0.8em !important;
			width: 90% !important;
		}
	</style>
</head>
<body>
	<c:set var="nav_active" value="employee" />
	<%@ include file="/WEB-INF/views/common/nav.jsp" %>
	<%@ include file="/WEB-INF/views/employee/common_view.jsp" %>
	
	<div class="row">
		<div class="col-md-2 div-side">
			<c:set var="side_active" value="management" />
			<%@ include file="/WEB-INF/views/employee/side_employee.jsp" %>
		</div>
		<div class="col-md-10">
			<div class="top-margin p-container">
				<h2 class="page-header">직원 근태관리</h2>
				<div class="box">
					<div class="row">
						<div class="col-md-1">
							<strong class="bigger-font">날짜</strong>
						</div>
						<div class="col-md-2">
							<input id="input-date" type="date" class="form-control"/>
						</div>
						<div class="col-md-1">
							<a class="btn btn-default" id="btn-search">조회</a>
						</div>
						<div class="col-md-1 col-md-offset-7">
							<a id="btn-update" class="btn btn-default" style="float: right;"><i class="fa fa-check fa-fw"></i> 확인</a>
						</div>
					</div>
					<div class="row top-margin div-content">
						<table class="table">
							<colgroup>
								<col width="4%" />
								<col width="6%" />
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
							<thead>
								<tr>
									<th>갱신</th>
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
							</thead>
							<tbody class="info" id="tbody-timetable">
							
							</tbody>
							
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
</body>

<script>
	$(function() {
		
		
		$tbody = $('#tbody-timetable');
		$('#btn-search').click(function() {
			fetchEmp();
		});
		
		$('#btn-update').click(function() {
			
			$cks = $('.ck-update:checked');
			if($cks.length == 0)
				alert('선택된 직원이 없습니다, 갱신 체크박스를 클릭해주세요');
			
			$.each($cks, function(index, $ck) {
				$ck = $($ck);
				var $tr = $ck.parent().parent();
				
				var date = $('#input-date').val();
				
				var startedAt = $tr.find('.input-started-at').val(),
				endedAt = $tr.find('.input-ended-at').val(),
				restStartedAt = $tr.find('.input-rest-started-at').val(),
				restEndedAt = $tr.find('.input-rest-ended-at').val();
				
				if(startedAt !== '')
					startedAt = date+' '+startedAt+':00';
				if(endedAt !== '')
					endedAt = date+' '+endedAt+':00';
				if(restStartedAt !== '')
					restStartedAt = date+' '+restStartedAt+':00';
				if(restEndedAt !== '')
					restEndedAt = date+' '+restEndedAt+':00';
				
				var data = {
					employeeId: $tr.attr('eid'),
					id: $tr.attr('tid'),
					startedAt: startedAt,
					endedAt: endedAt,
					restStartedAt: restStartedAt,
					restEndedAt: restEndedAt,
					managementId: $tr.attr('mid'),
					managementDetail: $tr.find('input.ck-manage:checked').val()
				};
				
				$.ajax({
					url: '/employee/timetable_update.esc',
					type: 'post',
					dataType: 'json',
					data: data,
					success: function(result) {
						alert('업데이트 되었습니다');
					}
				});
				
			});
			
			
		});
		
		
		fetchEmp();
		function fetchEmp() {
			$tbody.empty();
			var date = $('#input-date').val();
			
			if(date === '') {
				date = moment().format('YYYY-MM-DD');
				$('#input-date').val(date);
			}
			
			$.ajax({
				type: 'get',
				url: '/employee/timetable.esc',
				dataType: 'json',
				data: {when: date+' 00:00:00'},
				success: function(timetables) {
					
					$.each(timetables, function(index, timetable) {
						var eemp = timetable.employee;
						var detail = '';
						var management = timetable.management;
						var mid = 0, tid = timetable.id, eid = eemp.id;
						if(management) {
							mid = management.id;
							detail = management.detail;
						}
						
						var workHour = (moment(timetable.endedAt).unix() - moment(timetable.startedAt).unix()) / (60 * 60);
						
						
						var restHour = (moment(timetable.restEndedAt).unix() - moment(timetable.restStartedAt).unix()) / (60 * 60);
						
						if(workHour)
							workHour = workHour.toFixed(2);
						else workHour = 0;
						
						if(restHour)
							restHour = restHour.toFixed(2);
						else
							restHour = 0;
						
						
						var html = "<tr mid='"+mid+"' tid='"+tid+"' eid='"+eid+"'>";
						html += "<td><input class='ck-update' type='checkbox'/></td>"
						html += "<td>"+eemp.name+"</td>"
						html += "<td><input class='input-started-at' value='"+(timetable.startedAt ? moment(timetable.startedAt).format('HH:mm') : '')+"' type='time' class='form-control form-sm-control'/></td>"
						html += "<td><input class='input-ended-at' value='"+(timetable.endedAt ? moment(timetable.endedAt).format('HH:mm') : '')+"' type='time' class='form-control form-sm-control'/></td>"
						html += "<td><input class='input-rest-started-at' value='"+(timetable.restStartedAt ? moment(timetable.restStartedAt).format('HH:mm') : '')+"' type='time' class='form-control form-sm-control'/></td>"
						html += "<td><input class='input-rest-ended-at' value='"+(timetable.restEndedAt ? moment(timetable.restEndedAt).format('HH:mm') : '')+"' type='time' class='form-control form-sm-control'/></td>"
						html += "<td><input value='"+workHour+"' type='number' class='form-control form-sm-control'/></td>"
						html += "<td><input value='"+restHour+"' type='number' class='form-control form-sm-control'/></td>"
						html += "<td><input class='ck-manage' name='management-"+index+"' value='L' type='radio' "+(detail === 'L' ? 'checked' : '')+"/></td>"
						html += "<td><input class='ck-manage' name='management-"+index+"' value='E' type='radio' "+(detail === 'E' ? 'checked' : '')+"/></td>"
						html += "<td><input class='ck-manage' name='management-"+index+"' value='A' type='radio' "+(detail === 'A' ? 'checked' : '')+"/></td>"
						html += "<td><input class='ck-manage' name='management-"+index+"' value='U' type='radio' "+(detail === 'U' ? 'checked' : '')+"/></td>"
						html += "</tr>";
						
						$tbody.append(html);
					});
					
				}
			});
			
		}
	});
</script>
</html>
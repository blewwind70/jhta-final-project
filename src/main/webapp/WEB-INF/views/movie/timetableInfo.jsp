<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/taglibs.jsp" %>
<html>
<head>
	<title>시간표 조회</title>
	
	<%@ include file="/WEB-INF/views/common/head.jsp" %>	
</head>
<body>
	<c:set var="nav_active" value="movie" />	
	<%@ include file="/WEB-INF/views/common/nav.jsp" %>
	<div class="row">
		<div class="col-md-2">
			<c:set var="side_active" value="m1two" />
			<%@ include file="/WEB-INF/views/movie/common/side_movie.jsp" %>		
		</div>
		<div class="col-md-10">
		 	
			<div class="container top-margin">
				<h2 class="page-header">시간표 조회</h2>
				 
				 <form method="post" action="exceldownload.esc" class="form-horizontal">
				 	<div class= "form-group">
						<label class="control-label col-sm-1">일자선택 </label> 
						<div class="col-sm-3">
							<input type="date" class="form-control" id="select-dates" name = "date"/>
						</div>
						<div class="col-sm-1 col-sm-offset-7">
							<button type="submit" id="btn-excel"class="btn btn-success form-control" ><i class="fa fa-table fa-fw"></i> 엑셀</button>
						</div>
					</div>
				 </form>

				<div class="box">
				<table class="table table-bordered" style="text-align: center">
					<colgroup>
						<col width="12.5%"/>
						<col width="12.5%"/>
						<col width="12.5%"/>
						<col width="17%"/>
						<col width="17%"/>
						<col width="9.5%"/>
						<col width="9.5%"/>
						<col width="9.5%"/>
					</colgroup>
					<thead>
						<tr>
							<th>상영관</th>
							<th>회차</th>
							<th>영화명</th>
							<th>시작시간</th>
							<th>종료시간</th>
							<th>예매석</th>
							<th>잔여석</th>
							<th>전체좌석</th>
						</tr>
					</thead>
					<tbody id="main-tbody">
						
						
					</tbody>
				</table>
				</div>
			</div>
		
		
	</div>
 </div>
	
</body>
<script>
$(function() {
	$('#btn-excel').click(function(e) {
		e.preventDefault();
		if($("#select-dates").val() == "") {
			alert("먼저 날짜를 선택하세요.")
		} else {
			$(this).closest("form").submit();
		}
	})
	
	$('#select-dates').on("change", function(){
		var selectDate = $(this).val()
		console.log(selectDate)
		
	 	$.ajax({
			type: "GET",
        	url: "getTimetableInfo.esc",
        	data:{playDate: selectDate},
        	dataType: "json",
        	success:function(result) {
        		var html = "";
        		console.log(result);
        		$.each(result, function(index, item){	
        			html += "<tr>"
        			html += "<td>"+item.screenName+"</td>"
        			html += "<td>"+item.ordered+"</td>"
        			html += "<td>"+item.title+"</td>"
        			html += "<td>"+item.startedAt+"</td>"
        			html += "<td>"+item.endedAt+"</td>"
        			html += "<td>"+item.reservedSeatsCount+"</td>"
        			html += "<td>"+(item.seatsCount - item.reservedSeatsCount)+"</td>"
        			html += "<td>"+item.seatsCount+"</td>"        			
        			html += "</tr>"
        		})
        		$("#main-tbody").html(html)
        	}
		})  
	})
	
})
</script>
</html>
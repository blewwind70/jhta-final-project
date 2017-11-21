<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/taglibs.jsp"%>
<html>
<head>
<title>상영관리</title>

<%@ include file="/WEB-INF/views/common/head.jsp"%>
<style>
th {
	text-align: center;
}

.switch {
	position: relative;
	display: inline-block;
	width: 50px;
	height: 26px;
}

.switch input {
	display: none;
}

.slider {
	position: absolute;
	cursor: pointer;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: gray;
	transition: .4s;
}

.slider:before {
	position: absolute;
	content: "";
	height: 19px;
	width: 19px;
	left: 2px;
	bottom: 4px;
	background-color: white;
	transition: .4s;
}

input:checked+.slider {
	background-color: dodgerblue;
}

input:checked+.slider:before {
	transform: translateX(26px);
}
</style>
</head>
<body>
	<c:set var="nav_active" value="movie" />
	<%@ include file="/WEB-INF/views/common/nav.jsp"%>
	<div class="row">
		<div class="col-md-2">
			<c:set var="side_active" value="m2two" />
			<%@ include file="/WEB-INF/views/movie/common/side_movie.jsp"%>
		</div>
		<div class="col-md-10">

			<div class="container top-margin">
				<h2 class="page-header">상영 관리</h2>

				<form id="form-update" class="form-inline" action="updatetimetable.esc" method="post" style="margin-top: 40px;" >
					<div class="form-group" style="margin-left: 20px;">
						<label>일자선택 </label> 
						<input type="date" class="form-control" id="select-date" name="dates" />
					</div>
					<div class="form-group" style="margin-left: 30px" id="ordered-box">
						<label>상영관</label> 
						<select class="form-control" id="ordered-list">
						
						</select>
					</div>
				
				<hr />
					<div class="box">
						<table class="table table-bordered" style="text-align: center">
							<colgroup>
								<col width="10%" />
								<col width="15%" />
								<col width="15%" />
								<col width="15%" />
								<col width="15%" />
								<col width="15%" />
								<col width="15%" />
							</colgroup>
							<thead>
								<tr>
									<th>회차</th>
									<th>영화명</th>
									<th>시작시간</th>
									<th>종료시간</th>
									<th>예매현황</th>
									<th>인터넷예매</th>
									<th>현장예매</th>
								</tr>
							</thead>
							<tbody class="mainTbody">
								<tr>
									<td>-</td>
									<td>-</td>
									<td>-</td>
									<td>-</td>
									<td>-</td>
									<td>-</td>
									<td>-</td>
								</tr>	
							</tbody>
						</table>
						<div style="text-align: right; margin-left: 900px;">
							<button type="submit" class="btn btn-primary" id="save-btn">
								<i class="fa fa-user-plus fa-fw fa-fw"></i>저장
							</button>
						</div>
					</div>
				</form>
			</div>

		</div>
	</div>

</body>
<script>
$(function(){
    /* $("[name='mycheckbox']").bootstrapSwitch(); */
    $("#ordered-box").hide()
    
    $('#save-btn').click(function(e) {
		e.preventDefault()
		if(confirm("저장하시겠습니까?")){
			alert("저장되었습니다.")
		}
		$('#form-update').submit()
	})
    
    
    
    // 날짜선택 상영관 조회
    $('#select-date').on('change', function() {
		//console.log($(this).val())
		var selectDate = $(this).val()
		$("#ordered-box").show()
		$.ajax({
			type:"GET",
			url : "getMovieManagement.esc",
			data:{playDate: selectDate},
			dataType: "json",
			success: function(result) {
				console.log(result)
				var html = "";
					html+= "<option>선택</option>"
				$.each(result, function(index, item) {
					html+= "<option value="+item.screenName+">"+item.screenName+"</option>"
				})
				$("#ordered-list").html(html);
			}
		})
	})
	
	
	
	// 상영관선택 영화정보 조회
	$('#ordered-list').on('change',function(){
// 		console.log($("#select-date").val())
// 		console.log($("#ordered-list option:selected").val())
		
		var selectDate = $("#select-date").val()
 		var selectScreen = $("#ordered-list option:selected").val()
 		
//  		var checkValue = $("input:checkbox[name='onlineCheck']").val()
		
		$.ajax({
			type:"GET",
			url : "getMovieManagement2.esc",
			data:{playDate: selectDate},
			dataType: "json",
			success: function(result) {
				console.log(result)
				var html = "";
				var count = 0;
				$.each(result, function(index, item) {
// 					console.log(selectScreen)
// 					console.log(item.screenName)
					
					if( selectScreen == item.screenName) {
						
// 						console.log(item.id)
						html+= "<tr>"
						html+= "<input type='hidden' value='"+item.id+"' name='timetableList["+count+"].id'>"
						html+= "<td>"+item.ordered+"</td>"
						html+= "<td>"+item.title+"</td>"
						html+= "<td>"+item.startedAt+"</td>"
						html+= "<td>"+item.endedAt+"</td>"
						html+= "<td>"+item.reservedSeatsCount+"</td>"
						if (item.onlinePurchase == 1) {
							html+= "<td><label class='switch'>"
							html+= "<input type='checkbox' value='"+item.onlinePurchase+"' name='timetableList["+count+"].onlinePurchase' id='"+item.id+"' checked><span class='slider'></span>"
							html+= "</label></td>"	
						} else {
							html+= "<td><label class='switch'>"
								html+= "<input type='checkbox' value='"+item.onlinePurchase+"' name='timetableList["+count+"].onlinePurchase' id='"+item.id+"'><span class='slider'></span>"
								html+= "</label></td>"	
						}
						if (item.offlinePurchase == 1) {
							html+= "<td><label class='switch'>"
							html+= "<input type='checkbox' value='"+item.offlinePurchase+"' name='timetableList["+count+"].offlinePurchase' id='"+item.id+"' checked><span class='slider'></span>"
							html+= "</label></td>"				
						} else {
							html+= "<td><label class='switch'>"
							html+= "<input type='checkbox' value='"+item.offlinePurchase+"' name='timetableList["+count+"].offlinePurchase' id='"+item.id+"'><span class='slider'></span>"
							html+= "</label></td>"	
						}
						html+= "</tr>"
						count++;
					}
				})
				$(".mainTbody").html(html);
			}
		})
	})
	

	
	
	
})
</script>
</html>
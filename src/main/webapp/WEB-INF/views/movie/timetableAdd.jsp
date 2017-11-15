<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/taglibs.jsp" %>
<html>
<head>
	<title>시간표 등록</title>
	
	<%@ include file="/WEB-INF/views/common/head.jsp" %>
	<style>
        .auditorium {
            text-align: center;
        }
         {
        	width: 128px;
        }
        
        .movielist {
            overflow:hidden;
            text-overflow:ellipsis;
            white-space:nowrap;
        }
        input {text-align: center;}
        
    </style>
</head>
<body>
	<c:set var="nav_active" value="movie" />
	
	<%@ include file="/WEB-INF/views/common/nav.jsp" %>
	<div class="row">
		<div class="col-md-2">
			<c:set var="side_active" value="m1one" />
			<%@ include file="/WEB-INF/views/movie/common/side_movie.jsp" %>
		</div>
		<div class="col-md-10">
			<div class="container top-margin">
			 <h2 class="page-header">시간표 등록</h2>
				<div style="text-align: right;">
					
				</div>
				<form class="form-inline" action="movietimetableadd.esc" method="post" >
					<div class="form-group">
						<label for=dates>일자선택</label> 
						<input type="date" class="form-control" id="select-date" name="dates" />
					</div>
					<div class="form-group" style="text-align: right;">
						<a class="btn btn-primary" id="btn-add-row"><i class="fa fa-user-plus fa-fw fa-fw"></i>회차추가</a>
						<a class="btn btn-danger" id="btn-delete-row"><i class="fa fa-trash fa-fw"></i>회차삭제</a>				
					</div>
					<div class="box" style="overflow: auto; margin-top: 20px;">
					<table id="movie-table" class="table table-bordered"
						style="text-align: center">
						<colgroup>
							<col width="5%"/>
							<col width="19%"/>
							<col width="19%"/>
							<col width="19%"/>
							<col width="19%"/>
							<col width="19%"/>
						</colgroup>
						<thead>
							<tr>
								<th></th>
								<th class="auditorium" >1관: 
									<select class="movie-list" name="screen1">
										<option value=""></option>
									</select>
								</th>
								<th class="auditorium" >2관: 
									<select class="movie-list"  name="screen2">
										<option value=""></option>
									</select>
								</th>
								<th class="auditorium" >3관 
									<select class="movie-list" name="screen3">
										<option value=""></option>
									</select>
								</th>
								<th class="auditorium" >4관 
									<select class="movie-list" name="screen4">
										<option value=""></option>
									</select>
								</th>
							</tr>
							
						</thead>
						<tbody>
						
							<tr>
								<td class="ordered">1회차</td>

								<td>
									
									<input type="hidden" id="" value="1" name="tables[1][0].ordered">
									<div class="form-group">
										<label>광고시작시간</label> 
										<input type="time" id="adv-time-1-1" class="form-control adv-start-time"  name="tables[1][0].startedAt"/>
									</div>
									<div class="form-group">
										<label>영화시작시간</label> 
										<input type="time" id="start-time-1-1" class="form-control movie-start-time" />
									</div>
									<div class="form-group">
										<label>영화상영시간</label> 
										<input type="text" id="play-time-1-1" class="form-control" style="width: 128px;" value="120분" />
									</div>
									<div class="form-group">
										<label>영화종료시간</label> 
										<input type="time" id="end-time-1-1"	class="form-control movie-end-time" name="tables[1][0].endedAt" />
									</div>
								</td>

								<td>
									<input type="hidden" id="" value="1" name="tables[2][0].ordered">
									<div class="form-group">
										<label>광고시작시간</label> 
										<input type="time" id="adv-time-1-2" class="form-control adv-start-time" name="tables[2][0].startedAt"/>
									</div>
									<div class="form-group">
										<label>영화시작시간</label> 
										<input type="time" id="start-time-1-2" class="form-control movie-start-time" />
									</div>
									<div class="form-group">
										<label>영화상영시간</label> 
										<input type="text" id="play-time-1-2" class="form-control" style="width: 128px;" value="120분" />
									</div>
									<div class="form-group">
										<label>영화종료시간</label> 
										<input type="time" id="end-time-1-2"	class="form-control movie-end-time" name="tables[2][0].endedAt"/>
									</div>
								</td>

								<td>
									<input type="hidden" id="" value="1" name="tables[3][0].ordered">
									<div class="form-group">
										<label>광고시작시간</label> 
										<input type="time" id="adv-time-1-3" class="form-control adv-start-time" name="tables[3][0].startedAt"/>
									</div>
									<div class="form-group">
										<label>영화시작시간</label> 
										<input type="time" id="start-time-1-3" class="form-control movie-start-time" />
									</div>
									<div class="form-group">
										<label>영화상영시간</label> 
										<input type="text" id="play-time-1-3" class="form-control" style="width: 128px;" value="120분" />
									</div>
									<div class="form-group">
										<label>영화종료시간</label> 
										<input type="time" id="end-time-1-3"	class="form-control movie-end-time" name="tables[3][0].endedAt"/>
									</div>
								</td>

								<td>
									<input type="hidden" id="" value="1" name="tables[4][0].ordered">
									<div class="form-group">
										<label>광고시작시간</label> 
										<input type="time" id="adv-time-1-4" class="form-control adv-start-time" name="tables[4][0].startedAt"/>
									</div>
									<div class="form-group">
										<label>영화시작시간</label> 
										<input type="time" id="start-time-1-4" class="form-control movie-start-time" />
									</div>
									<div class="form-group">
										<label>영화상영시간</label> 
										<input type="text" id="play-time-1-4" class="form-control" style="width: 128px;" value="120분" />
									</div>
									<div class="form-group">
										<label>영화종료시간</label> 
										<input type="time" id="end-time-1-4"	class="form-control movie-end-time" name="tables[4][0].endedAt"/>
									</div>
								</td>
								
							</tr>
							<!-- <tr>
								<td class="ordered">2회차	</td>
								<td>
									<input type="hidden" id="" value="2" name="tables[1][1].ordered">
									<div class="form-group">
										<label>광고시작시간</label> 
										<input type="time" id="adv-time-1-1" class="form-control adv-start-time"  name="tables[1][1].startedAt"/>
									</div>
									<div class="form-group">
										<label>영화시작시간</label> 
										<input type="time" id="start-time-1-1" class="form-control movie-start-time" />
									</div>
									<div class="form-group">
										<label>영화상영시간</label> 
										<input type="text" id="play-time-1-1" class="form-control" style="width: 128px;" value="120분" />
									</div>
									<div class="form-group">
										<label>영화종료시간</label> 
										<input type="time" id="end-time-1-1"	class="form-control movie-end-time" name="tables[1][1].endedAt" />
									</div>
								</td>

								<td>
									<input type="hidden" id="" value="2" name="tables[2][1].ordered">
									<div class="form-group">
										<label>광고시작시간</label> 
										<input type="time" id="adv-time-1-2" class="form-control adv-start-time" name="tables[2][1].startedAt"/>
									</div>
									<div class="form-group">
										<label>영화시작시간</label> 
										<input type="time" id="start-time-1-2" class="form-control movie-start-time" />
									</div>
									<div class="form-group">
										<label>영화상영시간</label> 
										<input type="text" id="play-time-1-2" class="form-control" style="width: 128px;" value="120분" />
									</div>
									<div class="form-group">
										<label>영화종료시간</label> 
										<input type="time" id="end-time-1-2"	class="form-control movie-end-time" name="tables[2][1].endedAt"/>
									</div>
								</td>

								<td>
									<input type="hidden" id="" value="2" name="tables[3][1].ordered">
									<div class="form-group">
										<label>광고시작시간</label> 
										<input type="time" id="adv-time-1-3" class="form-control adv-start-time" name="tables[3][1].startedAt"/>
									</div>
									<div class="form-group">
										<label>영화시작시간</label> 
										<input type="time" id="start-time-1-3" class="form-control movie-start-timel" />
									</div>
									<div class="form-group">
										<label>영화상영시간</label> 
										<input type="text" id="play-time-1-3" class="form-control" style="width: 128px;" value="120분" />
									</div>
									<div class="form-group">
										<label>영화종료시간</label> 
										<input type="time" id="end-time-1-3"	class="form-control movie-end-time" name="tables[3][1].endedAt"/>
									</div>
								</td>

								<td>
									<input type="hidden" id="" value="2" name="tables[4][1].ordered">
									<div class="form-group">
										<label>광고시작시간</label> 
										<input type="time" id="adv-time-1-4" class="form-control adv-start-time" name="tables[4][1].startedAt"/>
									</div>
									<div class="form-group">
										<label>영화시작시간</label> 
										<input type="time" id="start-time-1-4" class="form-control movie-start-time" />
									</div>
									<div class="form-group">
										<label>영화상영시간</label> 
										<input type="text" id="play-time-1-4" class="form-control" style="width: 128px;" value="120분" />
									</div>
									<div class="form-group">
										<label>영화종료시간</label> 
										<input type="time" id="end-time-1-4"	class="form-control movie-end-time" name="tables[4][1].endedAt"/>
									</div>
								</td>
								
							</tr> -->

						</tbody>
					</table>
					
				  </div>

				<div style="text-align: right">
					
					<button type="submit" class="btn btn-primary" id="timetable-add-button" >
						<i class="fa fa-user-plus fa-fw fa-fw"></i>등록
					</button>
				</div>
				</form>

			</div>
		</div>
	</div>
	
</body>
<script>
$(function(){
	var ordered = 1;  //회차 
	var tablecnt =0;
	
	$('#select-date').on("change", function(){
		var selectDate = $(this).val()
		console.log(selectDate)
		
	 	$.ajax({
			type: "GET",
        	url: "getMovieTranslationsByDate.esc",
        	data:{date: selectDate},
        	dataType: "json",
        	success:function(result) {
        		var html = "";
        		console.log(result);
        		$.each(result, function(index, item){
        			
        			html += "<option value="+item.id+">"+item.name+"</option>"
        			
        		})
        		$(".movie-list").html(html)
        	}
		})  
	})
	
	

	
  $("input.adv-start-time").on("change", function() {
	  var advTime = $(this).val();
	  
	  var startTime = $(this).closest("td").find("input.movie-start-time").val(moment(advTime, 'HH:mm').add(10, 'm').format('HH:mm'));
	  var endTime = $(this).closest("td").find("input.movie-end-time") .val(moment(advTime, 'HH:mm').add(130, 'm').format('HH:mm'));
  });
	
  $("#movie-table tbody").on("change", "input.adv-start-time", function() {
	  var advTime = $(this).val();
	  
	  var startTime = $(this).closest("td").find("input.movie-start-time").val(moment(advTime, 'HH:mm').add(10, 'm').format('HH:mm'));
	  var endTime = $(this).closest("td").find("input.movie-end-time") .val(moment(advTime, 'HH:mm').add(130, 'm').format('HH:mm'));
  });
	
  $('#btn-add-row').click(function() {
	  ordered += 1;
	  tablecnt += 1;
      var html = "";
      html += '<tr>';
      html += '<td>'+ordered+'회차</td>';
      html += '<td>';
      html += '<input type="hidden" id="" value="'+ordered+'" name="tables[1]['+tablecnt+'].ordered">';
      html += '<div class="form-group">';
      html += '<label>광고시작시간</label>';
      html += '<input type="time" id="adv-time-'+ordered+'-1" class="form-control adv-start-time" name="tables[1]['+tablecnt+'].startedAt"/>';
      html += '</div>';
      html += '<div class="form-group">';
      html += '<label>영화시작시간</label>';
      html += '<input type="time" id="start-time-'+ordered+'-1" class="form-control movie-start-time" />';
      html += '</div>';
      html += '<div class="form-group">';
      html += '<label>영화상영시간</label>';
      html += '<input type="text" id="play-time-'+ordered+'-1" class="form-control" style="width: 128px;" value="120분" />';
      html += '</div>';
      html += '<div class="form-group">';
      html += '<label>영화종료시간</label>';
      html += '<input type="time" id="end-time-'+ordered+'-1" class="form-control movie-end-time" name="tables[1]['+tablecnt+'].endedAt"/>';
      html += '</div>';
      html += '</td>';
      html += '<td>';
      html += '<input type="hidden" id="" value="'+ordered+'" name="tables[2]['+tablecnt+'].ordered">';
      html += '<div class="form-group">';
      html += '<label>광고시작시간</label>';
      html += '<input type="time" id="adv-time-'+ordered+'-2" class="form-control adv-start-time" name="tables[2]['+tablecnt+'].startedAt"/>';
      html += '</div>';
      html += '<div class="form-group">';
      html += '<label>영화시작시간</label>';
      html += '<input type="time" id="start-time-'+ordered+'-2" class="form-control movie-start-time" />';
      html += '</div>';
      html += '<div class="form-group">';
      html += '<label>영화상영시간</label>';
      html += '<input type="text" id="play-time-'+ordered+'-2" class="form-control" style="width: 128px;" value="120분" />';
      html += '</div>';
      html += '<div class="form-group">';
      html += '<label>영화종료시간</label>';
      html += '<input type="time" id="end-time-'+ordered+'-2" class="form-control movie-end-time"  name="tables[2]['+tablecnt+'].endedAt"/>';
      html += '</div>';
      html += '</td>';
      html += '<td>';
      html += '<input type="hidden" id="" value="'+ordered+'" name="tables[3]['+tablecnt+'].ordered">';
      html += '<div class="form-group">';
      html += '<label>광고시작시간</label>';
      html += '<input type="time" id="adv-time-'+ordered+'-3" class="form-control adv-start-time" name=tables[3]['+tablecnt+'].startedAt" />';
      html += '</div>';
      html += '<div class="form-group">';
      html += '<label>영화시작시간</label>';
      html += '<input type="time" id="start-time-'+ordered+'-3" class="form-control movie-start-time" />';
      html += '</div>';
      html += '<div class="form-group">';
      html += '<label>영화상영시간</label>';
      html += '<input type="text" id="play-time-'+ordered+'-3" class="form-control" style="width: 128px;" value="120분" />';
      html += '</div>';
      html += '<div class="form-group">';
      html += '<label>영화종료시간</label>';
      html += '<input type="time" id="end-time-'+ordered+'-3" class="form-control movie-end-time" name="tables[3]['+tablecnt+'].endedAt" />';
      html += '</div>';
      html += '</td>';
      html += '<td>';
      html += '<input type="hidden" id="" value="'+ordered+'" name="tables[4]['+tablecnt+'].ordered">';
      html += '<div class="form-group">';
      html += '<label>광고시작시간</label>';
      html += '<input type="time" id="adv-time-'+ordered+'-4" class="form-control adv-start-time" name=tables[4]['+tablecnt+'].startedAt"/>';
      html += '</div>';
      html += '<div class="form-group">';
      html += '<label>영화시작시간</label>';
      html += '<input type="time" id="start-time-'+ordered+'-4" class="form-control movie-start-time" />';
      html += '</div>';
      html += '<div class="form-group">';
      html += '<label>영화상영시간</label>';
      html += '<input type="text" id="play-time-'+ordered+'4" class="form-control" style="width: 128px;" value="120분" />';
      html += '</div>';
      html += '<div class="form-group">';
      html += '<label>영화종료시간</label>';
      html += '<input type="time" id="end-time-'+ordered+'-4" class="form-control movie-end-time" name="tables[4]['+tablecnt+'].endedAt" />';
      html += '</div>';
      html += '</td>';
      html += '</tr>';

     $('#movie-table tbody').append(html);
  });
    
  $('#btn-delete-row').click(function() {
    $('#movie-table > tbody:last > tr:last').remove();
    tablecnt -=1;
    ordered -= 1;
    if(ordered <= 1) {
    	ordered = 0;
    }
  });
  
 
    
});

</script>
</html>
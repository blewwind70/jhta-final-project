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
				 
				 <form class="form-horizontal">
				 	<div class= "form-group">
						<label class="control-label col-sm-1">일자선택 </label> 
						<div class="col-sm-3">
							<input type="date" class="form-control" />
						</div>
						<div class="col-sm-1 col-sm-offset-7">
							<button class="btn btn-success form-control" ><i class="fa fa-table fa-fw"></i> 엑셀</button>
						</div>
					</div>
				 </form>

								
					
				
				<div class="box">
				<table class="table table-bordered" style="text-align: center">
					<colgroup>
						<col width="12.5%" ;/>
						<col width="12.5%" ;/>
						<col width="12.5%" ;/>
						<col width="12.5%" ;/>
						<col width="12.5%" ;/>
						<col width="12.5%" ;/>
						<col width="12.5%" ;/>
						<col width="12.5%" ;/>
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
					<tbody>
						<tr>
							<td>1관</td>
							<td>1회</td>
							<td>토르</td>
							<td>9:00</td>
							<td>11:40</td>
							<td>34</td>
							<td>66</td>
							<td>100</td>
						</tr>
						<tr>
							<td>1관</td>
							<td>2회</td>
							<td>토르</td>
							<td>12:00</td>
							<td>14:40</td>
							<td>53</td>
							<td>47</td>
							<td>100</td>
						</tr>
						<tr>
							<td>1관</td>
							<td>1회</td>
							<td>토르</td>
							<td>9:00</td>
							<td>11:40</td>
							<td>34</td>
							<td>66</td>
							<td>100</td>
						</tr>
						<tr>
							<td>1관</td>
							<td>1회</td>
							<td>토르</td>
							<td>9:00</td>
							<td>11:40</td>
							<td>34</td>
							<td>66</td>
							<td>100</td>
						</tr>
						<tr>
							<td>1관</td>
							<td>1회</td>
							<td>토르</td>
							<td>9:00</td>
							<td>11:40</td>
							<td>34</td>
							<td>66</td>
							<td>100</td>
						</tr>
						<tr>
							<td>1관</td>
							<td>1회</td>
							<td>토르</td>
							<td>9:00</td>
							<td>11:40</td>
							<td>34</td>
							<td>66</td>
							<td>100</td>
						</tr>
					</tbody>
				</table>
				</div>
			</div>
		
		
	</div>
 </div>
	
</body>
</html>
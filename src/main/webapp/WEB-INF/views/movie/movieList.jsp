<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/taglibs.jsp" %>
<html>
<head>
	<title>Home</title>
	
	<%@ include file="/WEB-INF/views/common/head.jsp" %>	
</head>
<body>
	<c:set var="nav_active" value="movie" />
	
	<%@ include file="/WEB-INF/views/common/nav.jsp" %>
	<div class="row">
		<div class="col-md-2">
			<c:set var="side_active" value="m3two" />
			<%@ include file="/WEB-INF/views/movie/common/side_movie.jsp" %>
		</div>
		<div class="col-md-10">
			<div class="container top-margin">
			 <h2 class="page-header">영화 조회</h2>
				<div>
					<form action="">
						<div class="form-group form-inline">
							<select name="opt" id="opt" class="form-control">
								<option value="name">영화명</option>
								<option value="publishDate">배급일</option>
								<option value="openDate">개봉일</option>
								<option value="closeDate">상영종료일</option>
							</select> 
							<input type="text" name="search" placeholder="검색어" class="form-control" id="keyword">
							<button class="btn btn-primary" type="submit" id="search-btn"><i class="fa fa-search fa-fw"></i>검색</button>
						</div>
					</form>
				</div>
				<div style="overflow: auto; border: 0.5px solid #D8D8D8; padding: 20px;">
					<form action="">
						<table class="table">
							<thead>
								<tr>
									<th>영화명</th>
									<th>배급일</th>
									<th>개봉일</th>
									<th>상영종료일</th>
								</tr>
							</thead>
							<tbody id="mainTbody">

							</tbody>
						</table>
						<div class="text-right">
							<button type="button" class="btn btn-danger" id="btn-close-movie">
							<i class="fa fa-trash fa-fw"></i>상영종료</button>
							<button type="button" class="btn btn-primary" id="btn-open-modal">
							<i class="fa fa-list fa-fw"></i>상세조회</button>
						</div>
					</form>
				</div>

				<hr />

				<div id="myModal" class="modal fade" role="dialog">
					<div class="modal-dialog modal-lg">
					
						<div class="modal-content">
						
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">영 화 상 세 정 보</h4>
							</div>
							<div class="modal-body">
								<div>
									<form action="">
										<table class="table">
											<tbody>
												<tr>
													<th>영화명</th>
													<td id="name"></td>
													<th>더빙여부</th>
													<td id="dubbed">N</td>
													<th>포스터</th>
													<td id="imgs" rowspan="4"><img src="/resources/images/movie/bb.jpg"/></td>
												</tr>
												<tr>
													<th>배급일</th>
													<td id="publish"></td>
													<th>개봉일</th>
													<td id="open"></td>


												</tr>
												<tr>
													<th>국가</th>
													<td id="country"></td>
													<th>장르</th>
													<td id="genre"></td>
												</tr>

											</tbody>
										</table>
										<div></div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default" data-dismiss="modal">돌아가기</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
<script>
     $(function() {
    	 // 하이라이트 처리
    	 $("#mainTbody").on("click", ".highlight", function() {
			$(".highlight").css("background-color", "white");
			$(this).css("background-color", "red");
			
			var selectTarget = $(this).attr('id');
			
			
			if(selectTarget) {
				//모달창
				$("#btn-open-modal").click(function() {
					$("#myModal").modal("show");
					
					$.ajax({
                    	type: "GET",
                    	url: ".esc",
                    	data:{id: selectTarget},
                    	dataType: "json",
                    	success:function(result) {
                    		/* $("#id").text(result.id); */
                    	}
                    })
                    return false;
				})

			}
			
			
		})
    	
        
         
         // 검색조건 AJax처리 
         $("#search-btn").click(function(e) {
			e.preventDefault();
			var opt = $("#opt").val();
			var keyword = $("#keyword").val();
			$.ajax({
				type: "POST",
				url: "searchByMovieTrans.esc",
				data: {opt: opt, keyword: keyword},
				dataType: "json",
				success: function(result) {
					console.log(result)
					var html = "";
					$.each(result, function(index, item) {
						console.log(item.movie.publishDate)
						html += "<tr class='highlight' id='"+item.id+"'>"
            			html += "<td>"+item.name+"</td>"
            			html += "<td>"+item.movie.publishDate+"</td>"
            			html += "<td>"+item.movie.openDate+"</td>"
            			html += "<td>"+item.movie.closeDate+"</td>"
            			html += "</tr>"
					})
					$("#mainTbody").html(html);	
				}
			})
		})
         
     })
</script>
</html>
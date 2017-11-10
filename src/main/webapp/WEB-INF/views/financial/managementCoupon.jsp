<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/taglibs.jsp" %>
<html>
<head>
	<title>Home</title>
	<style>
        div.row{margin: 10px; padding: 10px;}
    </style>
	<%@ include file="/WEB-INF/views/common/head.jsp" %>
</head>
<body>
	<c:set var="nav_active" value="management" />
	
	<%@ include file="/WEB-INF/views/common/nav.jsp" %>
	<div class="row">
		<div class="col-md-2 div-side">
			<c:set var="side_active" value="management" />
			<%@ include file="/WEB-INF/views/financial/sidebar/sideBar.jsp"%>
		</div>
		<div class="col-md-10">
			<div class="container" style="margin-top: 50px;">
				<h2 class="page-header">쿠폰 / 사은품별 지급 관리</h2>
				<div class="row">
					<form id="search-form" class="form-inline">
						<div class="form-group">
							<select class="form-control" id="opt">
								<option value="username">아이디</option>
								<option value="name">이름</option>
								<option value="grade">등급</option>
							</select> 
							<select class="form-control" id="vip">
								<option value=1>VIP</option>
								<option value=2>PLATINUM</option>
								<option value=3>GOLD</option>
								<option value=4>SILVER</option>
								<option value=5>BRONZE</option>
							</select> 
							<input type="text" class="form-control" id="keyword" />
							<button type="submit" class="btn btn-primary" id="btn-search">조회</button>
						</div>
					</form>
				</div>
				<div class="row box">
					<div>
						<table class="table table-condensed ">
							<thead>
								<tr>
									<th>아이디</th>
									<th>이름</th>
									<th>생일</th>
									<th>연락처</th>
									<th>메일주소</th>
								</tr>
							</thead>
							<tbody id="searchTable">
								
							</tbody>
						</table>
					</div>
					<div class="text-right" style="margin: 8px;">
						<button type="button" class="btn btn-default" id="btn-modal"><i class="fa fa-list fa-fw"></i>상세조회</button>
					</div>
				</div>
				<div class="row box">
					<form action="add.esc" method="post" id="type-form" class="form-horizontal">
						<div class="form-group">
							<label class="control-label col-sm-1">상품분류</label>
							<div class="col-sm-5">
								<select class="form-control">
										<option>쿠폰</option>	
										<option>사은품</option>
								</select>
							</div>
							<label class="control-label col-sm-1">상품명</label>
							<div class="col-sm-5">
										<select class="form-control" name="name">
											<option>어린이날 쿠폰</option>
											<option>새해 쿠폰</option>
										</select>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-1">지급방식</label>
							<div class="col-sm-5">
								<select class="form-control" name="distributeType">
									<option value="O">현장지급</option>
									<option value="I">인터넷지급</option>
									<option value="D">소포</option>
								</select>
							</div>
							<label class="control-label col-sm-1">지급기한</label>
							<div class="col-sm-5">
								<input type="date" class="form-control" name="distributUntil">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-1">수령가능등급</label>
							<div class="col-sm-5">
								<select class="form-control" name="customerRank">
									<option value="1">VIP</option>
									<option value="2">PLATINUM</option>
									<option value="3">GOLD</option>
									<option value="4">SILVER</option>
									<option value="5">BRONZE</option>
								</select>
							</div>
						
							<label class="control-label col-sm-1">지급사유</label>
							<div class="col-sm-5">
								<textarea rows="2" cols="60" name="reason"></textarea>
							</div>
						
							<div class="col-sm-1 col-sm-offset-11">
								<button type="submit" class="btn btn-primary ">등록</button>
							</div>
						</div>
					</form>
				</div>
				<div class="modal fade" id="form-modal" role="dialog">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title">상세조회</h4>
							</div>
							<form>
								<div class="modal-body">
									<div class="form-group">
										<table class="table table-condensed">
											<tr>
												<th>아이디</th><td id="detailId" />
												<th>이름</th><td id="detailName" />
												<th>회원등급</th><td id="detailGrade" />
											</tr>
											<tr>
												<th>생일</th><td id="detailBirth" />
												<th>연락처</th><td id="detailPhone" />
												<th>메일주소</th><td id="detailEmail" />
											</tr>
										</table>
										
									</div>

									<div>
										<label class="control-label">쿠폰 내역</label>
										<div class="row box">
											<table class="table table-condensed ">
												<thead>
													<tr>
														<th class="col-sm-1"><input type="checkbox"
															name="check"></th>
														<th class="col-sm-3">쿠폰명</th>
														<th class="col-sm-2">수령여부</th>
														<th class="col-sm-3">수령날짜</th>
														<th class="col-sm-3">사용날짜</th>
													</tr>
												</thead>
												<tbody>
													<div>
														<tr>
															<td class="col-sm-1"><input type="checkbox"
																name="check"></td>
															<td class="col-sm-3">어린이날 쿠폰</td>
															<td class="col-sm-2">N</td>
															<td class="col-sm-3">2017-04-11</td>
															<td class="col-sm-3">2017-08-21</td>
														</tr>
														<tr>
															<td class="col-sm-1"><input type="checkbox"
																name="check"></td>
															<td class="col-sm-3">새해 쿠폰</td>
															<td class="col-sm-2">N</td>
															<td class="col-sm-3">2017-04-11</td>
															<td class="col-sm-3">2017-08-21</td>
														</tr>
													</div>
												</tbody>
											</table>
											<div class="text-right">
												<button id="btn-modal" class="btn btn-primary btn-sm">수령완료</button>
											</div>
										</div>
									</div>

									<div>
										<label class="control-label">사은품 내역</label>
										<div class="row box" >
											<table class="table table-condensed ">
												<thead>
													<tr>
														<th class="col-sm-1"><input type="checkbox"
															name="check"></th>
														<th class="col-sm-3">사은품명</th>
														<th class="col-sm-3">수령여부</th>
														<th class="col-sm-3">수령날짜</th>
														
													</tr>
												</thead>
												<tbody>
													<div>
														<tr>
															<td class="col-sm-1"><input type="checkbox"
																name="check"></td>
															<td class="col-sm-3">수첩</td>
															<td class="col-sm-3">N</td>
															<td class="col-sm-3">2017-04-11</td>
															
														</tr>
														<tr>
															<td class="col-sm-1"><input type="checkbox"
																name="check"></td>
															<td class="col-sm-3">인형</td>
															<td class="col-sm-3">N</td>
															<td class="col-sm-3">2017-04-11</td>
															
														</tr>
													</div>
												</tbody>
											</table>
											<div class="text-right">
												<button id="btn-modal" class="btn btn-primary btn-sm">수령완료</button>
											</div>
										</div>
									</div>
								</div>

								<div class="modal-footer">
									<button type="button" class="btn btn-default btn-sm"
										data-dismiss="modal">닫기</button>
									<!--<button type="submit" class="btn btn-primary btn-sm" id="btn-add-todo">등록</button>-->
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
$(function(){
	
	// 하이라이트
	$("#searchTable").on("click",".highlight", function() {
	    $(".highlight").css("background-color", "white");
		$(this).css("background-color", "#aaa");
		
		var value = $(this).attr('id');
		
		if(value){
			// 모달
			$("#btn-modal").click(function() {
				$("#form-modal").modal("show");
				
				$.ajax({
					type:"GET",
					url:"searchDetailCustomers.esc",
					data:{
						id:value
					},
					dataType:"json",
					success:function(result){
						console.log(result);
						$("#detailId").text(result.username); 
						$("#detailName").text(result.name);
						$("#detailGrade").text(result.customerRank.type);
						$("#detailBirth").text(result.birth);
						$("#detailPhone").text(result.phone);
						$("#detailEmail").text(result.email); 
					}
				})
			})
		} else {
			history.go;
		}
	}); 
	// 검색 
	$("#btn-search").click(function(e) {
			e.preventDefault();
			
			var type = $("#opt").val();
			var searchValue = $("#keyword").val();
			if(type == "grade"){
				searchValue = $("#vip").val();
			}
			$.ajax({
				type : "POST",
				url : "searchCustomers.esc",
				data : {
					opt : type,
					keyword : searchValue
				},
				dataType : "json",
				success : function(result) {
					var html = "";
					$.each(result, function(index, item) {
						html += "<tr class='highlight' style='background-color: white' id='"+item.id+"'>"
						html += "<td>" + item.username + "</td>"
						html += "<td>" + item.name + "</td>"
						html += "<td>" + item.birth + "</td>"
						html += "<td>" + item.phone + "</td>"
						html += "<td>" + item.email + "</td>"
						html += "</tr>"
					})
					$("#searchTable").html(html);
				}
			})
		});
	// 등급, 검색 화면처리
	$("#vip").hide();
	$("#opt").change(function(){
		if($(this).val() == 'grade') {
			$("#vip").show();
			$("#keyword").hide();
		} else {
			$("#vip").hide();
			$("#keyword").show();
		}
	})
	
});
</script>
</html>
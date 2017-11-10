<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/taglibs.jsp" %>
<html>
<head>
	<title>Home</title>
	<style>
	div.row {
		margin: 10px;
		padding: 10px;
	}
	</style>
	<%@ include file="/WEB-INF/views/common/head.jsp" %>
</head>
<body>
	<c:set var="nav_active" value="management" />
	
	<%@ include file="/WEB-INF/views/common/nav.jsp" %>
	<div class="row">
		<div class="col-md-2 div-side">
			<c:set var="side_active" value="search" />
			<%@ include file="/WEB-INF/views/financial/sidebar/sideBar.jsp"%>
		</div>
		<div class="col-md-10">
			<div class="container" style="margin-top: 50px;">
				<h2 class="page-header">쿠폰 / 사은품별 조회</h2>
				<div class="row" >
					<form id="search-form" class="form-inline">
						<div class="form-group">
							<select class="form-control" name="opt">
								<option name="couponNo">쿠폰번호</option>
								<option name="giftNo">사은품번호</option>
							</select>
							<div class="form-group">
								<input type="text" class="form-control" name="keyword" />
							</div>
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
							<tbody>
								<tr class="highlight">
									<td>maeng</td>
									<td>가르시아</td>
									<td>2015-12-23</td>
									<td>010-3361-1123</td>
									<td>mes@naver.com</td>
								</tr>
								<tr class="highlight">
									<td>maeng</td>
									<td>가르시아</td>
									<td>2015-12-23</td>
									<td>010-3361-1123</td>
									<td>mes@naver.com</td>
								</tr>
								<tr class="highlight">
									<td>maeng</td>
									<td>가르시아</td>
									<td>2015-12-23</td>
									<td>010-3361-1123</td>
									<td>mes@naver.com</td>
								</tr>
								<tr class="highlight">
									<td>maeng</td>
									<td>가르시아</td>
									<td>2015-12-23</td>
									<td>010-3361-1123</td>
									<td>mes@naver.com</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="form-group">
						<div class="text-right" style="margin: 8px;">
							<button type="button" class="btn btn-default" id="btn-modal"><i class="fa fa-list fa-fw"></i>상세조회</button>
							<button type="submit" class="btn btn-primary ">등록</button>
						</div>
					</div>
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

										<label class="control-label col-sm-4">아이디 : maenges</label> <label
											class="control-label col-sm-4">이름 : 가르시아</label> <label
											class="control-label col-sm-4">회원등급 : VIP</label>

									</div>
									<div class="form-group">
										<label class="control-label col-sm-4">생일 : 1986.04.11</label>
										<label class="control-label col-sm-4">연락처 :
											010-3364-0411</label> <label class="control-label col-sm-4">메일주소
											: maenges@naver.com</label>
									</div>

									<label class="control-label">사은품 내역</label>
									<div class="row" style="border: 2px solid grey;">
										<table class="table table-condensed ">
											<thead>
												<tr>
													<th class="col-sm-1"><input type="checkbox"
														name="check"></th>
													<th class="col-sm-3">수령목록</th>
													<th class="col-sm-3">수령여부</th>
													<th class="col-sm-3">수령날짜</th>
												</tr>
											</thead>
											<tbody>
												<div class="form-group">
													<tr>
														<td class="col-sm-1"><input type="checkbox"
															name="check"></td>
														<td class="col-sm-3">수령</td>
														<td class="col-sm-2">N</td>
														<td class="col-sm-3">2017-04-11</td>
													</tr>
													<tr>
														<td class="col-sm-1"><input type="checkbox"
															name="check"></td>
														<td class="col-sm-3">수령</td>
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


									<div>
										<label class="control-label">쿠폰 내역</label>
										<div class="row" style="border: 2px solid grey;">
											<table class="table table-condensed ">
												<thead>
													<tr>
														<th class="col-sm-1"><input type="checkbox"
															name="check"></th>
														<th class="col-sm-3">수령목록</th>
														<th class="col-sm-2">수령여부</th>
														<th class="col-sm-3">수령날짜</th>
														<th class="col-sm-3">사용날짜</th>
													</tr>
												</thead>
												<tbody>
													<div class="form-group">
														<tr>
															<td class="col-sm-1"><input type="checkbox"
																name="check"></td>
															<td class="col-sm-3">수령</td>
															<td class="col-sm-2">N</td>
															<td class="col-sm-3">2017-04-11</td>
															<td class="col-sm-3">2017-08-21</td>
														</tr>
														<tr>
															<td class="col-sm-1"><input type="checkbox"
																name="check"></td>
															<td class="col-sm-3">수령</td>
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
	$("#btn-modal").click(function() {
			$("#form-modal").modal("show");
	});
	$(".highlight").click(function() {
	    $(".highlight").css("background-color", "white");
	    $(this).css("background-color", "grey");
	})
});
</script>
</html>
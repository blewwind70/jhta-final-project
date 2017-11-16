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
	<c:set var="nav_active" value="financial" />
	
	<%@ include file="/WEB-INF/views/common/nav.jsp" %>
	<div class="row">
		<div class="col-md-2 div-side">
			<c:set var="side_active" value="search" />
			<%@ include file="/WEB-INF/views/financial/sidebar/sideBar.jsp"%>
		</div>
		<div class="col-md-10">
			<div class="container" style="margin-top: 50px;">
				<h2 class="page-header">쿠폰 / 사은품 지급</h2>

				<div class="row box">
					<form action="add.esc" method="post" id="type-form"
						class="form-horizontal">
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
								<textarea rows="1" cols="60" id="name" name="name"></textarea>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-1">지급방식</label>
							<div class="col-sm-5">
								<select class="form-control" id="distributeType"
									name="distributeType">
									<option value="O">현장지급</option>
									<option value="I">인터넷지급</option>
									<option value="D">소포</option>
								</select>
							</div>
							<label class="control-label col-sm-1">지급날짜</label>
							<div class="col-sm-5">
								<input type="date" class="form-control" id="distributUntil"
									name="distributUntil">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-1">수령가능등급</label>
							<div class="col-sm-5">
								<select class="form-control" id="customerRank"
									name="customerRank.id">
									<option value="1">VIP</option>
									<option value="2">PLATINUM</option>
									<option value="3">GOLD</option>
									<option value="4">SILVER</option>
									<option value="5">BRONZE</option>
								</select>
							</div>

							<label class="control-label col-sm-1">지급사유</label>
							<div class="col-sm-5">
								<textarea rows="2" cols="60" id="reason" name="reason"></textarea>
							</div>

							<div class="col-sm-1 col-sm-offset-11">
								<button type="submit" class="btn btn-primary">등록</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
$(function(){
	
});
</script>
</html>
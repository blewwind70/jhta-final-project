<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/taglibs.jsp"%>
<html>
<head>
<title>Home</title>
<style>
div.row{
	margin: 10px; padding: 10px;
}

.margin-right {
	margin-right: 16px;
}
</style>
<%@ include file="/WEB-INF/views/common/head.jsp"%>
</head>
<body>
	<c:set var="nav_active" value="management" />

	<%@ include file="/WEB-INF/views/common/nav.jsp"%>
	<div class="row">
		<div class="col-md-2 div-side">
			<c:set var="side_active" value="calculate" />
			<%@ include file="/WEB-INF/views/financial/sidebar/sideBar.jsp"%>
		</div>
		<div class="col-md-10">
			<div class="container" style="margin-top: 50px;">
				<h2 class="page-header">일일 정산</h2>
				<div class="row box">
					<div class="col-sm-3">
						<label><strong class="margin-right">날짜</strong>2017-05-30</label>
					</div>
					<div class="col-sm-3">
						<label><strong class="margin-right">단말기 번호</strong>B01</label>
					</div>
					<div class="col-sm-3">
						<label><strong class="margin-right">판매자</strong>강감찬</label>
					</div>
				</div>
				<div class="row">
					<table class="table">
						<tr>
							<th>기본금</th>
							<td>200000</td>
							<th>사용된 상품권/관람권 개수</th>
							<td>1</td>
						</tr>
						<tr>
							<th>총 결제금액</th>
							<td>21000</td>
							<th>회수된 상품권/관람권 개수</th>
							<td>0</td>
						</tr>
						<tr>
							<th>반환금</th>
							<td>20000</td>
							<th></th>
							<td></td>
						</tr>
						<tr>
							<th>정산차</th>
							<td>-1000</td>
							<th>정산차</th>
							<td>-10000</td>
						</tr>
					</table>
					<div class="text-right">
						<button class="btn btn-primary">확인</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
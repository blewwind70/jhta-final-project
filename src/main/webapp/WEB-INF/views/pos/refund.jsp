<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Insert title here</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

    <%@ include file="/WEB-INF/views/pos/common/style.jsp" %>
    <style>
        .nav-tabs {
            width: 1770px;
            height: 51px;
            margin-left: 15px;
            padding: 5px;
            background-color: #6a5dc0;
        }
      	ul.nav-tabs > li > a {
            font-size: 17px;
            color: white;
        }
        ul.nav-tabs > li.active > a {
            font-weight: bolder;
            font-size: 20px;
            color: #6a5dc0 ;
        }
		#main-box {
			border: 10px solid #6a5dc0;
			height: 700px;
		}
		#payment-info-box {
			margin: 20px;
			width: 1000px;
			height: 630px;
		}
		#purchase-info-box {
			margin: 20px;
			width: 700px;
			height: 630px;
		}
		#search-ticket-form {
			margin-top: 8px;
			margin-bottom: -5px;
		}
		#payment-table-box {
			height: 280px;
		}
		#payment-type-box {
			height: 170px;
		}
		#purchase-movie-box {
			height: 250px;
		}
		#purchase-type-box {
			height: 200px;
		}
		#btn-box .btn {
			margin: 10px;
			width: 270px;
			height: 50px;;
		}
    </style>
</head>
<body>
    <%@ include file="/WEB-INF/views/pos/common/nav.jsp" %>
    
    <div class="container">
        <div class="row">
            <ul class="nav nav-default nav-tabs">
              <li role="presentation"><a href="select.html">발권</a></li>
              <li role="presentation" class="active"><a href="refund.html">환불</a></li>
            </ul>
        </div>
        
        <div id="main-box">
        	<div class="row">
				<div id="payment-info-box" class="col-sm-7 border-box">
					<div class="border-box">
						<form id="search-ticket-form" class="form-horizontal">
							<div class="form-group">
								<label class="col-sm-2 control-label">판매번호</label>
								<div class="col-sm-7">
									<input type="text" name="receipt-no" class="form-control"/>
								</div>

								<button type="submit" class="btn btn-boots btn-sm">조회</button>
							</div>
						</form>
					</div>
					
					<div id="discount-list-box" class="border-box">
						<div class="col-sm-offset-1">
							<div class="row">
								<label class="col-sm-2">할인내역</label>
								<div id="payment-table-box" class="col-sm-9">
									<table class="table table-hover">
										<thead>
											<tr>
												<th>할인명</th><th>수량</th><th>할인금액</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>대학생 할인</td><td>1</td><td>-1000</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					
					<div id="payment-type-box" class="border-box">
						<div class="col-sm-offset-1">
							<div class="row">
								<label class="col-sm-2">결제수단</label>
								<div class="col-sm-9">
									<table class="table table-hover">
										<thead>
											<tr>
												<th>구분</th><th>결제정보</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>카드</td>
												<td>삼성카드 (3258-5895-xxxx-5953)</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div id="purchase-info-box" class="col-sm-4 border-box pull-right">
					<div id="purchase-movie-box" class="border-box">
						<label>구입 내역</label>
						<table class="table table-bordered">
							<thead>
								<tr>
									<th></th><th>구매내용</th><th>수량</th><th>구매액</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
										<input type="checkbox" name="purchase"/>
									</td>
									<td>토르 : 라그나로크</td><td>1</td><td>22000</td>
								</tr>
							</tbody>
						</table>
					</div>
					
					<div id="purchase-type-box" class="border-box">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>분류</th><th>수량</th><th>가격</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>성인</td><td>2</td><td>22000</td>
								</tr>
							</tbody>
						</table>
					</div>
					
					<div class="border-box">
						<div class="row">
							<label class="col-sm-2">총 금액</label>
							<div class="col-sm-9 text-right">22000</div>
						</div>
					</div>
					
					<div id="btn-box">
						<form>
							<button type="submit" class="btn btn-boots btn-lg">환불</button>
							<a href="select.html" class="btn btn-boots btn-lg pull-right">취소</a>
						</form>						
					</div>
				</div>
            </div>
        </div>
    </div>
</body>
</html>
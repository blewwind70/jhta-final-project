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
	<script type="text/javascript">
		$(function() {
			// 판매번호 자동 '-' 추가 function
			var autoMinus = function(str) {
				str = str.replace(/[^0-9]/g, '');
				var tmp = '';
				
				if(str.length < 4){
					return str;
				} else if(str.length < 8){
					tmp += str.substr(0, 4);
					tmp += '-';
					tmp += str.substr(4);
					return tmp;
				} else if(str.length < 12){
					tmp += str.substr(0, 4);
					tmp += '-';
					tmp += str.substr(4, 4);
					tmp += '-';
					tmp += str.substr(8);
					return tmp;
				} else if(str.length <= 16) {        
					tmp += str.substr(0, 4);
					tmp += '-';
					tmp += str.substr(4, 4);
					tmp += '-';
					tmp += str.substr(8, 4);
					tmp += '-';
					tmp += str.substr(12, 4);
					return tmp;
				} else {
					tmp += str.substr(0, 4);
					tmp += '-';
					tmp += str.substr(4, 4);
					tmp += '-';
					tmp += str.substr(8, 4);
					tmp += '-';
					tmp += str.substr(12, 4);
					return tmp;
				}
				return str;
			}
			
			// 판매번호 자동 '-' 추가 Event
			$("#receipt-no-input").on("keyup", function() {
				var autoNo = autoMinus($(this).val());
				$(this).val(autoNo);
			});
			
			// 조회 btn Event
			$("#search-btn").on("click", function(e) {
				e.preventDefault();
				
				var receiptNo = $("#receipt-no-input").val();
				
				if(receiptNo) {
					$.ajax({
						type:"POST",
						url:"reprint.esc",
						data:{rid:receiptNo},
						dataType:"json",
						success:function(result) {
							$("#search-ticket-form").submit();
						},
						error:function() {
							alert("존재하지 않는 번호입니다.");
						}
					});
				} else {
					alert("영수증 번호를 입력하세요.");
				}
			});
			
			// 재출력 btn Event
			$("#reprinted-btn").on("click", function() {
				var receiptNo = $("#receipt-no-input").val();
				
				if(receiptNo) {
					$.ajax({
						type:"POST",
						url:"reprint.esc",
						data:{rid:receiptNo},
						dataType:"json",
						success:function(result) {
							if(result.printed == 'Y') {
								alert("이미 출력된 티켓입니다. 관리자에게 문의하세요.");
							} else {
								alert("출력이 완료되었습니다.");
							}
						},
						error:function() {
							alert("존재하지 않는 번호입니다.");
						}
					});
				} else {
					alert("영수증 번호를 입력하세요.");
				}
			});
			
			// 환불 btn Event
			$("#refund-btn").on("click", function(e) {
				e.preventDefault();
				
				$("#check-refund-modal").modal("show");
			});
			
			// modal 확인 btn Event
			$("#confirm-btn").on("click", function() {
				$("#refund-form").submit();
			});
		});
	</script>
    <%@ include file="/WEB-INF/views/pos/common/style.jsp" %>
    <style>
		#main-box {
			border: 10px solid #6a5dc0;
			height: 700px;
		}
		#payment-info-box {
			margin: 20px;
			width: 1000px;
			height: 630px;
		}
		#reprinted-btn {
			margin-right: 20px;
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
		#receipt-no-input {
			font-size: 20px;
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
		#price-box {
			background-color: #6a5dc0;
			font-size: 17px;
			color: white;
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
    <c:set var="nowPage" value="refundPage"/>
	<%@ include file="/WEB-INF/views/pos/common/nav-tab.jsp" %>
        
        <div id="main-box">
        	<div class="row">
				<div id="payment-info-box" class="col-sm-7 border-box">
					<div class="border-box outer-box">
						<form method="post" action="refund.esc" id="search-ticket-form" class="form-horizontal">
							<div class="form-group">
								<label class="col-sm-2 control-label">판매번호</label>
								<div class="col-sm-7">
									<input type="text" name="receiptNo" id="receipt-no-input" class="form-control" value="${info.receiptInfo.rid }"/>
								</div>

								<button type="submit" id="search-btn" class="btn btn-boots">조회</button>
								<button type="button" id="reprinted-btn" class="btn btn-boots pull-right">재출력</button>
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
											<c:forEach var="forDiscount" items="${info.discountList }">
												<tr>
													<td>${forDiscount.discount.name }</td>
													<td>1</td>
													<c:if test="${forDiscount.discount.discountType eq 'F' }">
														<td><fmt:formatNumber value="-${forDiscount.discount.discountPrice }" pattern="#,###"/></td>
													</c:if>
													<c:if test="${forDiscount.discount.discountType eq 'S' }">
														<td><fmt:formatNumber value="-${forDiscount.discount.customerType.price - forDiscount.discount.discountPrice }" pattern="#,###"/></td>
													</c:if>
													<c:if test="${forDiscount.discount.discountType eq 'P' }">
														<td><fmt:formatNumber value="-${forDiscount.discount.customerType.price * forDiscount.discount.discountPercent / 100 }" pattern="#,###"/></td>
													</c:if>
												</tr>
											</c:forEach>
											
											<c:forEach var="forCoupon" items="${info.couponList }">
												<tr>
													<td>${forCoupon.coupon.name }</td>
													<td colspan="2">1</td>
												</tr>
											</c:forEach>
											
											<c:if test="${info.receiptInfo.miliege ne null}">
												<tr>
													<td>포인트 할인</td>
													<td></td>
													<td>-${info.receiptInfo.miliege }</td>
												</tr>
											</c:if>
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
									<table id="payment-type-table" class="table table-hover">
										<thead>
											<tr>
												<th>구분</th><th>결제정보</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>
													<c:choose>
														<c:when test="${info.receiptInfo.purchaseType eq 'C' }">
															카드
														</c:when>
														<c:when test="${info.receiptInfo.purchaseType eq 'M' }">
															현금
														</c:when>
														<c:when test="${info.receiptInfo.purchaseType eq 'O' }">
															온라인
														</c:when>
													</c:choose> 
												</td>
												<td>${info.receiptInfo.creditNo }</td>
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
									<th></th><th>구매내용</th><th>상영관</th><th>상영시간</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
										<input type="checkbox" name="purchase"/>
									</td>
									<td>${info.movie.name }</td><td>${info.movieTime.screenMovie.screen.name }</td><td><fmt:formatDate value="${info.movieTime.startedAt }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								</tr>
							</tbody>
						</table>
					</div>
					
					<div id="purchase-type-box" class="border-box">
						<table id="purchase-type-table" class="table table-hover">
							<thead>
								<tr>
									<th>분류</th><th>수량</th><th>가격</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="forTicket" items="${info.ticketList }">
									<tr>
										<td>${forTicket.customerType.type }</td>
										<td>1</td>
										<td><fmt:formatNumber value="${forTicket.customerType.price }" pattern="#,###"/></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					
					<div id="price-box" class="border-box">
						<div class="row">
							<label class="col-sm-3">총 결제 금액</label>
							<div id="total-price-box" class="col-sm-8 text-right"><fmt:formatNumber value="${info.receiptInfo.price + info.receiptInfo.discountedPrice}" pattern="#,###"/></div>
						</div>
					</div>
					
					<div id="btn-box">
						<form method="post" action="refundconfirm.esc" id="refund-form">
							<input type="hidden" name="receiptNo" value="${info.receiptInfo.rid }"/>
							<button type="submit" id="refund-btn" class="btn btn-boots btn-lg">환불</button>
							<a href="select.html" class="btn btn-boots btn-lg pull-right">취소</a>
						</form>						
					</div>
				</div>
            </div>
        </div>
    </div>
    
    <div id="check-refund-modal" class="modal bs-example-modal-lg">
    	<div class="modal-dialog modal-lg">
    		<div class="modal-content">
		    	<div class="modal-body">
		    		<h3>환불을 완료합니다. 진행하시겠습니까?</h3>
		    	</div>
		    	
		    	<div class="modal-footer">
		    		<div class="pull-right">
		    			<button id="confirm-btn" type="button" class="btn btn-boots btn-lg">확인</button>
		    			<button type="button" class="btn btn-defalut btn-lg" data-dismiss="modal">취소</button>
		    		</div>
		    	</div>
    		</div>
    	</div>
    </div>
</body>
</html>
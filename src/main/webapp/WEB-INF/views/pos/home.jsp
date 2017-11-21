<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Insert title here</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script>
		$(function() {
			var $priceListTbody = $("div#price-box tbody");
			var $movieListTbody = $("#movie-list-box tbody");
			var $playingDate = $("#playing-date");
			var $timeTableTbody = $("#time-table tbody");
			var $priceKeyBox = $("#price-key-box");
			
			// Date Format function
			var getStringToDate = function(date) {
				var year = date.getFullYear().toString();
				var month = (date.getMonth() + 1).toString();
				var day = date.getDate().toString();
				
				if(month.length == 1) {
					month = "0" + month;
				}
				if(day.length == 1) {
					day = "0" + day;
				}
				
				return year + "-" + month + "-" + day;
			};
			
			// 가격 계산 function
            var calculatePrice = function() {
                var totalPrice = 0;
                $priceListTbody.children("tr").each(function() {
                    var $amountTd = $(this).children(".amount-td");
                    var $priceTd = $(this).children(".price-td");
                    var pricePerOne = parseInt($(this).children("td.one-price").text());
                    
                    $priceTd.text(parseInt($amountTd.text()) * pricePerOne);
                    totalPrice += parseInt($priceTd.text());
                });
            
                $("#total-price-box span").text(totalPrice);
            }
            
			// 첫 시작시 Date로 조회
            var now = new Date();
            $playingDate.val(getStringToDate(new Date()));
            
            // 첫 시작시 가격 btn 불러오기
            $.ajax({
            	type:"GET",
            	url:"pricekey.esc",
            	dataType:"json",
            	success:function(result) {
            		$priceKeyBox.empty();
            		
            		$priceKeyBox.append("<button id='move-btn-left' class='btn btn-boots move-key-btn'><span class='glyphicon glyphicon-chevron-left'></span></button>");
            		
            		$(result).each(function(index, item) {
	            		var htmlContents = "";
	            		
	            		if(index > 3) {
	            			htmlContents += "<button type='button' id='price-key-btn-" + this.id + "' class='btn btn-boots btn-lg price-key-btn btn-after-hide'>";
	            		} else {
	            			htmlContents += "<button type='button' id='price-key-btn-" + this.id + "' class='btn btn-boots btn-lg price-key-btn'>";
	            		}
	            		htmlContents += "	<div class='btn-kind'>" + this.type + "</div>";
	            		htmlContents += "	<div class='btn-price'>" + this.price + "</div>";
	            		htmlContents += "</button>";
	
	            		$priceKeyBox.append(htmlContents);
	            		
            		});
            		$priceKeyBox.append("<button id='move-btn-right' class='btn btn-boots move-key-btn pull-right'><span class='glyphicon glyphicon-chevron-right'></span></button>");
            	}
            });
			
         	// 조회 btn 클릭 Event + 시작시 조회 활성화
            $("#playing-date-btn").on("click", function() {
            	var searchingDate = $playingDate.val();
            	$movieListTbody.empty();
            	
            	$.ajax({
            		type:"GET",
            		url:"movie.esc",
            		data:{playingdate:searchingDate},
            		dataType:"json",
            		success:function(result) {
            			
            			$(result).each(function() {
	            			var htmlContents = "";
	            			
	            			htmlContents += "<tr id='movie-name-tr-" + this.movie.id + "'>";
	            			htmlContents += "	<th>" + this.name + "</th>";
	            			htmlContents += "	<td><span class='badge' id='grade-" + this.movie.ageLimit + "'>" + this.movie.ageLimit + "</span></td>";
            				htmlContents += "</tr>";
            				
            				$movieListTbody.append(htmlContents);
            			});
            		}
            	});
            });
            $("#playing-date-btn").trigger("click");
            
			// 가격 Key 좌우 이동 btn 위임 Event
			$priceKeyBox.on("click", "#move-btn-right", function() {
				var $hiddenBeforeBtn = $(this).siblings(".btn-before-hide:last");
 				var $hiddenAfterBtn = $(this).siblings(".btn-after-hide:first");
 				
 				if($hiddenAfterBtn.text() && !$hiddenBeforeBtn.text()) {
 					$(this).siblings(".price-key-btn:first").addClass("btn-before-hide");
 					$hiddenAfterBtn.removeClass("btn-after-hide");
 				} else if($hiddenAfterBtn.text() && $hiddenBeforeBtn.text()) {
 					$hiddenBeforeBtn.next().addClass("btn-before-hide");
 					$hiddenAfterBtn.removeClass("btn-after-hide");
 				}
			});
			$priceKeyBox.on("click", "#move-btn-left", function() {
				var $hiddenAfterBtn = $(this).siblings(".btn-after-hide:first");
				var $hiddenBeforeBtn = $(this).siblings(".btn-before-hide:last");
				
				if($hiddenBeforeBtn.text() && !$hiddenAfterBtn.text()) {
 					$(this).siblings(".price-key-btn:last").addClass("btn-after-hide");
 					$hiddenBeforeBtn.removeClass("btn-before-hide");
				} else if($hiddenBeforeBtn.text() && $hiddenAfterBtn.text()) {
 					$hiddenAfterBtn.prev().addClass("btn-after-hide");
 					$hiddenBeforeBtn.removeClass("btn-before-hide");
  				}
  			});
            
            // Movie List tr 위임 Event
            $movieListTbody.on("click", "tr", function() {
            	var searchingDate = $playingDate.val();
            	var movieId = $(this).attr("id").replace("movie-name-tr-", "");
            	$(this).addClass("selected-movie").siblings("tr").removeClass("selected-movie");
            	
            	$timeTableTbody.empty();
            	$("#hidden-timetableId").val("");
            	
            	$.ajax({
            		type:"GET",
            		url:"timetable.esc",
            		data:{playingdate:searchingDate,movieid:movieId},
            		dataType:"json",
            		success:function(result) {
            			
            			$(result).each(function() {
            				var htmlContents = "";
            				
            				htmlContents += "<tr id='time-tr-" + this.id + "'>";
            				htmlContents += "	<td>" + this.startedAt.substr(10, 6) + "</td>";
            				htmlContents += "	<td>" + this.screenMovie.screen.name + "</td>";
            				htmlContents += "	<td>" + this.screenMovie.screen.seatsCount + "</td>";
            				htmlContents += "</tr>";
            				
            				$timeTableTbody.append(htmlContents);
            			});
            			
            			$("#hidden-movieId").val(movieId);
            		}
            	});
            });
            
            // Time List tr 위임 Event
            $timeTableTbody.on("click", "tr", function() {
            	$(this).addClass("selected-time").siblings("tr").removeClass("selected-time");
            	
            	var timetableId = $(this).attr("id").replace("time-tr-", "");
            	$("#hidden-timetableId").val(timetableId);
            });
            
            // 가격 btn Click 위임 Event
			$priceKeyBox.on("click", ".price-key-btn", function() {
                var $tr = $priceListTbody.children("tr");
                
                var priceKeyId = $(this).attr("id").replace("price-key-btn-", "");
				var kind = $(this).children(".btn-kind").text();
                var amount = 0;
				var price = $(this).children(".btn-price").text();
                
                var hasKind = false;
                $tr.each(function() {                    
                    if(kind != $(this).children(".kind-td").text()) {
                        hasKind = false;
                    } else {
                        hasKind = true;
                        var $amountTd = $(this).children(".amount-td");
                        $amountTd.text(parseInt($amountTd.text()) + 1);
                        
                        calculatePrice();
                        return false;
                    }
                });
                
                var htmlContents = "";
                if($tr.length == 0 || !hasKind) {
                    amount = 1;
                    hasKind = false;
                    
                    htmlContents += "<tr id='price-tr-" + priceKeyId + "'>";
                    htmlContents += "	<td class='kind-td'>" + kind + "</td>";
                    htmlContents += "   <td class='amount-td'>" + amount + "</td>";
                    htmlContents += "   <td class='price-td'>" + price + "</td>";
                    htmlContents += "	<td>";
                    htmlContents += "		<button class='btn btn-danger btn-xs remove-btn pull-right'>";
                    htmlContents += "			<span class='glyphicon glyphicon-remove'></span>";
                    htmlContents += "		</button>";
                    htmlContents += "	</td>";
                    htmlContents += "   <td class='one-price sr-only'>" + price + "</td>";
                    htmlContents += "</tr>";
                    
                    $priceListTbody.append(htmlContents);
                    calculatePrice();
                }
			});
			
            // 구매취소 btn 위임 Event
			$priceListTbody.on("click", ".remove-btn", function() {
                var $amountTd = $(this).parent("td").siblings("td.amount-td");
                if(parseInt($amountTd.text()) > 1) {
                    $amountTd.text(parseInt($amountTd.text()) - 1);
                    calculatePrice();
                } else {
                    $(this).closest("tr").remove();
                    calculatePrice();
                }
			});
            
            // 좌석선택 btn Event
            $("#seat-select-btn").on("click", function(e) {
            	e.preventDefault();
            	
            	var keyIdList = "";
            	var amountList= "";
            	$priceListTbody.find("tr").each(function() {
            		var priceKeyId = $(this).attr("id").replace("price-tr-", "");
            		var amount = $(this).find("td.amount-td").text();
            		
            		keyIdList += priceKeyId + ",";
            		amountList += amount + ",";
            	});
            	
            	$("#hidden-priceKeyId").val(keyIdList);
            	$("#hidden-amount").val(amountList);
            	
            	if($("#hidden-movieId").val() == "") {
            		alert("영화가 선택되지 않았습니다.");
            		return false;
            	} else if($("#hidden-timetableId").val() == "") {
            		alert("관람할 상영시간이 선택되지 않았습니다.");
            		return false;
            	} else if(keyIdList == "" || amountList == "") {
            		alert("관람할 인원이 선택되지 않았습니다.");
            		return false;
            	}
            	
            	$(this).closest("form").submit();
            });
		});
	</script>
   	<%@ include file="/WEB-INF/views/pos/common/style.jsp" %>
    <style>
		#main-box {
			border: 10px solid #6a5dc0;
			height: 700px;
		}
        #movie-list-box {
            height: 573px;
            font-size: 15px;
        }
		#time-table-box, #price-box {
			overflow: scroll;
			height: 550px;
			font-size: 17px;
		}
        .selected-movie, .selected-time {
        	background-color: #6a5dc0;
        }
		#price-key-box, #final-check-box {
			height: 57px;
		}
		.btn-before-hide, .btn-after-hide {
			display: none;
		}
		.move-key-btn {
			margin-right: 8px;
			padding-right: 28px;
			width: 25px;
			height: 57px;
			font-size: 17px;
		}
		.price-key-btn {
			margin: 1px;
			padding: 6px;
			width: 100px;
		}
        #seat-select-btn {
            width: 200px;
            height: 57px;
        }
        #total-price-box {
            margin-top: -2px;
            background-color: #6a5dc0;
            font-size: 16px;
            color: white;
        }
        #grade-0 {
            background-color: forestgreen;
            font-size: 14px;
        }
        #grade-12 {
            background-color: cornflowerblue;
            font-size: 14px;
        }
        #grade-15 {
            background-color: darkgoldenrod;
            font-size: 14px;
        }
        #grade-18 {
            background-color: firebrick;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <%@ include file="/WEB-INF/views/pos/common/nav.jsp" %>
    
    <div class="container">
    <c:set var="nowPage" value="mainPage"/>
 	<%@ include file="/WEB-INF/views/pos/common/nav-tab.jsp" %>
        
        <div id="main-box">
            <div class="col-sm-4">
                <div class="border-box outer-box">
                    <form class="form-inline">
                        <input type="date" name="playingdate" id="playing-date" class="form-control" style="width: 400px;"/>
                        <button type="button" id="playing-date-btn" class="btn btn-boots pull-right">조회</button>
                    </form>
                </div>
                
                <div id="movie-list-box" class="border-box">
                    <table class="table table-condensed">
                        <tbody>

                        </tbody>
                    </table>
                </div>
            </div>
            
            <div class="col-sm-4">
                <div id="time-table-box" class="border-box">
                    <table id="time-table" class="table table-condensed">
                    	<thead>
                     		<tr>
                     			<th>시작시간</th><th>상영관</th><th>잔여석</th>
                     		</tr>
                     	</thead>
                        <tbody>

                        </tbody>
                    </table>
                </div>
                
                <div class="border-box">
					<div id="price-key-box">
						
					</div>
                </div>
            </div>
            
            <div class="col-sm-4">
                <div id="price-box" class="border-box">
					<table class="table table-condensed">
						<thead>
							<tr>
								<th>구분</th><th>수량</th><th>요금</th><th></th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
                </div>
                
                <div class="border-box">
                    <div id="final-check-box">
                        <form method="post" action="seat.esc" class="col-sm-4">
                        	<input type="hidden" name="movieId" id="hidden-movieId"/>
                        	<input type="hidden" name="timetableId" id="hidden-timetableId"/>
                        	<input type="hidden" name="priceKeyId" id="hidden-priceKeyId"/>
                        	<input type="hidden" name="amount" id="hidden-amount"/>
                            <button type="submit" id="seat-select-btn" class="btn btn-boots btn-lg">좌석 선택</button>
                        </form>
                        
                        <div class="col-sm-6 col-sm-offset-2">
                            <div id="total-price-box" class=" border-box">
                                <label>총 가격</label>
                                <span class="pull-right"></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
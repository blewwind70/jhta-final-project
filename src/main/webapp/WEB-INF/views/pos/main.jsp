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
			var $priceBox = $("div#price-box tbody");
			var $movieListTbody = $("#movie-list-box tbody");
			var $playingDate = $("#playing-date");
			var $timeTableTbody = $("#time-table tbody");
			
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
                $priceBox.children("tr").each(function() {
                    var $amountTd = $(this).children(".amount-td");
                    var $priceTd = $(this).children(".price-td");
                    var pricePerOne = parseInt($(this).children("td.one-price").text());
                    
                    $priceTd.text(parseInt($amountTd.text()) * pricePerOne);
                    totalPrice += parseInt($priceTd.text());
                });
            
                $("#total-price-box span").text(totalPrice);
            }
            
            // 조회 btn 클릭 Event
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
            
			// 첫 시작시 Date로 조회
            var now = new Date();
            $playingDate.val(getStringToDate(new Date()));
            $("#playing-date-btn").trigger("click");
            
            // Movie List tr 위임 Event
            $movieListTbody.on("click", "tr", function() {
            	var searchingDate = $playingDate.val();
            	var movieId = $(this).attr("id").replace("movie-name-tr-", "");
            	$(this).addClass("selected-movie").siblings("tr").removeClass("selected-movie");
            	
            	$timeTableTbody.empty();
            	
            	$.ajax({
            		type:"GET",
            		url:"timetable.esc",
            		data:{playingdate:searchingDate,movieid:movieId},
            		dataType:"json",
            		success:function(result) {
            			
            			$(result).each(function() {
            				var htmlContents = "";
            				
            				htmlContents += "<tr id='time-tr-" + this.id + "'>";
            				htmlContents += "	<td>" + this.startedAt + "</td>";
            				htmlContents += "	<td>" + this.screenMovie.screen.name + "</td>";
            				htmlContents += "	<td>" + this.screenMovie.screen.seatsCount + "</td>";
            				htmlContents += "</tr>";
            				
            				$timeTableTbody.append(htmlContents);
            			});
            		}
            	});
            });
            
            // Time List tr 위임 Event
            $timeTableTbody.on("click", "tr", function() {
            	$(this).addClass("selected-time").siblings("tr").removeClass("selected-time");
            });
            
            // 가격 btn Click Event
			$(".price-key-btn").on("click", function() {
                var $tr = $priceBox.children("tr");
                
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
                    
                    htmlContents += "<tr>";
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
                    
                    $priceBox.append(htmlContents);
                    calculatePrice();
                }
			});
			
            // 구매 btn 위임 Event
			$priceBox.on("click", ".remove-btn",function() {
                var $amountTd = $(this).parent("td").siblings("td.amount-td");

                if(parseInt($amountTd.text()) > 1) {
                    $amountTd.text(parseInt($amountTd.text()) - 1);
                    calculatePrice();
                } else {
                    $(this).closest("tr").remove();
                    calculatePrice();
                }
			});
		});
	</script>
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
        #movie-list-box {
            height: 573px;
            font-size: 15px;
        }
		#time-table-box, #price-box {
			height: 550px;
			font-size: 17px;
		}
        .selected-movie, .selected-time {
        	background-color: #6a5dc0;
        }
		#price-key-box, #final-check-box {
			height: 57px;
		}
		.price-key-btn {
			width: 90px;
			padding: 6px;
		}
        #seat-select-btn {
            width: 200px;
            height: 57px;
        }
        #total-price-box {
            margin-top: -2px;
            background-color: #6a5dc0;
            font-size: 16px;
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
        #grade-19 {
            background-color: firebrick;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <%@ include file="/WEB-INF/views/pos/common/nav.jsp" %>
    
    <div class="container">
        <div class="row">
            <ul class="nav nav-default nav-tabs">
              <li role="presentation" class="active"><a href="select.html">발권</a></li>
              <li role="presentation"><a href="refund.html">환불</a></li>
            </ul>
        </div>
        
        <div id="main-box">
            <div class="col-sm-4">
                <div class="border-box">
                    <form class="form-inline">
                        <input type="date" name="playingdate" id="playing-date" class="form-control" style="width: 400px;"/>
                        <button type="button" id="playing-date-btn" class="btn btn-boots pull-right">조회</button>
                    </form>
                </div>
                
                <div id="movie-list-box" class="border-box">
                    <table class="table table-hover">
                        <tbody>

                        </tbody>
                    </table>
                </div>
            </div>
            
            <div class="col-sm-4">
                <div id="time-table-box" class="border-box">
                    <table id="time-table" class="table table-hover">
                        <tbody>

                        </tbody>
                    </table>
                </div>
                
                <div class="border-box">
					<div id="price-key-box">
						<button type="button" class="btn btn-boots btn-lg price-key-btn">
							<div class="btn-kind">성인</div>
							<div class="btn-price">11000</div>
						</button>
						<button type="button" class="btn btn-boots btn-lg price-key-btn">
							<div class="btn-kind">청소년</div>
							<div class="btn-price">8000</div>
						</button>
						<button type="button" class="btn btn-boots btn-lg price-key-btn">
							<div class="btn-kind">장애인</div>
							<div class="btn-price">4000</div>
						</button>
					</div>
                </div>
            </div>
            
            <div class="col-sm-4">
                <div id="price-box" class="border-box">
					<table class="table table-hover">
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
                        <form action="seat.html" class="col-sm-4">
                        	<input type="hidden" name="movieId" id="hidden-movieId"/>
                        	<input type="hidden" name="timetableId" id="hidden-timetableId"/>
                            <button type="submit" id="seat-select-btn" class="btn btn-boots btn-lg">좌석 선택</button>
                        </form>
                        
                        <div class="col-sm-6 col-sm-offset-2">
                            <div id="total-price-box" class=" border-box">
                                <label style="color: white;">총 가격</label>
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
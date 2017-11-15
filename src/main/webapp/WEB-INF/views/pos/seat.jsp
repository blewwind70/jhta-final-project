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
    <script>
        $(function() {
        	var $seatBox = $("#seat-box");
        	var screenId = $("#movie-info-box tr.screen-tr").attr("id").replace("screen-tr-", "");
        	var timetableId = $("#hidden-timetableId").val();
        	
        	// 선택된 좌석 가져오는 function
            var getSelectedSeat = function() {
                $("#selected-seat-td").empty();
                
                var selectedSeat = "";
                $("div.selected-seat label").each(function() {
                    selectedSeat += $(this).text() + " ";
                });
                
                return selectedSeat;
            };
            
            // 첫 시작시 seat 정보 AJAX 요청
            $.ajax({
            	type:"GET",
            	url:"seat.esc",
            	data:{screenId:screenId,timetableId:timetableId},
            	dataType:"json",
            	success:function(result) {
            		$(result).each(function() {
            			var htmlContents = "";
            			
            			htmlContents += "<div class='seat seat-" + this.status + " col-sm-1'>";
            			htmlContents += "	<label id='seat-no-" + this.id +"''>" + this.name + "</label>"
            			htmlContents += "</div>";
            			
            			$seatBox.append(htmlContents);
            		});
            	}
            });
            // seat click 위임 event
            $seatBox.on("click","div.seat-Y", function() {
                $(this).toggleClass("selected-seat");
                
                var selectedSeat = getSelectedSeat();
                if(parseInt($("#able-select-seat").text()) < selectedSeat.split(" ").length - 1) {
                    $(this).removeClass("selected-seat");
                    selectedSeat = getSelectedSeat();
                    alert("선택 가능한 좌석을 초과하였습니다.");
                }
                
                $("#selected-seat-td").empty().text(selectedSeat);
            });
            
            // 결제 btn Event
            $("#payment-btn").on("click", function(e) {
            	e.preventDefault();
            	var seatId = "";
            	$("div.selected-seat label").each(function() {
	            	seatId += $(this).attr("id").replace("seat-no-", "") + ",";
            	});
            	
            	$("#hidden-seatId").val(seatId);
            	$(this).closest("form").submit();
            });
        });
    </script>
    <%@ include file="/WEB-INF/views/pos/common/style.jsp" %>
    <style>
        #main-box {
            border: 10px solid #6a5dc0;
            width: 1770px;
			height: 754px;
        }
        #theater-box {
            margin: 20px;
            border: 2px solid black;
            background-color: black;
            width: 1250px;
            height: 700px;
        }
        #info-box {
            margin: 20px;
            border: 2px solid silver;
            width: 450px;
            height: 700px;
        }
        #screen-box {
            margin: 40px;
            margin-left: 150px;
            padding-left: 50px;
            border: 1px solid white;
            color: white;
            width: 900px;
        }
        div#seat-box {
            margin: 50px;
            padding-left: 55px;
        }
        div.seat {
            margin: 20px;
            margin-left: 10px;
            padding-top: 30px;
            border: 1px solid white;
            width: 70px;
            height: 70px;
            color: white;
            cursor: pointer;
            text-align: center;
            border-radius: 5px;
        }
        div.seat-N {
        	background-color: red;
        }
        div.seat-R {
        	border: 1px solid dimgrey;
        	background-color: silver;
        	color: dimgrey;
        }
        div.selected-seat {
            background-color: #6a5dc0;
        }
        #movie-info-box {
            margin: 10px;
            margin-bottom: 250px;
            border-bottom: 0.5px solid silver;
            width: 400px;
        }
        #selected-info-box {
            margin: 10px;
            margin-bottom: 70px;
            border: 0.5px solid silver;
            width: 400px;
            height: 150px;
        }
        #selected-seat-td {
            font-size: 20px;
        }
        #move-btn-box form .btn {
            width: 200px;
            height: 60px;
        }
        #move-btn-box form a {
            padding-top: 17px;
        }
    </style>
</head>
<body>
	<%@ include file="/WEB-INF/views/pos/common/nav.jsp" %>
	
    <div class="container">
        <div id="main-box">
            <div class="row">
                <div id="theater-box" class="col-sm-8">
                    <div id="screen-box" class="row">
                        <div class="col-sm-2">
                            <h4>S</h4>
                        </div>
                        <div class="col-sm-2">
                            <h4>C</h4>
                        </div>
                        <div class="col-sm-2">
                            <h4>R</h4>
                        </div>
                        <div class="col-sm-2">
                            <h4>E</h4>
                        </div>
                        <div class="col-sm-2">
                            <h4>E</h4>
                        </div>
                        <div class="col-sm-2">
                            <h4>N</h4>
                        </div>
                    </div>

                    <div id="seat-box" class="row">
                    
                    </div>
                </div>

                <div id="info-box" class="col-sm-3 pull-right">
                    <div id="movie-info-box" class="row">
                        <table class="table table-condensed">
                            <tbody>
                                <tr>
                                    <th>영화제목</th><td class="text-right">${movieInfo.name }</td>
                                </tr>
                                <tr>
                                    <th>시간</th><td class="text-right"><fmt:formatDate value="${timetable.startedAt }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                </tr>
                                <tr id="screen-tr-${timetable.screenMovie.screen.id }" class="screen-tr">
                                    <th>상영관</th><td class="text-right">${timetable.screenMovie.screen.name }</td>
                                </tr>
                                <tr>
                                    <th>잔여석</th><td class="text-right">${timetable.screenMovie.screen.seatsCount }석</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    
                    <div id="selected-info-box" class="row">
                        <table class="table table-condensed">
                            <tbody>
                                <tr>
                                    <th>선택할 좌석 수</th><td class="text-right"><span id="able-select-seat">${totalAmount }</span> 석</td>
                                </tr>
                                <tr>
                                    <th colspan="2">선택한 좌석</th>
                                </tr>
                                <tr>
                                    <td id="selected-seat-td" class="text-right" colspan="2"></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    
                    <div id="move-btn-box">
                        <form method="post" action="payment.esc">
                        	<input type="hidden" name="movieId" id="hidden-movieId" value="${movieInfo.movie.id }"/>
                        	<input type="hidden" name="timetableId" id="hidden-timetableId" value="${timetable.id }"/>
                        	<input type="hidden" name="priceKeyId" id="hidden-priceKeyId" value="${keyIdList }"/>
                        	<input type="hidden" name="amount" id="hidden-amount" value="${amountList }"/>
                        	<input type="hidden" name="seatId" id="hidden-seatId"/>
                            <button type="submit" id="payment-btn" class="btn btn-boots btn-lg">결제</button>
                            <a href="home.esc" class="btn btn-boots btn-lg pull-right">취소</a>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
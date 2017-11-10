<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<script>
		$(function() {
			setInterval(function() {
                var now = new Date();
                
                $("span#now-time").text(now.getFullYear() + "-" + 
                                        (now.getMonth() + 1) + "-" + 
                                        now.getDate() + " " + 
                                        now.getHours() + ":" + 
                                        now.getMinutes() + ":" + 
                                        now.getSeconds());
            }, 1000);
			
			$("#rest-in-btn").on("click", function() {
				$.ajax({
					type:"GET",
					url:"restin.esc",
					dataType:"json",
					success:function(result) {
						
						var htmlContents = "";
						htmlContents += "<small class='pull-right'>";
						htmlContents += "휴식 시작 시간 :";
						htmlContents += result.restStartedAt;
						htmlContents += "</small>";
						
						$("div#rest-modal-info").append(htmlContents);
					}
				});
			});
			
			$("#work-back-btn").on("click", function() {
				$.ajax({
					type:"GET",
					url:"workback.esc",
					dataType:"json",
					success:function(result) {
						alert("휴식을 종료하였습니다. 휴식종료 시간 : " + result.restEndedAt);
					},
					error:function() {
						
					}
				});
			});
		});
	</script>
	
	<style>
		.modal-dialog.modal-fullsize { width: 100%; height: 100%; margin: 0; padding: 0; }
	</style>
	
	<div id="rest-modal" class="modal fade" style="">
        <div class="modal-dialog modal-fullsize">
            <div class="modal-content">
                <div class="modal-header">
                    <h4>휴식중...</h4>
                </div>

                <div class="modal-body">
                    <div id="search-member-box">
                    	<div id="rest-modal-info" class="jumbotron">
                    		<h1>${sessionScope.LOGIN_INFO.employee.name }님이 휴식 중입니다...</h1>
                    	</div>
                    </div>
                </div>
                
                <div class="modal-footer">
	        	    <div class="text-center">
	                	<button type="button" id="work-back-btn" class="btn btn-boots btn-lg" data-dismiss="modal">휴식 종료</button>
	                </div>
                </div>
            </div>
        </div>
    </div>
	
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="navbar-header">
                <a href="select.html" class="navbar-brand">
                    <img alt="brand" src="/resources/images/pos/logo.jpg" style="width: 150px;"/>
                </a>
            </div>
            
            <div id="nav-ul-box">
                <ul class="nav navbar-nav">
                    <li><p class="navbar-text"><label>출근시간</label> <fmt:formatDate value="${sessionScope.LOGIN_INFO.signedIn }" pattern="HH:mm:ss"/></p></li>
                    <li><p class="navbar-text"><label>POS</label> ${sessionScope.LOGIN_INFO.pos.pid }</p></li>
                    <li><p class="navbar-text"><label>현재시간</label> <span id="now-time"></span></p></li>
                    <li>
                        <p class="navbar-text">
                            <label>${sessionScope.LOGIN_INFO.employee.name }님</label>
                            <button type="button" id="rest-in-btn" class="btn btn-boots text-right" data-toggle="modal" data-target="#rest-modal">휴식</button>
                            <a href="logout.esc" class="btn btn-boots text-right">Log-out</a>
                        </p>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
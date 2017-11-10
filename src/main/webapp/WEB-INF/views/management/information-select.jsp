<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/taglibs.jsp" %>
<html>
<head>
	<title>Home</title>
	<%@ include file="/WEB-INF/views/common/head.jsp" %>
</head>
<body>
	<c:set var="nav_active" value="management" />
	<%@ include file="/WEB-INF/views/common/nav.jsp" %>
	<div class="row">
		<div class="col-md-2 div-side">
			<c:set var="side_active" value="register" />
			<%@ include file="/WEB-INF/views/management/sidebar/sideBar.jsp" %>
		</div>
		<div class="col-md-10">
			<div class="container" style="margin-top: 50px;">
			<h2 class="page-header">고객 정보 조회</h2>
		       <div>
		           <form action="">
		              <div class="form-group form-inline">
		                   <select name="type" id="type" class="form-control">
		                       <option value="id">아이디</option>
		                       <option value="name">이름</option>
		                       <option value="birth">생일</option>
		                       <option value="phone">연락처</option>
		                       <option value="email">메일주소</option>
		                   </select>
		                   
		                   <input type="text" name="search" placeholder="검색어" class="form-control" id="searchValue">
		                   <button class="btn btn-primary" type="button" id="search-btn"><i class="fa fa-search fa-fw"></i>검색</button>
		               </div>
		           </form>
		       </div>
       <div style="overflow: auto;" class="box">
            <form action="">
                <table class="table">
                    <thead>
                        <tr>
                            <th>아이디</th>
                            <th>이름</th>
                            <th>생일</th>
                            <th>연락처</th>
                            <th>메일주소</th>
                        </tr>
                    </thead>
                    <tbody id="mainTbody">
                    	
                    </tbody>
                </table>
                <div class="text-right">
                    <button type="button" class="btn btn-primary" id="btn-open-modal"><i class="fa fa-list fa-fw"></i>상세조회</button>
                </div>
            </form>
        </div>
        
        
        <div id="myModal" class="modal fade" role="dialog">
          <div class="modal-dialog modal-lg"> 


            <div class="modal-content">

              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">상세 정보</h4>
              </div>
              <div class="modal-body">
                <div>
                    <form action="">
                        <table class="table">
                            <tbody>
                                <tr>
                                    <th>아이디</th><td id="id"></td>
                                    <th>이름</th><td id="name"></td>
                                    <th>회원등급</th><td id="rank"></td>
                                </tr>
                                <tr>
                                    <th>생일</th><td id="birth"></td>
                                    <th>연락처</th><td id="phone"></td>
                                    <th>메일주소</th><td id="email"></td>
                                </tr>
                                <tr>
                                    <th>누적포인트</th><td id="miliege"></td>
                                    <th>사용가능포인트</th><td>100</td>
                                    <th>가용 예정 포인트</th><td>2,000</td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                </div>
                <div>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>날짜</th>
                                <th>결제금액</th>
                                <th>적립금</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>2017-10-05</td>
                                <td>20,000</td>
                                <td>2,000</td>
                            </tr>
                        </tbody>
                    </table>
                </div>  
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times-circle fa-fw"></i>취소</button>
              </div>
            </div>
        </div>
        </div>
    </div>
		</div>
	</div>
</body>
<script>
	   $(function() {
	       // 고객테이블 클릭 시 하이라이트 처리
	       $("#mainTbody").on("click", ".detailhighlight", function() {
                $(".detailhighlight").css("background-color", "white");
                $(this).css("background-color", "#FA58F4");
                
                // customer의 id값
                var value = $(this).attr('id');
                console.log(value)
                
                if(value) {
                	// 모달창 열림 스크립트 모달값 조회
         	       $("#btn-open-modal").click(function() {
         	           $("#myModal").modal("show");
         	          $.ajax({
	                    	type: "GET",
	                    	url: "getDetailCustomer.esc",
	                    	data:{id: value},
	                    	dataType: "json",
	                    	success:function(result) {
	                    		$("#id").text(result.id);
	                    		$("#name").text(result.name);
	                    		//$("#rank").text(result.customerRank.type);
	                    		$("#birth").text(result.birth);
	                    		$("#phone").text(result.phone);
	                    		$("#email").text(result.email);
	                    		$("#miliege").text(result.miliege);
	                    	}
	                    })
         	           return false;
         	       })
                	
                }else {
                	
                	alert("값을 선택하지 않았습니다. 선택해주세요");
                	
                	// 모달창 닫힘 스크립트
          	       $("#btn-open-modal").click(function() {
          	           $("#myModal").modal("hide");
          	           return false;
          	       })
                }
	       	})
	       	
	        	// 검색 값 조회
                $("#search-btn").click(function(e) {
                	e.preventDefault();
                	var type = $("#type").val();
                	var searchValue = $("#searchValue").val();
                	if(searchValue) {
	                	$.ajax({
	                		type: "POST",
	                		url: "getSearchCustomers.esc",
	                		data: {opt: type, keyword: searchValue},
	                		dataType: "json",
	                		success: function(result) {
	                			var html = "";
	                			$.each(result, function(index, item) {
	                				html += "<tr class='detailhighlight' id='"+item.id+"'>"
	                    			html += "<td>"+item.id+"</td>"
	                    			html += "<td>"+item.name+"</td>"
	                    			html += "<td>"+item.birth+"</td>"
	                    			html += "<td>"+item.phone+"</td>"
	                    			html += "<td>"+item.email+"</td>"
	                    			html += "</tr>"
	                			})
	                			
	                			$("#mainTbody").html(html);
	                		}
	                	})
                	}else {
                		alert("검색어가 입력되지 않았습니다. 검색어를 입력해 주세요.")
                	}
                })
	       
	       
	       
	   })
</script>
</html>
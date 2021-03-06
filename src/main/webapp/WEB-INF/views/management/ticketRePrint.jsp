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
			<h2 class="page-header">티켓 조회</h2>
       <div>
           <form action="">
              <div class="form-group form-inline">
                   <input type="text" name="search" placeholder="영수증 번호" class="form-control" id="searchValue">
                   <button class="btn btn-primary" type="submit" id="search-btn"><i class="fa fa-search fa-fw"></i>검색</button>
               </div>
           </form>
       </div>
       <div style="overflow: auto;" class="box">
            <form action="">
                <table class="table">
                    <thead>
                        <tr>
                            <th>구매날짜</th>
                            <th>결제금액</th>
                            <th>적립여부</th>
                            
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
                <h4 class="modal-title">티켓 상세 조회</h4>
              </div>
              <div class="modal-body">
                <div>
                    <form action="">
                        <table class="table">
                            <tbody>
                                <tr>
                                    <th>영수증번호</th><td colspan="5" id="rid"></td>
                                </tr>
                                <tr>
                                    <th>구매날짜</th><td colspan="3" id="modal-purchaseDate"></td>
                                    <th>결재금액</th><td id="price"></td>
                                </tr>
                                <tr>
                                    <th>구매타입</th><td colspan="3" id="paymentType"></td>
                                    <th>구매처</th><td id="paymentMethod"></td>
                                </tr>
                                <tr>
                                    <th>단말기 번호</th><td colspan="3" id="posId"></td>
                                    <th>판매자</th><td id="seller"></td>
                                </tr>
                                <tr>
                                    <th>적립여부</th><td id="customerId"></td>
                                    <th>적립ID</th><td id="userName"></td>
                                    <th>이름</th><td id="name"></td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                </div> 
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-info" data-dismiss="modal" id="printAccept"><i class="fa fa-times-circle fa-fw"></i>재출력 승인</button>
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
		   var idValue = "";
		   var ridValue = "";
		   var posValue = "";
		   var purchaseDateValue = "";
		   var no = "";
		   var printed = "";
		   var deleted = "";
           console.log("초기화" + purchaseDateValue);
		   
    		// 고객테이블 클릭 시 하이라이트 처리
   	       $("#btn-open-modal").click(function() {
   	    	   
   	    	   if (!$("tr.active").length) {
   	    		   return;
   	    	   }
   	    	  if(idValue) {
	            	// 모달창 열림 스크립트 모달데이터 조회
	   	    		$("#myModal").modal("show");
	    	           console.log('11');
	    	           console.log({id: idValue, pos: posValue ,purchaseDate: purchaseDateValue, rid: ridValue});
	     	          $.ajax({
	                  	type: "GET",
	                  	url: "getRidDetailSelect.esc",
	                  	data:{id: idValue, pos: posValue ,purchaseDate: purchaseDateValue, rid: ridValue},
	                  	dataType: "json",
	                  	success:function(result) {
	                  		console.log("result" + result.purchaseDate);
	                  		$("#rid").text(result.rid);
	                  		$("#modal-purchaseDate").text(result.purchaseDate);
	                  		$("#price").text(result.price);
	                  		if(result.purchaseType == 'O') {
	                  			$("#paymentType").text('카드');
	                  			$("#paymentMethod").text('온라인');
	                  		}else if(result.purchaseType == 'C') {
	                  			$("#paymentType").text('카드');
	                  			$("#paymentMethod").text('오프라인');
	                  		}else if(result.purchaseType == 'M'){
	                  			$("#paymentType").text('현금');
	                  			$("#paymentMethod").text('오프라인');
	                  		}
	                  		$("#posId").text(result.pos.id);
	                  		$("#seller").text(result.employee.name);
	                  		if(result.customer.id) {
	                     		$("#customerId").text("Y");
	                  		}else{
	                  			$("#customerId").text("N");
	                  		}
	                  		$("#userName").text(result.customer.username);
	                  		$("#name").text(result.customer.name);
	                  		printed = result.printed;
	                  	}
	                  })
	    	           		return false;
	            }else {
	            	
	            	alert("값을 선택하지 않았습니다. 선택해주세요");
	            	
	            	// 모달창 닫힘 스크립트
	      	       $("#btn-open-modal").click(function() {
	      	           $("#myModal").modal("hide");
	      	           return false;
	      	       })
	           }
   	           
   	       })
	       $("#mainTbody").on("click", ".detailhighlight", function() {
	            $("#mainTbody .active").attr("class", "detailhighlight");
	            $(".detailhighlight").css("background-color", "white");
	            $(this).attr("class", "active");

	            // customer의 id값
	            idValue = $(this).attr('id');
	            ridValue = $(this).attr('rid');
	            posValue = $(this).attr('pos');
	            no = $(this).attr('no');
	            deleted = $(this).attr('deleted');
	            purchaseDateValue = $(this).attr('purchaseDate');
	            console.log("초기화 후 값을 담음" + purchaseDateValue + "no" + no + "deleted" + deleted);
	            
	       	})
	       	
	       	$("#printAccept").click(function(e) {
	       		e.preventDefault();
	       		console.log("dddd")
	       		if(printed == 'Y') {
		       		$.ajax({
		       			type: "POST",
		       			url: "updatePrint.esc",
		       			data: {id: no, printed: printed, deleted: deleted},
		       			dateType: "JSON",
		       			success: function() {
		       				alert("승인이 완료됬습니다.");
		       			}
		       		})
		       	}else {
		       		$("#printAccept").hide();
		       	}
	       	})
	       	
         
         // 검색 값 조회
         $("#search-btn").click(function(e) {
         	e.preventDefault();
         	var searchValue = $("#searchValue").val();
         	if(searchValue) {
	         	$.ajax({
	         		type: "POST",
	         		url: "getRidSelect.esc",
	         		data: {rid: searchValue},
	         		dataType: "json",
	         		success: function(result) {
	         			console.log(result)
	         			var html = "";
	        			$.each(result, function(index, item) {
	        				html += "<tr class='detailhighlight' rid='"+item.rid+"' id="+item.customer.id+" pos='"+item.pos.id+"' purchaseDate='"+item.purchaseDate+"' no="+item.id+" deleted="+item.deleted+">"
	            			html += "<td>"+item.purchaseDate+"</td>"
	            			html += "<td>"+item.price+"</td>"
	            			if(item.customer.id) {
		            			html += "<td>Y</td>"
	            			}else {
	            				html += "<td>N</td>"
	            			}
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
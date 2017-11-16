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
			<h2 class="page-header">분실물 조회</h2>
       <div>
           <form action="">
              <div class="form-group form-inline">
                   <select name="type" id="type" class="form-control">
                       <option value="id">번호</option>
                       <option value="itemName">분실물</option>
                       <option value="foundDate">습득날짜</option>
                       <option value="finder">습득자</option>
                       <option value="findLocation">습득위치</option>
                       <option value="status">처리상황</option>
                   </select>
                   
                   <input type="text" name="search" placeholder="검색어" class="form-control" id="searchValue">
                   <button class="btn btn-primary" type="submit" id="search-btn"><i class="fa fa-search fa-fw"></i>검색</button>
               </div>
           </form>
       </div>
       <div style="overflow: auto;" class="box">
            <form action="">
                <table class="table">
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>분실물</th>
                            <th>습득날짜</th>
                            <th>습득자</th>
                            <th>습득위치</th>
                            <th>처리상황</th>
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
        
        <h2 class="page-header">분실물 등록</h2>
        <div style="overflow: auto;" class="box">
            <form class="form-horizontal" action="insertItem.esc">
                <div class="form-group">
                     <label class="control-label col-xs-1" for="lostitem">분실물:</label>
                     <div class="col-sm-5">
                       <input type="text" class="form-control" id="itemName" placeholder="분실물" name="itemName">
                     </div>
                
                     <label class="control-label col-xs-1" for="getdate">습득날짜:</label>
                     <div class="col-sm-5">          
                       <input type="date" class="form-control" id="foundDate" name="foundDate">
                     </div>
                </div>
                <div class="form-group">
                     <label class="control-label col-xs-1" for="getplace">습득위치:</label>
                     <div class="col-sm-5">
                       <input type="text" class="form-control" placeholder="습득위치" id="findLocation" name="findLocation">
                     </div>
                
                     <label class="control-label col-xs-1" for="getpeople">습득자:</label>
                     <div class="col-sm-5">          
                       <input type="text" class="form-control" id="finder" placeholder="습득자" name="finder">
                     </div>
                </div>
                <div class="form-group">        
                    <div class="text-right" style="padding-right: 13px;">
                      <button type="submit" class="btn btn-primary" id="btnInsert"><i class="fa fa-user-plus fa-fw fa-fw"></i>추가</button>
                    </div>
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
                    <form action="updateGiveItem.esc" method="post" id="updateGiveItem">
                        <table class="table" id="detailTable">
                            <tbody>
                                <tr>
                                    <th>번호</th><td id="id"></td>
                                    <th>분실물</th><td id="itemName"></td>
                                    <th>습득날짜</th><td id="foundDate"></td>
                                </tr>
                                <tr>
                                    <th>습득자</th><td id="finder"></td>
                                    <th>습득위치</th><td id="findLocation"></td>
                                </tr>
                                <tr>
                                    <th>처리상황</th>
                                    <td id="selectBoxTd">
                                        <select name="status" id="status" class="form-control">
                                            <option value="K">보관</option>
                                            <option value="G">인계</option>
                                            <option value="P">경찰서 인계</option>
                                        </select>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <div id="insertGive">
                            <table class="table" >
                                <thead>
                                    <tr>
                                        <th>인계자</th>
                                        <th>수령자</th>
                                        <th>수령자 연락처</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                        	<div>
                                        		<input type="hidden" name="id">
                                        	</div>
                                            <div class="form-group">
                                                <input type="text" class="form-control" name="giver" id="giver">
                                            </div>
                                        </td>
                                        <td>
                                            <div class="form-group">
                                                <input type="text" class="form-control" name="receverName" id="receverName">
                                            </div>
                                        </td>
                                        <td>
                                            <div class="form-group">
                                                <input type="text" class="form-control" name="receverPhone" id="receverPhone">
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" id="btnSuccess"><i class="fa fa-check fa-fw"></i>수령완료</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times-circle fa-fw"></i>취소</button>
                        </div>
                    </form>
                </div> 
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
    	 
    	 var value = "";
    	 // 고객테이블 클릭 시 하이라이트 처리
	       $("#mainTbody").on("click", ".detailhighlight", function() {
	    	   $("#mainTbody .active").attr("class", "detailhighlight");
	           $(".detailhighlight").css("background-color", "white");
	           $(this).attr("class", "active");
              
              // customer의 id값
              value = $(this).attr('id');
              console.log(value)
	       })   
              
              	// 모달창 열림 스크립트 모달값 조회
       	       $("#btn-open-modal").click(function(e) {
       	    	    e.preventDefault();
       	       		$("#myModal").modal("show");
	       	   		if($("#status").val() == "K") {
		       			$("#insertGive").hide();
		       			$("#btnSuccess").hide();
		           	 }
	       	      	$("#status").click(function() {
			           if($("#status").val() == "K") {
			           		$("#insertGive").hide();
			           		$("#btnSuccess").hide();
			           	 }else if($("#status").val() == "P") {
			           		$("#insertGive").show();
			           		$("#btnSuccess").show();
			           	 }else if($("#status").val() == "G") {
			           		$("#insertGive").show();
			           		$("#btnSuccess").show();
			           	 }
	       	      	})
	       	      	console.log(value)
	              if(value) {
       	          $.ajax({
	                   	type: "GET",
	                   	url: "getDetailLostItemSelect.esc",
	                   	data:{id: value},
	                   	dataType: "json",
	                   	success:function(result) {
	                   		console.log(result)
	                   		$("#detailTable #id").text(result.id);
	                   		$("#detailTable #itemName").text(result.itemName);
	                   		$("#detailTable #foundDate").text(result.foundDate);
	                   		$("#detailTable #finder").text(result.finder);
	                   		$("#detailTable #findLocation").text(result.findLocation);
	                   		$("input[name=id]").val(result.id);
	                   		
	                   		var html = "";
	                   		
	                   		if(result.returnedAt) {
	                   			var statusValue = "";
	                   			if(result.status == "G") {
	                   				var statusValue = "인계"; 
	                   			}
	                   			if(result.status == "P") {
	                   				var statusValue = "경찰서 인계";
	                   			}
	                   			$("#status").remove();
	                   			$("#selectBoxTd").append("<input class='form-control' value='"+statusValue+"' readonly='readonly' id='status'>")
	                   			$("#insertGive").hide();
				           		$("#btnSuccess").hide();
	                   		}else {
	                   			
	                   			html += "<select name='status' id='status' class='form-control'>"
	                   			html += "<option value='K'>보관</option>"
	                   			html += "<option value='G'>인계</option>"
	                   			html += "<option value='P'>경찰서 인계</option>"
	                   			html += "</select>"
	                   			$("#status").remove();
	                   			$("#selectBoxTd").append(html)
	                   			$("#insertGive").show();
				           		$("#btnSuccess").show();
	                   		}
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
              	
              // 모달창 안에서 물건을 돌려주었을 때 입력폼에 값을 넣지 않았을 때 알럿을 띄우는 작업
              $("#btnSuccess").click(function(e) {
            	  var giver = $("#giver").val();
            	  var receverName = $("#receverName").val();
            	  var receverPhone = $("#receverPhone").val();
            	  var id = $("input[name=id]").val();
            	  if(giver && receverName && receverPhone) {
	            	  $("#updateGiveItem").submit();
	            	  $("#myModal").modal("hide");
            	  }else {
            		  e.preventDefault();
            		  alert("값을 입력하지 않았습니다. 값을 입력해 주세요.");
            		  return;
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
          		url: "getLostItemSelect.esc",
          		data: {opt: type, keyword: searchValue},
          		dataType: "json",
          		success: function(result) {
          			console.log(result);
          			var html = "";
          			$.each(result, function(index, item) {
          				html += "<tr class='detailhighlight' id='"+item.id+"'>"
              			html += "<td>"+item.id+"</td>"
              			html += "<td>"+item.itemName+"</td>"
              			html += "<td>"+item.foundDate+"</td>"
              			html += "<td>"+item.finder+"</td>"
              			html += "<td>"+item.findLocation+"</td>"
              			html += "<td>"+item.status+"</td>"
              			html += "</tr>"
          			})
          			
          			$("#mainTbody").html(html);
          		}
          	})
         	}else {
         		alert("검색어가 입력되지 않았습니다. 검색어를 입력해 주세요.")
         	}
         })
         
         // 분실물 등록 시 입력폼에 값을 입력하지 않으면 알럿이 띄우게 만듬
         $("#btnInsert").click(function(e) {
        	 var itemName = $("#itemName").val();
        	 var foundDate = $("#foundDate").val();
        	 var findLocation = $("#findLocation").val();
        	 var finder = $("#finder").val();
        	 if(itemName && foundDate && findLocation && finder) {
        		 $("#btnInsert").submit();		 
        	 }else {
        		 e.preventDefault();
        		 alert("값을 입력하지 않았습니다. 값을 입력해 주세요.");
        	 }
         })
     })
</script>
</html>
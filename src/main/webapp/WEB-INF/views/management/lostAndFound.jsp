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
                       <option value="">번호</option>
                       <option value="">분실물</option>
                       <option value="">습득날짜</option>
                       <option value="">습득자</option>
                       <option value="">습득위치</option>
                       <option value="">처리상황</option>
                   </select>
                   
                   <input type="text" name="search" placeholder="검색어" class="form-control">
                   <button class="btn btn-primary" type="submit"><i class="fa fa-search fa-fw"></i>검색</button>
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
                    <tbody>
                        <tr class="detailhighlight">
                            <td>1</td>
                            <td>검은색 지갑</td>
                            <td>2017-10-30</td>
                            <td>김환희</td>
                            <td>매표</td>
                            <td>보관</td>
                        </tr>
                        <tr class="detailhighlight">
                            <td>2</td>
                            <td>검은색 지갑</td>
                            <td>2017-10-30</td>
                            <td>김환희</td>
                            <td>매표</td>
                            <td>보관</td>
                        </tr>
                        <tr class="detailhighlight">
                            <td>3</td>
                            <td>검은색 지갑</td>
                            <td>2017-10-30</td>
                            <td>김환희</td>
                            <td>매표</td>
                            <td>보관</td>
                        </tr>
                        <tr class="detailhighlight">
                            <td>4</td>
                            <td>검은색 지갑</td>
                            <td>2017-10-30</td>
                            <td>김환희</td>
                            <td>매표</td>
                            <td>보관</td>
                        </tr>
                        
                    </tbody>
                </table>
                <div class="text-right">
                    <button type="button" class="btn btn-primary" id="btn-open-modal"><i class="fa fa-list fa-fw"></i>상세조회</button>
                </div>
            </form>
        </div>
        
        <h2 class="page-header">분실물 등록</h2>
        <div style="overflow: auto;" class="box">
            <form class="form-horizontal" action="/action_page.php">
                <div class="form-group">
                     <label class="control-label col-xs-1" for="lostitem">분실물:</label>
                     <div class="col-sm-5">
                       <input type="email" class="form-control" id="lostitem" placeholder="분실물" name="lostitem">
                     </div>
                
                     <label class="control-label col-xs-1" for="getdate">습득날짜:</label>
                     <div class="col-sm-5">          
                       <input type="date" class="form-control" id="getdate" name="getdate">
                     </div>
                </div>
                <div class="form-group">
                     <label class="control-label col-xs-1" for="getplace">습득위치:</label>
                     <div class="col-sm-5">
                       <input type="text" class="form-control" placeholder="습득위치" id="getplace" name="getplace">
                     </div>
                
                     <label class="control-label col-xs-1" for="getpeople">습득자:</label>
                     <div class="col-sm-5">          
                       <input type="text" class="form-control" id="getpeople" placeholder="습득자" name="getpeople">
                     </div>
                </div>
                <div class="form-group">
                     <label class="control-label col-xs-1" for="detail">상세설명:</label>
                     <div class="col-sm-10">
                       <textarea name="detail" id="detail" cols="140" rows="10"></textarea>
                     </div>
                </div>
                <div class="form-group">        
                    <div class="text-right" style="padding-right: 13px;">
                      <button type="submit" class="btn btn-primary"><i class="fa fa-user-plus fa-fw fa-fw"></i>추가</button>
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
                    <form action="">
                        <table class="table">
                            <tbody>
                                <tr>
                                    <th>번호</th><td>1</td>
                                    <th>분실물</th><td>검은색 지갑</td>
                                    <th>습득날짜</th><td>2017-10-30</td>
                                </tr>
                                <tr>
                                    <th>습득자</th><td>김환희</td>
                                    <th>습득위치</th><td>매표</td>
                                </tr>
                                <tr>
                                    <th>처리상황</th>
                                    <td>
                                        <select name="" id="" class="form-control">
                                            <option value="">보관</option>
                                            <option value="">인계</option>
                                            <option value="">경찰서 인계</option>
                                        </select>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <div>
                            <table class="table">
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
                                            <div class="form-group">
                                                <input type="text" class="form-control">
                                            </div>
                                        </td>
                                        <td>
                                            <div class="form-group">
                                                <input type="text" class="form-control">
                                            </div>
                                        </td>
                                        <td>
                                            <div class="form-group">
                                                <input type="text" class="form-control">
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary"><i class="fa fa-check fa-fw"></i>수령완료</button>
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
         $("#btn-open-modal").click(function() {
             $("#myModal").modal("show");
             return false;
         })
         
         $(".detailhighlight").click(function() {
                $(".detailhighlight").css("background-color", "white");
                $(this).css("background-color", "#FA58F4");
                
         })
     })
</script>
</html>